# Reusable prompts

Symlinked to `~/.cursor/prompts` via `bootstrap.sh` / `bootstrap.ps1`.

## Layout

```
prompts/
├── coding/       # implementation, refactor, debug
├── review/       # PR review, security, full codebase audit
├── writing/      # docs, ADRs, commit messages
├── design/       # brief, tokens, IA, UI critique
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
| `review/codebase-audit.md` | Full codebase audit — two-pass report then fix |
| `writing/adr.md` | Architecture Decision Record |
| `writing/commit-message.md` | Draft commit message from diff |
| `meta/improve-prompt.md` | Rewrite a weak prompt |
| `meta/task-breakdown.md` | Turn spec into tasks/plan |
| `design/design-brief.md` | Idea → structured design brief |
| `design/design-tokens.md` | Light/dark token system before build |
| `design/information-architecture.md` | Site map, nav, flows before pixels |
| `design/design-review.md` | UI critique with screenshots |

## Usage

In Cursor chat:

```
Use the prompt in prompts/review/codebase-audit.md
Use the prompt in prompts/design/design-review.md
```

Or use slash commands: `/audit`, `/design-review`, `/review`.

Prompts complement skills in `skills/` and commands in `commands/`.
