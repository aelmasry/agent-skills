---
description: Security-first codebase audit — report findings (Pass 1), fix after you confirm (Pass 2)
---

Use the prompt in `prompts/review/codebase-audit.md`.

Invoke skills: `security-and-hardening`, `security-auditor`, `code-review-and-quality`, `code-simplification`.

## Modes

- **`/audit`** — Pass 1 only: detect stack, scan security/deps/duplication/refactors, report in tables. **No code changes.**
- **`/audit fix`** — Pass 2: apply approved fixes in order (security → deps → safe cleanups). Only after you confirmed Pass 1.

`$ARGUMENTS`:
- empty or a path — scope the audit (e.g. `/audit src/api`)
- `fix` — run Pass 2 for items you already approved

## Pass 1 output

1. Stack + test coverage status
2. Prioritized tables: Security → Dependencies → Duplication → Refactors → Reusable pieces → Health checks
3. Top 3 recommended actions + wait for confirmation

## Pass 2 output

Fix security first (note behavior changes), then deps (patch/minor only; flag majors), then approved safe cleanups with before/after.

End with the summary table from the prompt.
