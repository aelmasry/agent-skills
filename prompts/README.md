# Reusable prompts

Symlinked to `~/.cursor/prompts` via `bootstrap.sh` / `bootstrap.ps1`.

## Layout

```
prompts/
├── coding/       # implementation, refactor, debug
├── review/       # PR review, security review
├── writing/      # docs, ADRs, commit messages
└── meta/         # improve prompt, task breakdown
```

## Starter prompts

| File | Use when |
|------|----------|
| `coding/implement-feature.md` | Incremental feature slice with TDD |
| `coding/debug-issue.md` | Systematic bug investigation |
| `coding/refactor.md` | Simplify without behavior change |
| `review/pr-review.md` | Five-axis pull request review |
| `review/security-review.md` | Security-focused review (diff scope) |
| `review/codebase-audit.md` | Full codebase audit — security-first, two-pass report then fix |
| `writing/adr.md` | Architecture Decision Record |
| `writing/commit-message.md` | Draft commit message from diff |
| `meta/improve-prompt.md` | Rewrite a weak prompt |
| `meta/task-breakdown.md` | Turn spec into tasks/plan |

## Usage

In Cursor chat:

```
Use the prompt in prompts/review/pr-review.md for these changes.
```

Or paste the file contents directly. Prompts complement slash commands in `commands/` and skills in `skills/`.

## Add your own

Create a new `.md` file under the right folder. Run `./scripts/export.sh` if you edited prompts outside the repo symlink.
