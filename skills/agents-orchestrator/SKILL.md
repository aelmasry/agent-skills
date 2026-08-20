---
name: agents-orchestrator
layer: 03-planning
status: deprecated-autonomous
description: >-
  Coordination guide for multi-step workflows using real Cursor/Claude skills and
  Task subtypes. Autonomous spawn of fictional agency agents is DEPRECATED.
  Prefer slash commands (/ship, /review) and references/orchestration-patterns.md.
  Use when the user asks for agents-orchestrator or multi-agent coordination.
---

# Agents Orchestrator (governed)

## Deprecation notice (M0)

**Do not** autonomously spawn named “agency” agents (ArchitectUX, EvidenceQA,
project-manager-senior, marketing-*, XR-*, etc.). Those names are not installed
skills in this ecosystem and will fail.

**Allowed orchestration:**

1. User or slash command as orchestrator (preferred).
2. Parallel fan-out via Cursor `Task` tool / Claude Agent tool to **real** skills.
3. Merge results in the main agent context.

Canonical patterns: `references/orchestration-patterns.md`.
Preferred ship gate: `/ship` (code-review-and-quality + security-auditor + test-engineer).

## Role

Coordinate multi-phase work by **routing to existing skills**, not by inventing
specialists. Enforce quality gates with evidence (tests, screenshots, review reports).

## Real agent / skill map

Use only these installed capabilities:

| Intent | Use this |
|--------|----------|
| Route / discover | `using-agent-skills`, `find-skills` |
| Clarify / spec / plan | `interview-me`, `idea-refine`, `spec-driven-development`, `planning-and-task-breakdown` |
| Architecture lens | `software-architect`, `backend-architect`, `api-platform-engineer` |
| Product / delivery lens | `product-manager`, `senior-project-manager` |
| Implement | `incremental-implementation`, `frontend-ui-engineering`, `api-and-interface-design`, `minimal-change-engineer` |
| Test / browser evidence | `test-driven-development`, `browser-testing-with-devtools`, `test-engineer` |
| Review / security / perf | `code-review-and-quality`, `security-and-hardening`, `security-auditor`, `performance-optimization`, `accessibility-auditor` |
| Readiness | `reality-checker`, `doubt-driven-development` |
| Ship | `shipping-and-launch`, `/ship` |
| Azure domain | `ali-engineering-workflow` + `azure-*` in `~/.agents/skills` |
| Cursor Task subtypes | `explore`, `shell`, `generalPurpose`, `ci-investigator`, `bugbot`, `security-review` |

## Name translation (legacy → real)

If older docs mention these names, translate:

| Legacy (do not spawn) | Real replacement |
|----------------------|------------------|
| project-manager-senior | `senior-project-manager` + `planning-and-task-breakdown` |
| ArchitectUX | `software-architect` + `ui-designer` |
| EvidenceQA | `browser-testing-with-devtools` + `test-engineer` |
| testing-reality-checker | `reality-checker` |
| Frontend Developer | `frontend-ui-engineering` |
| Backend Architect | `backend-architect` |
| code-reviewer | `code-review-and-quality` |
| web-performance-auditor | `performance-optimization` (CWV mode) |
| ux-researcher / ux-architect | `ui-designer` + `product-manager` + `accessibility-auditor` |

## Recommended pipeline (human- or slash-led)

```text
01-discovery   → interview-me / context-engineering / find-skills
02-analysis    → idea-refine / software-architect / doubt-driven-development
03-planning    → spec-driven-development / planning-and-task-breakdown
04-implementation → incremental-implementation (+ domain skills)
05-validation  → TDD / browser / code-review / security / /ship
```

### Quality gates

- No phase advance without evidence (passing tests, review report, or screenshots).
- Max 3 fix loops on the same failure before escalating to the user.
- Subagents must not spawn other subagents.

## Anti-patterns

- Spawning marketing, XR, finance, or other agency personas not in the real map.
- Running a fully autonomous end-to-end pipeline without user checkpoints.
- Treating archived skills under `skills/_archive/` as callable agents.

## When to use this skill

Only when the user explicitly asks for orchestration help or `agents-orchestrator`.
For normal features, prefer `using-agent-skills` + the matching lifecycle skill.
