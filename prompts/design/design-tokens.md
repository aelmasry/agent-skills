# Design tokens — light/dark system before building UI

Use skills: `ui-designer`, `frontend-ui-engineering`, `ux-architect`.

Generate a token system **before** building components. Extend existing tokens — do not replace without asking.

---

## Process

1. **Audit existing tokens** — CSS variables, Tailwind config, theme files, `globals.css`
2. **Read brief** — `.design/*/DESIGN_BRIEF.md` for aesthetic direction
3. **Generate tokens** in project format:
   - Tailwind → extend config + `globals.css`
   - Plain CSS → `tokens.css`
   - Default → CSS custom properties

4. **Always include light + dark** — `[data-theme="dark"]` and `prefers-color-scheme`

---

## Token categories

| Category | Examples |
|----------|----------|
| Color | `--color-bg-primary`, `--color-text-primary`, `--color-accent-primary`, status colors |
| Spacing | 4px or 8px base scale (`--space-1` … `--space-12`) |
| Typography | display/body/mono families, size ramp, line heights |
| Layout | max-widths, border-radius, shadows |
| Motion | durations, easing curves |
| Breakpoints | 375, 768, 1024, 1280, 1536 |

Dark mode: warm/cool neutrals — not pure invert. Adjust accent contrast for dark backgrounds.

---

## Output

- Token file in the right location for the stack
- Note which philosophy drove choices
- List gaps filled vs what already existed

Next step: build UI with tokens only — no hardcoded hex in components.
