---
name: vercel-web-skills
description: >-
  Bridge to recommended vercel-labs agent skills for React/Next.js performance
  and web UI guidelines. Use when building or reviewing React/Next.js UIs,
  optimizing frontend performance, or auditing web interface best practices —
  and the user does not already have those packages installed.
---

# Vercel Web Skills (bridge)

Do **not** vendor full rule trees into this repo. Install official packages via the Skills CLI when needed.

## Recommended packages

| Need | Package | Install |
|------|---------|---------|
| React / Next.js performance | `react-best-practices` | `npx skills add vercel-labs/agent-skills@react-best-practices -g -y` |
| UI a11y / UX audit rules | `web-design-guidelines` | `npx skills add vercel-labs/agent-skills@web-design-guidelines -g -y` |
| Vercel cost / perf audit | `vercel-optimize` | `npx skills add vercel-labs/agent-skills@vercel-optimize -g -y` |
| React composition patterns | `composition-patterns` | `npx skills add vercel-labs/agent-skills@composition-patterns -g -y` |

Browse: https://skills.sh/vercel-labs/agent-skills

## When to use this skill vs local skills

| Task | Prefer |
|------|--------|
| Production UI in any stack | `frontend-ui-engineering` |
| Measure / fix CWV or load | `performance-optimization` |
| Discover unknown skills | `find-skills` |
| React/Next.js rule packs from Vercel Eng | Install packages above, then follow their SKILL.md |

## Workflow

1. Confirm the stack is React / Next.js / Vercel (or user wants those guidelines).
2. Check whether the package is already installed (`npx skills list` or `~/.agents` / agent skill dirs).
3. If missing, offer to install with the command above.
4. After install, **read** that skill’s `SKILL.md` and follow it.
5. Still apply local `frontend-ui-engineering` and `accessibility-auditor` for project conventions.

## Quality gate before recommending

Same as `find-skills`: prefer high install counts and official `vercel-labs` / `anthropics` / `microsoft` sources.
