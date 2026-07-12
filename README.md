# Cursor Skills

Global [Cursor](https://cursor.sh) skills for engineering workflows, specialist personas, and career tools.

**57 skills** — install once, available in every project via `~/.cursor/skills/`.

```
Define → Plan → Build → Verify → Review → Ship
  spec     plan    code    test     review   deploy
```

## Quick Install

```bash
git clone git@github.com:aelmasry/cursor-skills.git
cd cursor-skills
./install.sh
```

Or via HTTPS:

```bash
git clone https://github.com/aelmasry/cursor-skills.git
cd cursor-skills
./install.sh
```

The install script symlinks all skills to `~/.cursor/skills/` where Cursor auto-discovers them.

## What's Included

| Category | Count | Source | Purpose |
|----------|-------|--------|---------|
| Engineering workflows | 24 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) | Spec → ship lifecycle with quality gates |
| Review & audit personas | 3 | agent-skills `agents/` | Web perf, security audit, test engineering |
| Specialist personas | 28 | [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) | Domain experts (data, security, branding, PM…) |
| Career / branding | 2 | custom + [career-branding](https://github.com/aelmasry/career-branding) | Resume, LinkedIn, ATS, interview prep |
| Shared references | 7 | agent-skills | Checklists (DoD, security, testing, performance…) |

## Structure

```
cursor-skills/
├── skills/                  # One folder per skill
│   ├── using-agent-skills/          # Meta: pick the right workflow
│   ├── test-driven-development/     # Engineering workflows (24)
│   ├── web-performance-auditor/     # Audit personas (3)
│   ├── cloud-security-architect/    # Agency personas (28)
│   ├── career-branding/             # Career + branding (2)
│   └── ...
├── references/              # Shared checklists for engineering skills
├── scripts/                 # Conversion helpers
└── install.sh               # Symlink to ~/.cursor/skills/
```

## Engineering Workflows

Full development lifecycle from [agent-skills](https://github.com/addyosmani/agent-skills):

| Phase | Skills |
|-------|--------|
| **Define** | `interview-me`, `idea-refine`, `spec-driven-development` |
| **Plan** | `planning-and-task-breakdown` |
| **Build** | `incremental-implementation`, `test-driven-development`, `frontend-ui-engineering`, `api-and-interface-design`, `context-engineering`, `source-driven-development`, `doubt-driven-development` |
| **Verify** | `browser-testing-with-devtools`, `debugging-and-error-recovery`, `test-engineer` |
| **Review** | `code-review-and-quality`, `code-simplification`, `security-and-hardening`, `performance-optimization`, `web-performance-auditor`, `security-auditor`, `code-reviewer` |
| **Ship** | `git-workflow-and-versioning`, `ci-cd-and-automation`, `deprecation-and-migration`, `documentation-and-adrs`, `observability-and-instrumentation`, `shipping-and-launch` |
| **Meta** | `using-agent-skills` |

## Security (10 skills)

| Skill | Type | Purpose |
|-------|------|---------|
| `security-and-hardening` | Workflow | OWASP prevention, input validation, dependency audit |
| `security-auditor` | Persona | Vulnerability detection, threat modeling |
| `security-architect` | Persona | Threat modeling, secure-by-design |
| `application-security-engineer` | Persona | SDLC security, SAST/DAST, secure code review |
| `cloud-security-architect` | Persona | Zero trust, cloud-native defense (Azure/AWS/GCP) |
| `penetration-tester` | Persona | Authorized pentests, red team |
| `incident-responder` | Persona | DFIR, breach investigation |
| `compliance-auditor` | Persona | SOC 2, ISO 27001, HIPAA, PCI-DSS |
| `senior-secops-engineer` | Persona | Secrets scanning, secure-by-default |
| `threat-detection-engineer` | Persona | SIEM rules, threat hunting |

## Career & Branding (2 skills + 7 standards)

From [career-branding](https://github.com/aelmasry/career-branding) workspace:

| Skill | Purpose |
|-------|---------|
| `career-branding` | Full branding workflow — resume, LinkedIn, cover letter, interview, thought leadership. Includes bundled `standards/` |
| `career-assistant` | Lighter standalone version for Data Engineering / Azure / Fabric roles |

Supporting personas:

| Skill | Purpose |
|-------|---------|
| `brand-guardian` | Brand identity and consistency |
| `linkedin-content-creator` | LinkedIn post drafting |
| `social-media-strategist` | Social media strategy |
| `content-creator` | General content creation |
| `developer-advocate` | Developer community and DX content |
| `recruitment-specialist` | Recruiter-side perspective |
| `personal-growth-mentor` | Career clarity and accountability |

`career-branding/standards/` includes: core principles, resume, LinkedIn, writing, interview, content, positioning.

## Other Specialist Personas

| Category | Skills |
|----------|--------|
| Engineering | `data-engineer`, `backend-architect`, `ai-engineer`, `code-reviewer`, `api-platform-engineer` |
| Testing | `reality-checker`, `api-tester`, `test-engineer` |
| Product / PM | `product-manager`, `senior-project-manager` |
| Design | `ui-designer`, `ux-researcher`, `brand-guardian` |
| Specialized | `agents-orchestrator`, `mcp-builder`, `web-performance-auditor` |

## Usage

Skills are auto-discovered from `~/.cursor/skills/`. Reference them in your prompt:

```
Run code-review-and-quality before we merge.
Use security-auditor to review this API.
Audit web performance with web-performance-auditor.
Review my resume with career-branding.
Use cloud-security-architect for this Azure deployment.
```

### Typical Flows

```
New feature:  spec-driven-development → incremental-implementation → test-driven-development → code-review-and-quality → shipping-and-launch

Security:     security-and-hardening → security-auditor → cloud-security-architect

Web perf:     web-performance-auditor → performance-optimization

Career:       career-branding → linkedin-content-creator
```

### Shared References

Engineering skills load checklists from `references/` (installed as `~/.cursor/skills/references/`):

- `definition-of-done.md` — project-wide quality bar
- `testing-patterns.md` — test structure and anti-patterns
- `security-checklist.md` — OWASP, auth, input validation
- `performance-checklist.md` — Core Web Vitals, profiling
- `accessibility-checklist.md` — WCAG 2.1 AA
- `observability-checklist.md` — logging, metrics, tracing
- `orchestration-patterns.md` — multi-agent coordination rules

## Skills vs Rules

| | Skills (`~/.cursor/skills/`) | Rules (`.cursor/rules/`) |
|---|---|---|
| **Scope** | Global — all projects | Project-specific |
| **Purpose** | Workflows and specialist personas | Principles and conventions |
| **This repo** | 57 skills installed globally | Project rules stay in each repo (e.g. career-branding) |

## Maintenance

### Add an agency persona

```bash
git clone https://github.com/msitarzewski/agency-agents.git /tmp/agency-agents-src
# Edit scripts/add-personas.sh, then:
bash scripts/add-personas.sh
./install.sh
```

### Add an agent-skills persona

```bash
git clone --depth 1 https://github.com/addyosmani/agent-skills.git /tmp/agent-skills-src
# Edit scripts/add-agent-personas.sh, then:
bash scripts/add-agent-personas.sh
./install.sh
```

### Update career-branding standards

```bash
cp /path/to/career-branding/.cursor/rules/*.mdc skills/career-branding/standards/
cp /path/to/career-branding/.cursor/skills/career-branding/*.md skills/career-branding/
./install.sh
```

### Re-install after pull

```bash
git pull
./install.sh
```

## Attribution

Upstream sources and licenses: [ATTRIBUTION.md](ATTRIBUTION.md)

## License

MIT — see [LICENSE](LICENSE)
