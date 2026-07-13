# Commit message from staged changes

Use skill: `git-workflow-and-versioning`.

## Instructions

1. Run `git diff --staged` (or describe changes if not in a repo)
2. Draft a commit message:
   - Subject: imperative, ≤72 chars, no period
   - Body: why this change, not what every line does
   - Footer: breaking changes, issue refs if any

## Style
Match recent commits in this repo (`git log -5 --oneline`).

Output only the message block, ready to paste:

```
subject line

body paragraph if needed
```
