---
name: ali-engineering-workflow
description: Personal engineering workflow orchestrator for Ali's projects. Routes tasks to the right agent-skills (spec, TDD, API design, security, review, ship) and Azure skills when relevant. Use when starting any coding session, when unsure which skill applies, or when the user asks for structured engineering discipline across PHP API gateways, Laravel, Azure, and retail/POS systems.
---

# Ali Engineering Workflow

## When to Use

- Starting a new Cursor session on any project
- Task scope is unclear or spans multiple phases
- User wants production-grade output, not quick hacks
- Working on RetailPOS, API gateways, Azure infra, or Laravel apps

## Primary orchestrator

For any non-trivial work, invoke **`adaptive-ai-workflow`** first — size routing, discuss-before-code, spec/plan gates, verification. This skill routes to the phase skills below.

## Skill Routing

Read the matching skill before acting.

| Phase | Skill | Trigger |
|-------|-------|---------|
| Any non-trivial task | `adaptive-ai-workflow` | Feature, migration, multi-file, or ambiguous work |
| Unclear requirements | `interview-me` | User has not decided what to build |
| Rough idea | `idea-refine` | Exploring options before committing |
| New feature/change | `spec-driven-development` | Anything non-trivial; write spec first |
| Break down work | `planning-and-task-breakdown` | Spec exists, need tasks |
| Implement | `incremental-implementation` | Multi-file changes |
| APIs / contracts | `api-and-interface-design` | Endpoints, modules, public interfaces |
| Tests | `test-driven-development` | Logic, bugs, behavior changes |
| Debug | `debugging-and-error-recovery` | Failures, unexpected behavior |
| Review | `code-review-and-quality` | Before merge / PR |
| Security | `security-and-hardening` | Auth, PII, payments, external integrations |
| Ship | `shipping-and-launch` + `git-workflow-and-versioning` | Deploy, release, commit |
| Azure work | `azure-*` skills in `~/.agents/skills/` | Deploy, diagnose, cost, K8s, Foundry |
| High stakes | `doubt-driven-development` | Production, security, irreversible changes |
| Discover / route | `using-agent-skills` | Full matrix (career, personas, archive, find-skills) |
| Ecosystem skill search | `find-skills` | `npx skills find` / skills.sh |
| React/Next Vercel packs | `vercel-web-skills` | Bridge to vercel-labs packages |

Lifecycle workflow skills are canonical in **cursor-skills**; keep `~/.agents` in sync with:

```bash
./scripts/sync-agents-skills.sh
```

Matrix: `docs/SKILLS_MATRIX.md` · Architecture: `docs/SKILLS_ARCHITECTURE.md`

## Non-Negotiable Behaviors

1. Read project skills first by checking `.cursor/skills/` and `.cursor/rules/` in the current repo before coding.
2. Use spec before code for features touching more than one file.
3. Treat tests as proof. No "seems right" without evidence.
4. Keep diffs small and focused.
5. Surface assumptions before implementing.
6. Let project conventions override generic advice.

## Cursor Commands

Type `/` in chat to use:

- `/spec`
- `/plan`
- `/build`
- `/test`
- `/review`
- `/ship`
- `/code-simplify`
- `/webperf`

## Project-Specific Overrides

| Project type | Also check |
|--------------|------------|
| `RetailPOS_APIGateway` | `retailpos-api-gateway` skill, PHP 7.3 rules, ErrorCode policy |
| `RetailPOS` (Laravel) | `apns-notifications` skill if touching push module |
| Azure infra | relevant `azure-*` skill from `~/.agents/skills/` |

## Verification

A task is done only when:

- [ ] Relevant skill workflow completed
- [ ] Tests pass, or there is an explicit reason why tests do not apply
- [ ] No unrelated files changed
- [ ] Evidence is available for review
