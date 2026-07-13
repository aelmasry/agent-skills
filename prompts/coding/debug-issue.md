# Debug an issue systematically

Use skill: `debugging-and-error-recovery`.

## Symptom
<!-- paste error message, stack trace, or unexpected behavior -->

## Instructions

1. Reproduce the issue — state exact steps and environment
2. Form 2–3 hypotheses ranked by likelihood
3. Gather evidence (logs, breakpoints, minimal repro) — one hypothesis at a time
4. Identify root cause with file:line proof
5. Propose the smallest fix; add a regression test if missing
6. Verify fix does not break related paths

## Output
- Root cause (one paragraph)
- Fix (diff or steps)
- How to verify
