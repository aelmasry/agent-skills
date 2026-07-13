# Pull request review (five axes)

Use skills: `code-review-and-quality`, `security-and-hardening`, `performance-optimization`.

Review staged changes or the diff against the base branch.

## Axes

1. **Correctness** — matches spec? edge cases? tests adequate?
2. **Readability** — names, structure, complexity
3. **Architecture** — patterns, boundaries, abstraction level
4. **Security** — input validation, secrets, auth
5. **Performance** — N+1, unbounded ops, hot paths

## Output format

| Severity | File:line | Finding | Suggested fix |
|----------|-----------|---------|---------------|
| Critical / Important / Suggestion | | | |

End with: **Approve**, **Approve with nits**, or **Request changes** — one sentence why.
