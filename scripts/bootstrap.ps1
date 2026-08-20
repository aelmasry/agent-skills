# Bootstrap Cursor on Windows from this repo (PowerShell).
# Requires: Cursor CLI in PATH, Python 3 for MCP rendering.
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$CursorDir = Join-Path $env:USERPROFILE ".cursor"
$CursorUserDir = Join-Path $env:APPDATA "Cursor\User"
$SecretsFile = if ($env:CURSOR_SECRETS_FILE) { $env:CURSOR_SECRETS_FILE } else { Join-Path $env:USERPROFILE ".cursor-secrets.env" }
$KeybindingsFile = "keybindings.win32.json"

function Backup-IfExists([string]$Path) {
  if (Test-Path $Path) {
    $stamp = Get-Date -Format "yyyyMMddHHmmss"
    Copy-Item $Path "$Path.bak.$stamp"
  }
}

function Link-Dir([string]$Source, [string]$Dest) {
  if (Test-Path $Dest) {
    Remove-Item $Dest -Recurse -Force
  }
  New-Item -ItemType SymbolicLink -Path $Dest -Target $Source | Out-Null
}

Write-Host "Bootstrapping Cursor from: $RepoRoot"
Write-Host "OS: Windows"
Write-Host ""

# 1) Skills — Cursor, Claude Code, and OpenCode (~/.agents)
function Install-Skills([string]$Target, [bool]$WithReferences) {
  New-Item -ItemType Directory -Force -Path $Target | Out-Null
  Get-ChildItem (Join-Path $RepoRoot "skills") -Directory | Where-Object { $_.Name -ne "_archive" } | ForEach-Object {
    $dest = Join-Path $Target $_.Name
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    New-Item -ItemType SymbolicLink -Path $dest -Target $_.FullName | Out-Null
    Write-Host "  -> $($_.Name)"
  }
  Get-ChildItem $Target -ErrorAction SilentlyContinue | ForEach-Object {
    if ($_.Name -eq "references") { return }
    $canonical = Join-Path $RepoRoot "skills" $_.Name
    if (-not (Test-Path $canonical)) {
      Remove-Item $_.FullName -Force -Recurse -ErrorAction SilentlyContinue
      Write-Host "  removed stale: $($_.Name)"
    }
  }
  if ($WithReferences) {
    $refsSource = Join-Path $RepoRoot "references"
    $refsDest = Join-Path $Target "references"
    if (Test-Path $refsDest) { Remove-Item $refsDest -Recurse -Force }
    New-Item -ItemType SymbolicLink -Path $refsDest -Target $refsSource | Out-Null
    Write-Host "  -> references"
  }
}

Write-Host "Skills -> Cursor"
Install-Skills (Join-Path $CursorDir "skills") $true
Write-Host "Skills -> Claude Code"
Install-Skills (Join-Path $env:USERPROFILE ".claude\skills") $false
Write-Host "Skills -> OpenCode / agents"
Install-Skills (Join-Path $env:USERPROFILE ".agents\skills") $false
Write-Host ""

# 2) Commands + prompts
New-Item -ItemType Directory -Force -Path $CursorDir | Out-Null
Link-Dir (Join-Path $RepoRoot "commands") (Join-Path $CursorDir "commands")
Write-Host "Linked commands -> $(Join-Path $CursorDir 'commands')"
Link-Dir (Join-Path $RepoRoot "prompts") (Join-Path $CursorDir "prompts")
Write-Host "Linked prompts -> $(Join-Path $CursorDir 'prompts')"

# 3) Settings + keybindings
New-Item -ItemType Directory -Force -Path $CursorUserDir | Out-Null
$settingsSrc = Join-Path $RepoRoot "config\settings.json"
if (Test-Path $settingsSrc) {
  Backup-IfExists (Join-Path $CursorUserDir "settings.json")
  Copy-Item $settingsSrc (Join-Path $CursorUserDir "settings.json")
  Write-Host "Installed settings.json"
}
$kbSrc = Join-Path $RepoRoot "config\$KeybindingsFile"
if (Test-Path $kbSrc) {
  Backup-IfExists (Join-Path $CursorUserDir "keybindings.json")
  Copy-Item $kbSrc (Join-Path $CursorUserDir "keybindings.json")
  Write-Host "Installed keybindings from $KeybindingsFile"
}

# 4) MCP
$mcpTemplate = Join-Path $RepoRoot "config\mcp.json.example"
$mcpDest = Join-Path $CursorDir "mcp.json"
if (Test-Path $mcpTemplate) {
  if (Test-Path $SecretsFile) {
    Get-Content $SecretsFile | ForEach-Object {
      if ($_ -match '^\s*([A-Za-z_][A-Za-z0-9_]*)=(.*)$') {
        Set-Item -Path "env:$($Matches[1])" -Value $Matches[2]
      }
    }
    $py = @'
import os, sys
from pathlib import Path
template = Path(sys.argv[1]).read_text()
for key, value in os.environ.items():
    template = template.replace("${" + key + "}", value)
Path(sys.argv[2]).write_text(template)
'@
    $py | python - $mcpTemplate $mcpDest
    Write-Host "Rendered MCP config -> $mcpDest"
  } else {
    Write-Host "Skip MCP: create $SecretsFile from secrets.env.example"
  }
}

# 5) Extensions
$extFile = Join-Path $RepoRoot "config\extensions.txt"
if (Test-Path $extFile) {
  $cli = if (Get-Command cursor -ErrorAction SilentlyContinue) { "cursor" }
         elseif (Get-Command code -ErrorAction SilentlyContinue) { "code" }
         else { $null }
  if ($cli) {
    Write-Host "Installing extensions via $cli (this may take a while)..."
    Get-Content $extFile | ForEach-Object {
      $ext = $_.Trim()
      if (-not $ext -or $ext.StartsWith("#")) { return }
      & $cli --install-extension $ext --force 2>$null
      if ($LASTEXITCODE -ne 0) { Write-Host "  failed: $ext" }
    }
    Write-Host "Extensions install pass complete"
  } else {
    Write-Host "Skip extensions: cursor/code CLI not found"
  }
}

Write-Host ""
Write-Host "Bootstrap complete."
Write-Host "Plugin MCP servers (Notion, Figma, etc.) may need one-time OAuth on this machine."
Write-Host "Verify: dir $SkillsTarget; dir $(Join-Path $CursorDir 'commands')"
