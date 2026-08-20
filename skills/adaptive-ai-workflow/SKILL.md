---
name: adaptive-ai-workflow
description: General adaptive AI development workflow — understand before code, size-based routing, spec/plan gates, verification. Use when starting any non-trivial task in any project, feature requests, legacy migrations, or when the user asks for structured engineering discipline before implementation.
---

# Adaptive AI Development Workflow

General process for AI-assisted software development. **Project-specific rules override generic advice** — always read `.cursor/rules/` and project skills first.

> Do not optimize for writing code quickly. Optimize for solving the **correct** problem.

Agents act as **Engineer + Analyst + Architect + Reviewer**, not code generators.

---

## Size classification

| Size | Examples | Flow |
|------|----------|------|
| **Small** | Typo, obvious one-file fix, clear acceptance | Understand → Implement → Test → Review |
| **Medium** | New field, validator, module extension | Understand → Discuss → Mini spec → Plan → Tasks → Implement → Test → Review |
| **Large** | New feature, migration, architectural change | Full flow + detailed spec, architecture, verification |

**Risk escalates size:** auth, payments, idempotency, wire-contract changes, production data, legacy parity → at least **medium**.

---

## Phase 1: Understand

1. Restate the business problem.
2. Classify size and risk.
3. Read similar code + project docs.
4. **Stop** if required sources (legacy, API contract, schema) are not visible — report gaps.

---

## Phase 2: Discuss / Challenge

Before code on feature requests:

- Scope (in / out)
- Assumptions (list explicitly)
- Edge cases, security, performance, compatibility
- Alternatives when appropriate

Use AskQuestion for decisions that are genuinely the user's.

---

## Phase 3: Specification (medium/large)

Invoke `spec-driven-development` for gated workflow and templates.

Spec describes **what/why**, not implementation unless constrained:

- Problem, goal, scope, business rules
- Constraints, edge cases, acceptance criteria
- Out of scope

**Gate:** Human approval before plan/implementation.

Store specs in the project's `docs/specs/` when the repo uses that convention; otherwise `tasks/` or agreed location.

---

## Phase 4: Plan + tasks (medium/large)

Invoke `planning-and-task-breakdown`.

Cover: reuse targets, files, API/data changes, risks, test strategy.

**Gate:** Human approval before implementation.

---

## Phase 5: Implement

Invoke `incremental-implementation`. For behavior changes: `test-driven-development`. For bugs: `debugging-and-error-recovery`.

- Follow approved spec/plan
- **Stop** if wrong — propose update, do not silently improvise
- Read project skills and one similar example first
- Minimal diffs; no scope expansion

---

## Phase 6: Verify + review

Invoke `code-review-and-quality`; for security-sensitive work: `security-and-hardening`.

Verify **technical** (tests, lint, build) and **business** (acceptance criteria).

---

## Skills map

| Phase | Skill |
|-------|-------|
| Orchestration | `ali-engineering-workflow` |
| Unclear requirements | `interview-me`, `idea-refine` |
| Context setup | `context-engineering` |
| Spec | `spec-driven-development` |
| Plan / tasks | `planning-and-task-breakdown` |
| Implement | `incremental-implementation` |
| TDD | `test-driven-development` |
| Debug | `debugging-and-error-recovery` |
| Review | `code-review-and-quality` |
| Security | `security-and-hardening` |
| High stakes | `doubt-driven-development` |

## Spec Kit concepts (no CLI required)

| Spec Kit phase | This workflow |
|----------------|---------------|
| Constitution | Project `docs/CONSTITUTION.md` or `ENGINEERING_STANDARDS.md` |
| Clarify | Discuss phase |
| Specify | Spec phase + `spec-driven-development` |
| Plan / Tasks | Plan phase + `planning-and-task-breakdown` |
| Analyze | Review checklist before implement |
| Implement | After approval |

Reference: [Spec Kit](https://speckit.org/), [GitHub blog](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/)

---

## Anti-patterns

- Coding before understanding on feature requests
- Full ceremony on trivial one-line fixes
- Duplicating this workflow inside every project repo
- Ignoring project `.cursor/rules/` in favor of generic advice
