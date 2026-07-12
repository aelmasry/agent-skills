# Cursor Skills

Personal global skills for [Cursor](https://cursor.sh) — engineering workflows, specialist personas, and career tools.

## Structure

```
cursor-skills/
├── skills/              # One folder per skill (SKILL.md + optional refs)
│   ├── using-agent-skills/       # Meta: routes tasks to the right workflow
│   ├── test-driven-development/  # Engineering workflows (24 from agent-skills)
│   ├── data-engineer/            # Specialist personas (17 from agency-agents)
│   ├── career-assistant/         # Custom career branding skill
│   └── ...
├── references/          # Shared checklists (definition-of-done, security, testing...)
├── scripts/             # Conversion and setup helpers
└── install.sh           # Symlink all skills to ~/.cursor/skills/
```

## Quick Install

```bash
git clone https://github.com/YOUR_USERNAME/cursor-skills.git
cd cursor-skills
./install.sh
```

This symlinks every skill to `~/.cursor/skills/` where Cursor auto-discovers them.

## Skills Inventory

### Engineering Workflows (24)

From [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — full development lifecycle:

| Phase | Skills |
|-------|--------|
| Define | `interview-me`, `idea-refine`, `spec-driven-development` |
| Plan | `planning-and-task-breakdown` |
| Build | `incremental-implementation`, `test-driven-development`, `frontend-ui-engineering`, `api-and-interface-design`, `context-engineering`, `source-driven-development`, `doubt-driven-development` |
| Verify | `browser-testing-with-devtools`, `debugging-and-error-recovery` |
| Review | `code-review-and-quality`, `code-simplification`, `security-and-hardening`, `performance-optimization` |
| Ship | `git-workflow-and-versioning`, `ci-cd-and-automation`, `deprecation-and-migration`, `documentation-and-adrs`, `observability-and-instrumentation`, `shipping-and-launch` |
| Meta | `using-agent-skills` |

### Specialist Personas (17)

From [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents):

| Category | Skills |
|----------|--------|
| Engineering | `data-engineer`, `backend-architect`, `ai-engineer`, `code-reviewer`, `api-platform-engineer` |
| Security | `security-architect`, `application-security-engineer` |
| Testing | `reality-checker`, `api-tester` |
| Product / PM | `product-manager`, `senior-project-manager` |
| Marketing | `content-creator`, `linkedin-content-creator` |
| Design | `ui-designer`, `ux-researcher` |
| Specialized | `agents-orchestrator`, `mcp-builder` |

### Custom (1)

| Skill | Purpose |
|-------|---------|
| `career-assistant` | Resume, LinkedIn, cover letter, ATS optimization for Data Engineering / Azure roles |

## Usage in Cursor

Skills are auto-discovered from `~/.cursor/skills/`. Reference them explicitly when needed:

```
Follow test-driven-development for this change.
Use the data-engineer skill to design this pipeline.
Review my resume with career-assistant.
```

### Shared References

Engineering skills reference checklists in `references/` (installed as `~/.cursor/skills/references/`):

- `definition-of-done.md`
- `testing-patterns.md`
- `security-checklist.md`
- `performance-checklist.md`
- `accessibility-checklist.md`
- `observability-checklist.md`
- `orchestration-patterns.md`

## Adding More Personas

```bash
# Clone agency-agents (one-time)
git clone https://github.com/msitarzewski/agency-agents.git /tmp/agency-agents-src

# Edit scripts/add-personas.sh to add agent paths, then:
bash scripts/add-personas.sh
./install.sh
```

Or convert a single agent:

```bash
bash scripts/convert-agency-agent.sh \
  /tmp/agency-agents-src/engineering/engineering-data-engineer.md \
  skills/
```

## Updating Engineering Workflows

Re-copy from upstream agent-skills:

```bash
git clone --depth 1 https://github.com/addyosmani/agent-skills.git /tmp/agent-skills-src
cp -r /tmp/agent-skills-src/skills/* skills/
cp -r /tmp/agent-skills-src/references/* references/
./install.sh
```

## Attribution

See [ATTRIBUTION.md](ATTRIBUTION.md) for upstream sources and licenses.
