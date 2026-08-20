# Design brief — from idea to structured direction

Use skills: `idea-refine`, `ui-designer`, `product-manager`, `spec-driven-development`.
(Do not invoke archived `ux-researcher`.)

Turn a vague idea into a brief developers and designers can build from. Explore the existing codebase first — respect what already exists.

---

## Process

1. **Grill the idea** — ask about users, jobs-to-be-done, constraints, success metrics, what NOT to build
2. **Scan codebase** — stack, existing components, design patterns, gaps
3. **Define direction** — aesthetic philosophy, information architecture, key screens
4. **Write the brief** — save to `.design/<feature>/DESIGN_BRIEF.md`

---

## Brief template

```markdown
# Design Brief: [Feature]

## Problem & users
Who, what pain, why now?

## Goals & non-goals
What we will / will not do in v1.

## Key flows
Primary user journeys (3–5 bullets).

## Aesthetic direction
Named philosophy (e.g. minimal, editorial, brutalist) + 2–3 reference sites.

## Information architecture
Pages, navigation, content hierarchy.

## Components needed
Reuse existing vs net-new.

## Accessibility & responsive
WCAG 2.2 AA, breakpoints, touch targets.

## Open questions
Decisions needed before build.
```

Confirm with user before `/design-tokens` or implementation.
