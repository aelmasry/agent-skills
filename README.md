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
| Skills (active; skips `_archive/`) | `skills/` | `~/.cursor/skills/`, `~/.claude/skills/`, `~/.agents/skills/` (symlinks) |
| Discussion mode | `DISCUSSION-MODE.md` | `~/.agents/DISCUSSION-MODE.md` |
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
├── skills/                  # Active skills for Cursor + Claude + OpenCode (+ skills/_archive/)
├── docs/                    # Skills matrix + architecture (ADG)
├── references/              # Shared engineering checklists
├── commands/                # Slash commands (/review, /spec, /build…)
├── prompts/                 # Reusable prompt library
│   ├── coding/
│   ├── review/
│   ├── writing/
│   ├── design/
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
| `/design-review` | UI/UX critique with screenshots — hierarchy, a11y, responsive |
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
| `design/` | `design-brief.md`, `design-tokens.md`, `design-review.md`, `information-architecture.md` |

Design prompts adapted from [designer-skills](https://github.com/julianoczkowski/designer-skills).

## What's included — active skills

| Category | Count | Source |
|----------|-------|--------|
| Engineering workflows | 24 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) |
| Meta / discovery | 3 | `using-agent-skills`, `find-skills`, `vercel-web-skills` |
| Specialist personas (active) | ~16 | [agency-agents](https://github.com/msitarzewski/agency-agents) + audit personas |
| Career (canonical 6) | 6 | custom + researched pipelines |
| Azure / Foundry / Entra | ~33 | previously `~/.agents` only; now in this repo |
| Brand / extras | ~8 | `personal-brand`, `social-content-system`, `analytics-review`, `adaptive-ai-workflow`, `impeccable`, `task-observer`, `owasp-security`, CodeGPT ports |
| Archived (deferred) | 28 | `skills/_archive/` — not auto-installed |
| Shared references | 7 | agent-skills checklists |

Architecture: [docs/SKILLS_ARCHITECTURE.md](docs/SKILLS_ARCHITECTURE.md) · Matrix: [docs/SKILLS_MATRIX.md](docs/SKILLS_MATRIX.md)

All personal skills live in this repo. `./install.sh` symlinks them into Cursor, Claude Code, and OpenCode (`~/.agents/skills`). Do not keep a second real copy in those dirs.

### Career skills (canonical 6)

| Skill | Use when |
|-------|----------|
| `ali-career-profile` | **Always first for Ali** — facts, honesty, achievements |
| `freelance-hunt` | Score FT / PT / freelance / client opportunity |
| `cv-jd-matcher` | Align CV + cover letter + ≤7-day prep before apply |
| `build-tailored-resume` | Produce Word `.docx` (single DOCX / ATS path) |
| `linkedin-optimizer` | Profile + visibility |
| `rs-interview-prep-generator` | STAR / interview packs |

```
@ali-career-profile     → load facts
@freelance-hunt         → Go / No-go on role or client
@cv-jd-matcher          → tailored CV + cover letter + week plan
@build-tailored-resume  → .docx for ATS portals
@linkedin-optimizer     → headline / About / skills
@rs-interview-prep-generator → STAR packs
```

### Engineering lifecycle

| Phase | Skills |
|-------|--------|
| **Define** | `interview-me`, `idea-refine`, `spec-driven-development` |
| **Plan** | `planning-and-task-breakdown` |
| **Build** | `incremental-implementation`, `test-driven-development`, `frontend-ui-engineering`, `api-and-interface-design`, `context-engineering`, `source-driven-development`, `doubt-driven-development` |
| **Verify** | `browser-testing-with-devtools`, `debugging-and-error-recovery`, `test-engineer` |
| **Review** | `code-review-and-quality`, `code-simplification`, `security-and-hardening`, `performance-optimization`, `security-auditor` |
| **Ship** | `git-workflow-and-versioning`, `ci-cd-and-automation`, `deprecation-and-migration`, `documentation-and-adrs`, `observability-and-instrumentation`, `shipping-and-launch` |
| **Meta** | `using-agent-skills`, `find-skills`, `vercel-web-skills` |

### Usage in chat

```
Run code-review-and-quality before we merge.
Use security-auditor to review this API.
Tailor my resume with build-tailored-resume after cv-jd-matcher.
```

### Typical flows

```
New feature:  spec-driven-development → incremental-implementation → test-driven-development → code-review-and-quality → shipping-and-launch
Security:     security-and-hardening → security-architect / application-security-engineer → security-auditor
Web perf:     performance-optimization (CWV / load-test modes)
Career:       ali-career-profile → freelance-hunt → cv-jd-matcher → build-tailored-resume | linkedin-optimizer
Design:       design-brief → design-tokens → frontend-ui-engineering → design-review
Audit:        codebase-audit (Pass 1) → minimal-change-engineer fixes (Pass 2)
Ecosystem:    find-skills → npx skills add …
```

### Highlighted personas (active)

| Skill | Use when |
|-------|----------|
| `minimal-change-engineer` | Smallest diff — refuse scope creep on bug fixes |
| `software-architect` | System design, ADRs, trade-off analysis |
| `accessibility-auditor` | WCAG 2.2 — keyboard, screen reader, contrast |
| `ui-designer` | Visual design intent |
| `reality-checker` | Evidence-based readiness |

Deferred specialists (pentest, marketing, etc.) live in `skills/_archive/`.

Optional extensions for review/a11y: see `config/recommended-extensions.optional.txt`.

## Skills vs rules

| | Skills (`~/.cursor/skills/`) | Rules (`.cursor/rules/`) |
|---|---|---|
| **Scope** | Global — all projects | Project-specific |
| **Purpose** | Workflows and personas | Conventions and principles |
| **This repo** | Active skills + `_archive` + references | Stay in each project repo |

## Maintenance

### Re-install after pull

```bash
git pull && ./scripts/bootstrap.sh
# Skills-only (Cursor + Claude + OpenCode):
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
