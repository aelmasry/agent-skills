# Multi-machine Cursor sync (macOS · Ubuntu/Linux · Windows)

One **private** repo, any number of machines. Git is the source of truth for everything Cursor cannot sync by itself.

## What syncs where

| Item | How | macOS | Linux | Windows |
|------|-----|-------|-------|---------|
| Skills | symlink | `~/.cursor/skills/`, `~/.claude/skills/`, `~/.agents/skills/` | same | `%USERPROFILE%\.cursor\skills\`, `.claude\skills\`, `.agents\skills\` |
| Slash commands | symlink | `~/.cursor/commands/` | same | `%USERPROFILE%\.cursor\commands\` |
| Prompts | symlink | `~/.cursor/prompts/` | same | `%USERPROFILE%\.cursor\prompts\` |
| Settings | copy | `~/Library/Application Support/Cursor/User/` | `~/.config/Cursor/User/` | `%APPDATA%\Cursor\User\` |
| Keybindings | platform file | `keybindings.darwin.json` | `keybindings.linux.json` | `keybindings.win32.json` |
| Extensions | `extensions.txt` + CLI | `cursor --install-extension` | same | same |
| MCP (custom) | template + secrets | `~/.cursor/mcp.json` | same | same |
| Plugin MCP | OAuth per machine | Cursor UI | Cursor UI | Cursor UI |

## Do NOT commit

- `~/.cursor/extensions/` (downloaded binaries)
- `~/.cursor/plugins/cache/`
- `workspaceStorage/`, `History/`, `chats/`, `plans/`
- `~/.cursor/mcp.json` with real tokens
- `~/.cursor-secrets.env` or `secrets.env`
- `config/settings.exported.json` (export scratch file)

## Daily workflow

### After changes on any machine

**macOS / Linux / Git Bash:**

```bash
cd ~/alisalem/agent-skills   # or your clone path
./scripts/export.sh
git add -A && git commit -m "sync cursor config"
git push
```

**Windows PowerShell:**

```powershell
cd ~\alisalem\agent-skills
.\scripts\export.ps1
git add -A; git commit -m "sync cursor config"; git push
```

### On other machines

```bash
git pull
./scripts/bootstrap.sh
```

```powershell
git pull
.\scripts\bootstrap.ps1
```

Restart Cursor after bootstrap.

## First-time setup

### macOS / Ubuntu / Linux

```bash
git clone git@github.com:aelmasry/agent-skills.git
cd agent-skills
cp secrets.env.example ~/.cursor-secrets.env
chmod 600 ~/.cursor-secrets.env
# edit tokens — never commit
./scripts/bootstrap.sh
```

### Windows (PowerShell)

```powershell
git clone git@github.com:aelmasry/agent-skills.git
cd agent-skills
Copy-Item secrets.env.example $env:USERPROFILE\.cursor-secrets.env
# edit tokens — never commit
.\scripts\bootstrap.ps1
```

Then in Cursor on **each machine**:

1. Enable the same marketplace **plugins**
2. Complete OAuth for plugin MCP (Notion, Figma, Datadog…)
3. Add machine-local overrides if needed (Python path, etc.)

## Platform differences

- **Keybindings:** `cmd` on Mac, `ctrl` on Linux and Windows — separate files in `config/`.
- **Symlinks on Windows:** enable **Developer Mode** (Settings → System → For developers) or run PowerShell as admin.
- **Extensions:** some Mac-only extensions fail on Linux/Windows — remove from `extensions.txt` after bootstrap reports failures.
- **Paths:** `python.defaultInterpreterPath` and absolute paths stay machine-local.
- **Git Bash on Windows:** can use `bootstrap.sh` / `export.sh` instead of `.ps1` scripts.

## Optional: Cursor Settings Sync

Turn on **Settings Sync** in Cursor (same account) for a fast baseline. Keep this repo as source of truth for skills, commands, prompts, MCP templates, and version history.

## Secrets

1. Copy `secrets.env.example` → `~/.cursor-secrets.env` (each machine)
2. Fill values locally
3. Run bootstrap to render `~/.cursor/mcp.json`

Rotate any token that was ever committed to git or exposed in chat.

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Symlink fails on Windows | Enable Developer Mode or use `bootstrap.ps1` as admin |
| MCP servers empty | Fill `~/.cursor-secrets.env`, re-run bootstrap |
| Extension install failed | Remove extension ID from `extensions.txt`, commit, re-bootstrap |
| Slash commands missing | Check `ls -la ~/.cursor/commands` points to repo |
| `gh push` denied | Log in as repo owner (`aelmasry`), not a collaborator account |
