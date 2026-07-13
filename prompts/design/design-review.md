# Design review — structured UI critique

Use skills: `ui-designer`, `ux-researcher`, `accessibility-auditor`, `frontend-ui-engineering`.

Critique what was built against the design brief. **Screenshots are mandatory** — code review alone is not enough.

Scope: `$ARGUMENTS` or full app.

---

## Before you start

1. Read the brief: `.design/*/DESIGN_BRIEF.md`, or `DESIGN_BRIEF.md` in project root. Ask if missing.
2. Explore built components, styles, and token usage in the codebase.
3. **Capture screenshots** (required):

| Tool priority | Action |
|---------------|--------|
| 1. Browser MCP | Navigate app, resize viewports, `fullPage` screenshots |
| 2. User-provided | Ask for desktop 1280, tablet 768, mobile 375, dark mode if applicable |

Save to `.design/<feature>/screenshots/` or `screenshots/` with descriptive names:
`review-homepage-desktop-1280.png`, `review-homepage-mobile-375.png`, etc.

---

## Review checklist

### Visual hierarchy
- Most important content is most prominent
- Clear type scale and reading order
- Interactive elements are discoverable

### Consistency
- Spacing, colors, radii, shadows from a shared scale — not one-off values
- Similar components look and behave alike

### Responsive (375 / 768 / 1280+)
- Layout reorganizes, not just shrinks
- Touch targets ≥ 44px on mobile
- No horizontal scroll at 375px

### Accessibility (WCAG 2.2 AA)
- Contrast 4.5:1 body, 3:1 large text
- Keyboard-only navigation works
- Visible focus rings, semantic HTML, alt text
- `prefers-reduced-motion` respected

### States
- Hover, focus, active, disabled on interactive elements
- Loading, empty, error states where needed

### Dark mode (if applicable)
- Tokens switch via CSS variables, not hardcoded hex
- Palette feels intentional, not inverted

---

## Output format

Save `DESIGN_REVIEW.md` next to the brief.

```markdown
# Design Review: [Feature]

## Screenshots Captured
| File | Breakpoint | Notes |

## Summary
[2-3 sentences]

## Must Fix
1. **[Issue]** — file/component + screenshot ref. _Fix: ..._

## Should Fix
...

## Could Improve
...

## What Works Well
...
```

End with: reply **fix must** or list items to implement.
