# Cursor Skills — multi-machine sync hub

Private repo for syncing your full [Cursor](https://cursor.sh) setup across **macOS**, **Ubuntu/Linux**, and **Windows**.

Git is the source of truth for everything Cursor cannot sync by itself: skills, slash commands, prompts, settings, keybindings, extensions manifest, and MCP templates.

```
Define → Plan → Build → Verify → Review → Ship
  spec     plan    code    test     review   deploy
```

## Quick start (any machine)

```bash
git clone git@github.com:aelmasry/cursor-skills.git
cd cursor-skills
cp secrets.env.example ~/.cursor-secrets.env   # fill locally — never commit
chmod 600 ~/.cursor-secrets.env                # macOS / Linux
./scripts/bootstrap.sh
```

**Windows (PowerShell):**

```powershell
git clone git@github.com:aelmasry/cursor-skills.git
cd cursor-skills
Copy-Item secrets.env.example $env:USERPROFILE\.cursor-secrets.env
# edit tokens locally — never commit
.\scripts\bootstrap.ps1
```

Then restart Cursor. Enable marketplace **plugins** and complete OAuth (Notion, Figma, Datadog, etc.) on each machine.

## Daily sync workflow

```bash
# Machine where you made changes (Mac / Linux / Git Bash)
./scripts/export.sh
git add -A && git commit -m "sync cursor config"
git push

# Other machines
git pull
./scripts/bootstrap.sh          # Mac / Linux / Git Bash
# .\scripts\bootstrap.ps1       # Windows PowerShell
```

See **[SYNC.md](SYNC.md)** for paths, platform notes, and what does not sync.

## What gets synced

| Item | Repo path | Installed to |
|------|-----------|--------------|
| Skills (57) | `skills/` | `~/.cursor/skills/` (symlinks) |
| Slash commands | `commands/` | `~/.cursor/commands/` |
| Prompts | `prompts/` | `~/.cursor/prompts/` |
| Settings | `config/settings.json` | Cursor User folder (per OS) |
| Keybindings | `config/keybindings.*.json` | Cursor User folder |
| Extensions | `config/extensions.txt` | installed via CLI |
| MCP servers | `config/mcp.json.example` + local secrets | `~/.cursor/mcp.json` |

### Does NOT sync (by design)

- Extension binaries (`~/.cursor/extensions/`)
- Plugin cache, chats, plans, workspace storage
- Real MCP tokens (`~/.cursor/mcp.json`, `~/.cursor-secrets.env`)
- Machine-specific paths (Python interpreter, temp folders)

## Repo structure

```
cursor-skills/
├── skills/                  # 57 global Cursor skills
├── references/              # Shared engineering checklists
├── commands/                # Slash commands (/review, /spec, /build…)
├── prompts/                 # Reusable prompt library
│   ├── coding/
│   ├── review/
│   ├── writing/
│   └── meta/
├── config/
│   ├── settings.json
│   ├── keybindings.darwin.json
│   ├── keybindings.linux.json
│   ├── keybindings.win32.json
│   ├── extensions.txt
│   └── mcp.json.example
├── scripts/
│   ├── bootstrap.sh         # Install — Mac / Linux / Git Bash
│   ├── bootstrap.ps1        # Install — Windows PowerShell
│   ├── export.sh            # Export — Mac / Linux / Git Bash
│   ├── export.ps1           # Export — Windows PowerShell
│   ├── platform.sh          # Shared OS detection
│   └── install.sh           # Skills-only (legacy)
├── SYNC.md                  # Multi-machine sync guide
├── MIGRATION.md             # Migration handoff checklist
└── secrets.env.example      # MCP token template (local only)
```

## Platform paths

| | macOS | Linux | Windows |
|---|-------|-------|---------|
| Cursor config | `~/.cursor/` | `~/.cursor/` | `%USERPROFILE%\.cursor\` |
| User settings | `~/Library/Application Support/Cursor/User/` | `~/.config/Cursor/User/` | `%APPDATA%\Cursor\User\` |
| Secrets file | `~/.cursor-secrets.env` | same | `%USERPROFILE%\.cursor-secrets.env` |
| Bootstrap | `./scripts/bootstrap.sh` | same | `.\scripts\bootstrap.ps1` |
| Keybindings file | `keybindings.darwin.json` | `keybindings.linux.json` | `keybindings.win32.json` |

**Windows notes:** Enable **Developer Mode** (Settings → System → For developers) so symlinks work without admin. Git Bash can also run `bootstrap.sh`.

## Secrets and security

1. Copy `secrets.env.example` → `~/.cursor-secrets.env` on each machine
2. Fill tokens locally — **never commit** secrets or real `mcp.json`
3. `bootstrap` renders `~/.cursor/mcp.json` from the template + secrets
4. Rotate any token that was ever exposed in chat or logs
5. This repo is **private** — still treat secrets as machine-local

## Slash commands

| Command | Purpose |
|---------|---------|
| `/spec` | Spec-driven development — write SPEC.md before code |
| `/plan` | Break work into verifiable tasks |
| `/build` | Incremental implementation (add `auto` for full plan) |
| `/test` | Test strategy and coverage |
| `/review` | Five-axis code review |
| `/audit` | Security-first codebase audit — report first, fix after confirm |
| `/ship` | Pre-deploy checklist |
| `/code-simplify` | Refactor without behavior change |
| `/webperf` | Web performance audit |

## Prompt library

Starter prompts in `prompts/` — reference from chat:

```
Use the prompt in prompts/review/pr-review.md for these changes.
```

| Folder | Files |
|--------|-------|
| `coding/` | `implement-feature.md`, `debug-issue.md`, `refactor.md` |
| `review/` | `pr-review.md`, `security-review.md`, `codebase-audit.md` |
| `writing/` | `adr.md`, `commit-message.md` |
| `meta/` | `improve-prompt.md`, `task-breakdown.md` |

## What's included — 57 skills

| Category | Count | Source |
|----------|-------|--------|
| Engineering workflows | 24 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) |
| Review & audit personas | 3 | agent-skills `agents/` |
| Specialist personas | 28 | [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) |
| Career / branding | 2 | custom + [career-branding](https://github.com/aelmasry/career-branding) |
| Shared references | 7 | agent-skills checklists |

### Engineering lifecycle

| Phase | Skills |
|-------|--------|
| **Define** | `interview-me`, `idea-refine`, `spec-driven-development` |
| **Plan** | `planning-and-task-breakdown` |
| **Build** | `incremental-implementation`, `test-driven-development`, `frontend-ui-engineering`, `api-and-interface-design`, `context-engineering`, `source-driven-development`, `doubt-driven-development` |
| **Verify** | `browser-testing-with-devtools`, `debugging-and-error-recovery`, `test-engineer` |
| **Review** | `code-review-and-quality`, `code-simplification`, `security-and-hardening`, `performance-optimization`, `web-performance-auditor`, `security-auditor`, `code-reviewer` |
| **Ship** | `git-workflow-and-versioning`, `ci-cd-and-automation`, `deprecation-and-migration`, `documentation-and-adrs`, `observability-and-instrumentation`, `shipping-and-launch` |
| **Meta** | `using-agent-skills` |

### Usage in chat

```
Run code-review-and-quality before we merge.
Use security-auditor to review this API.
Review my resume with career-branding.
```

### Typical flows

```
New feature:  spec-driven-development → incremental-implementation → test-driven-development → code-review-and-quality → shipping-and-launch
Security:     security-and-hardening → security-auditor → cloud-security-architect
Web perf:     web-performance-auditor → performance-optimization
Career:       career-branding → linkedin-content-creator
```

## Skills vs rules

| | Skills (`~/.cursor/skills/`) | Rules (`.cursor/rules/`) |
|---|---|---|
| **Scope** | Global — all projects | Project-specific |
| **Purpose** | Workflows and personas | Conventions and principles |
| **This repo** | 57 skills + references | Stay in each project repo |

## Maintenance

### Re-install after pull

```bash
git pull && ./scripts/bootstrap.sh
```

Skills-only (legacy):

```bash
./install.sh
```

### Add personas

```bash
# agency-agents
bash scripts/add-personas.sh && ./install.sh

# agent-skills personas
bash scripts/add-agent-personas.sh && ./install.sh
```

## Attribution

Upstream sources and licenses: [ATTRIBUTION.md](ATTRIBUTION.md)

## License

MIT — see [LICENSE](LICENSE)
