# External skills packages

Vendored upstream skill libraries synced into `skills/` for Cursor, Claude Code, and OpenCode (via `./install.sh`).

| Package | Upstream | Vendored skills | Version pin |
|---------|----------|-----------------|-------------|
| Superpowers | [obra/superpowers](https://github.com/obra/superpowers) | **1** (`using-git-worktrees`) | `packages/superpowers/VENDOR_VERSION` |
| delegate-skills | [amElnagdy/delegate-skills](https://github.com/amElnagdy/delegate-skills) | 18 | `packages/delegate-skills/VENDOR_VERSION` |
| review-skills | [amElnagdy/review-skills](https://github.com/amElnagdy/review-skills) | 2 | `packages/review-skills/VENDOR_VERSION` |

**Total external skills installed: 21** (111 active skills in repo overall).

Adapted (not auto-vendored) from [charlie947/social-media-skills](https://github.com/charlie947/social-media-skills) (MIT, pin `d2e9487`): `content-matrix`, `social-visuals`. Voice stays `personal-brand`; drafts stay `social-content-system`. Do not install the upstream 17-skill set.

## Duplicate policy (Superpowers)

The full Superpowers bundle (14 skills) overlaps our lifecycle stack. We **do not** install duplicates:

| Superpowers skill | Kept instead |
|-------------------|--------------|
| `using-superpowers` | `using-agent-skills` |
| `brainstorming` | `interview-me`, `idea-refine` |
| `writing-plans` | `planning-and-task-breakdown` |
| `executing-plans`, `subagent-driven-development` | `incremental-implementation`, `agents-orchestrator` |
| `test-driven-development` | `test-driven-development` |
| `systematic-debugging` | `debugging-and-error-recovery` |
| `requesting-code-review`, `receiving-code-review` | `code-review-and-quality` |
| `finishing-a-development-branch` | `shipping-and-launch`, `git-workflow-and-versioning` |
| `verification-before-completion` | `reality-checker`, `doubt-driven-development` |
| `dispatching-parallel-agents` | `agents-orchestrator` |
| `writing-skills` | `skill-creator` |
| **`using-git-worktrees`** | **unique — kept** |

Re-vendor allowlist lives in `scripts/vendor-external-skills.sh` (`SUPERPOWERS_ALLOWLIST`).

## Install (all three harnesses)

```bash
./install.sh
```

| Harness | Path |
|---------|------|
| Cursor | `~/.cursor/skills/` |
| Claude Code | `~/.claude/skills/` |
| OpenCode | `~/.agents/skills/` (+ Claude path above) |

## Update upstream

```bash
# Refresh packages/ from GitHub, then:
./scripts/slim-packages.sh
./scripts/vendor-external-skills.sh
./install.sh
```

## delegate-skills (18)

Orchestrator dispatches work to another CLI; you review and commit. See [delegate-skills README](https://github.com/amElnagdy/delegate-skills).

## review-skills (2)

Requires delegate-skills lanes `review-main` and `review-debate`.

| Skill | Role |
|-------|------|
| `debate-review` | Two-model PR/MR review |
| `babysit-pr` | Work review rounds until merge-ready |

## Plugin vs symlink

For full Superpowers auto-bootstrap in Cursor, use `/add-plugin superpowers` separately. This repo installs skills via symlinks only — no session hooks.
