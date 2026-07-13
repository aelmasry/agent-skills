# Export portable Cursor config from Windows into the repo (PowerShell).
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$CursorDir = Join-Path $env:USERPROFILE ".cursor"
$CursorUserDir = Join-Path $env:APPDATA "Cursor\User"
$KeybindingsFile = "keybindings.win32.json"

Write-Host "Exporting Cursor config from: Windows"
Write-Host "Repo: $RepoRoot"
Write-Host ""

New-Item -ItemType Directory -Force -Path (Join-Path $RepoRoot "config") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $RepoRoot "commands") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $RepoRoot "prompts") | Out-Null

$cli = if (Get-Command cursor -ErrorAction SilentlyContinue) { "cursor" }
       elseif (Get-Command code -ErrorAction SilentlyContinue) { "code" }
       else { $null }
if ($cli) {
  & $cli --list-extensions | Set-Content (Join-Path $RepoRoot "config\extensions.txt")
  $count = (Get-Content (Join-Path $RepoRoot "config\extensions.txt")).Count
  Write-Host "  -> config/extensions.txt ($count extensions)"
} else {
  Write-Warning "Neither cursor nor code CLI found; skipping extensions export"
}

$commandsSrc = Join-Path $CursorDir "commands"
if (Test-Path $commandsSrc) {
  robocopy $commandsSrc (Join-Path $RepoRoot "commands") /MIR /NFL /NDL /NJH /NJS | Out-Null
  Write-Host "  -> commands/"
}

$promptsSrc = Join-Path $CursorDir "prompts"
if (Test-Path $promptsSrc) {
  robocopy $promptsSrc (Join-Path $RepoRoot "prompts") /MIR /NFL /NDL /NJH /NJS | Out-Null
  Write-Host "  -> prompts/"
}

$kbSrc = Join-Path $CursorUserDir "keybindings.json"
if (Test-Path $kbSrc) {
  Copy-Item $kbSrc (Join-Path $RepoRoot "config\$KeybindingsFile")
  Write-Host "  -> config/$KeybindingsFile"
}

$settingsSrc = Join-Path $CursorUserDir "settings.json"
if (Test-Path $settingsSrc) {
  Copy-Item $settingsSrc (Join-Path $RepoRoot "config\settings.exported.json")
  Write-Host "  -> config/settings.exported.json (review before replacing settings.json)"
}

if (Test-Path (Join-Path $CursorDir "mcp.json")) {
  Write-Host ""
  Write-Host "MCP: update config/mcp.json.example manually if servers changed."
  Write-Host "Never commit ~/.cursor/mcp.json with real tokens."
}

Write-Host ""
Write-Host "Done. Review changes, then:"
Write-Host "  git diff"
Write-Host "  git add -A && git commit -m 'sync cursor config from $env:COMPUTERNAME'"
