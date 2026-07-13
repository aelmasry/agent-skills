# Migration: prompts repo → cursor-skills (handoff)

This document captures the full context from planning sessions so you can continue in a new Cursor chat opened on the `cursor-skills` repo.

---

## Goal

Consolidate **everything Cursor-related** into one repo:

**https://github.com/aelmasry/cursor-skills**

- Skills (already existed — 57 skills)
- Slash commands
- Reusable prompts library
- Settings, keybindings, extensions manifest
- MCP template + local secrets
- Bootstrap/export scripts for **Mac ↔ Ubuntu ↔ Windows** sync

**Retire** the separate empty repo: `~/alisalem/prompts` (archive or delete on GitHub if created).

---

## Why one repo?

| Before | After |
|--------|-------|
| `prompts` repo (empty, unclear purpose) | `cursor-skills/prompts/` |
| Skills in repo, config scattered on disk | `cursor-skills/config/` + scripts |
| `~/.agents/skills` copies, no `~/.cursor/skills` symlink | `install.sh` / `bootstrap.sh` symlinks |
| Manual sync between machines | `export.sh` → git push → `bootstrap.sh` / `bootstrap.ps1` |

---

## Current state (as of 2026-07-13)

### Done locally (NOT yet pushed to GitHub)

Uncommitted changes in `~/alisalem/cursor-skills`:

```
?? SYNC.md
?? commands/          (8 slash commands exported from Mac)
?? config/
    extensions.txt   (142 extensions)
    settings.json    (portable, machine-specific paths removed)
    keybindings.darwin.json
    keybindings.linux.json
    mcp.json.example (no real tokens)
?? prompts/          (README only, ready for content)
?? scripts/bootstrap.sh
?? scripts/export.sh
?? secrets.env.example
 M .gitignore
 M README.md
```

### Mac machine facts

- `~/.cursor/skills` — **did not exist** before bootstrap (skills were in `~/.agents/skills` as copies)
- `~/.cursor/commands/` — 8 commands (now in repo `commands/`)
- 142 extensions via `code --list-extensions`
- `~/.cursor/mcp.json` — has real tokens (must stay local, use `~/.cursor-secrets.env`)
- GitHub CLI logged in as `aliabdulhafez` but repo owner is `aelmasry` (push needs `aelmasry` account)

### Ubuntu machine

- Not set up yet — will `git clone` + `bootstrap.sh` after Mac is committed and pushed

---

## Target repo structure

```
cursor-skills/
├── skills/                    # 57 global Cursor skills
├── references/                # Shared checklists
├── commands/                  # Slash commands → ~/.cursor/commands
├── prompts/                   # Reusable prompts → ~/.cursor/prompts
│   ├── coding/
│   ├── review/
│   ├── writing/
│   └── meta/
├── config/
│   ├── settings.json
│   ├── keybindings.darwin.json
│   ├── keybindings.linux.json
│   ├── extensions.txt
│   └── mcp.json.example
├── scripts/
│   ├── bootstrap.sh           # Full install (Mac + Ubuntu)
│   ├── export.sh              # Export machine → repo
│   ├── install.sh             # Skills-only (legacy)
│   └── add-*.sh               # Persona conversion helpers
├── install.sh
├── SYNC.md                    # Daily Mac ↔ Ubuntu workflow
├── MIGRATION.md               # This file
├── secrets.env.example
└── README.md
```

---

## What syncs vs what does NOT

### Syncs via Git + bootstrap

- Skills, references, commands, prompts
- settings.json, keybindings (per OS)
- extensions.txt → installed via CLI
- mcp.json.example + local secrets file

### Does NOT sync (by design)

- `~/.cursor/extensions/` binaries
- `~/.cursor/plugins/cache/`
- chats, plans, History, workspaceStorage
- Plugin MCP OAuth (Notion, Figma, Datadog…) — reinstall + login per machine
- Machine-specific paths (python interpreter, temp Postman paths)

### Optional complement

Cursor **Settings Sync** (same account) for quick settings/extensions baseline — repo remains source of truth for skills, commands, prompts, MCP templates.

---

## Migration plan (checklist)

### Phase 1 — Finish Mac setup (work machine)

- [ ] Review uncommitted files: `git status && git diff`
- [ ] Create `~/.cursor-secrets.env` from `secrets.env.example` (fill tokens locally)
- [ ] Run `./scripts/bootstrap.sh` on Mac
- [ ] Verify:
  - [ ] `ls -la ~/.cursor/skills` → symlinks to repo
  - [ ] `ls -la ~/.cursor/commands` → symlink to repo
  - [ ] `ls -la ~/.cursor/prompts` → symlink to repo
  - [ ] Cursor recognizes slash commands (/review, /spec, etc.)
  - [ ] MCP servers work after secrets fill
- [ ] Commit and push from `aelmasry` account:
  ```bash
  git add -A
  git commit -m "Add multi-machine sync: config, commands, prompts, bootstrap scripts"
  git push origin master
  ```

### Phase 2 — Archive prompts repo

- [ ] Confirm nothing valuable in `~/alisalem/prompts` (it was empty)
- [ ] Delete local folder OR keep as redirect note
- [ ] Archive/delete GitHub repo if one was created for prompts

### Phase 3 — Ubuntu setup (home machine)

- [ ] `git clone git@github.com:aelmasry/cursor-skills.git`
- [ ] `cp secrets.env.example ~/.cursor-secrets.env` and fill tokens
- [ ] `./scripts/bootstrap.sh`
- [ ] Re-enable Cursor plugins from marketplace + OAuth
- [ ] Remove any extensions from `extensions.txt` that fail on Linux

### Phase 4 — Populate prompts library

- [ ] Create starter prompts in `prompts/coding/`, `review/`, `writing/`, `meta/`
- [ ] Migrate any prompts from chat history or notes
- [ ] Document usage in `prompts/README.md`

### Phase 5 — Ongoing workflow

- [ ] Mac: after changes → `./scripts/export.sh` → commit → push
- [ ] Ubuntu: `git pull` → `./scripts/bootstrap.sh`
- [ ] Rotate MCP tokens if they were ever exposed in chat/logs

---

## Security reminders

1. **Never commit** `~/.cursor/mcp.json`, `~/.cursor-secrets.env`, or `secrets.env`
2. `mcp.json.example` uses `${VAR}` placeholders only
3. Tokens in Apidog/Trello were visible in a prior session — **rotate them**
4. `.gitignore` already excludes secrets and `config/settings.exported.json`

---

## Copy-paste prompt for new Cursor chat

Open the `cursor-skills` repo in Cursor, start a new chat, and paste the block below.

---

```
You are helping me complete the migration of my Cursor setup into this repo: aelmasry/cursor-skills.

## Context

I have two machines:
- Work: macOS (primary, where config was exported from)
- Home: Ubuntu (needs clone + bootstrap)

I decided to retire a separate empty `prompts` repo and consolidate everything here:
- 57 global skills (already in skills/)
- Slash commands (commands/)
- Reusable prompts library (prompts/ — mostly empty)
- Portable Cursor config (config/)
- Mac ↔ Ubuntu sync scripts (scripts/bootstrap.sh, scripts/export.sh)

Read these files first:
- MIGRATION.md (full handoff + checklist)
- SYNC.md (daily sync workflow)
- README.md (repo overview)

## What's already done (local, may need push)

- commands/ — 8 slash commands from ~/.cursor/commands
- config/extensions.txt — 142 extensions
- config/settings.json — portable settings
- config/keybindings.darwin.json + keybindings.linux.json
- config/mcp.json.example + secrets.env.example
- scripts/bootstrap.sh + scripts/export.sh
- SYNC.md, updated README.md and .gitignore

## What I need you to do

1. Read MIGRATION.md and confirm current git status
2. Walk me through Phase 1 checklist on Mac:
   - review changes
   - setup ~/.cursor-secrets.env
   - run bootstrap.sh
   - verify symlinks and slash commands
3. Help me commit and push (repo owner is aelmasry, not aliabdulhafez)
4. Create starter prompts in prompts/ (coding, review, writing, meta) based on my existing commands/ and skills/
5. Prepare exact instructions for Ubuntu Phase 3

## Constraints

- Never commit secrets or real mcp.json tokens
- Keep changes minimal and focused
- Match existing repo conventions (install.sh style, bash scripts)
- Do not delete ~/alisalem/prompts unless I explicitly confirm

Start by reading MIGRATION.md and running git status, then propose the next 3 concrete steps.
```

---

## Quick commands reference

```bash
# Full install on any machine
./scripts/bootstrap.sh

# Export current machine state into repo
./scripts/export.sh

# Skills only
./install.sh

# Mac Cursor paths
# Settings: ~/Library/Application Support/Cursor/User/settings.json
# Cursor:    ~/.cursor/

# Ubuntu Cursor paths
# Settings: ~/.config/Cursor/User/settings.json
# Cursor:    ~/.cursor/
```
