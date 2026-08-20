---
description: Structured UI/UX design critique against brief — screenshots required at mobile, tablet, desktop
---

Use the prompt in `prompts/design/design-review.md`.

Invoke skills: `ui-designer`, `accessibility-auditor`, `frontend-ui-engineering`.
(Do not invoke archived `ux-researcher` — absorbed/deferred; use `ui-designer` + `accessibility-auditor` for UX critique.)

## Modes

- **`/design-review`** — critique built UI against DESIGN_BRIEF.md (or ask for direction)
- **`/design-review [page or component]`** — narrow scope

`$ARGUMENTS`: optional page, route, or component name.

## Requirements

- Capture screenshots at 375px, 768px, 1280px (use browser MCP if available)
- Check hierarchy, consistency, responsive behavior, accessibility, dark mode
- Output prioritized: Must fix / Should fix / Could improve

No code changes unless user asks to fix items after review.
