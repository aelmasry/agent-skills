# External skills packages

Vendored upstream skill libraries synced into `skills/` for Cursor, Claude Code, and OpenCode (via `./install.sh`).

| Package | Upstream | Vendored skills | Version pin |
|---------|----------|-----------------|-------------|
| Superpowers | [obra/superpowers](https://github.com/obra/superpowers) | 14 | `packages/superpowers/VENDOR_VERSION` |
| delegate-skills | [amElnagdy/delegate-skills](https://github.com/amElnagdy/delegate-skills) | 18 | `packages/delegate-skills/VENDOR_VERSION` |
| review-skills | [amElnagdy/review-skills](https://github.com/amElnagdy/review-skills) | 2 | `packages/review-skills/VENDOR_VERSION` |

## Install (all three harnesses)

From repo root:

```bash
./install.sh
```

This symlinks every active skill (including these packages) into:

| Harness | Path |
|---------|------|
| Cursor | `~/.cursor/skills/` |
| Claude Code | `~/.claude/skills/` |
| OpenCode | `~/.agents/skills/` (+ Claude path above) |

OpenCode does **not** use a separate `~/.config/opencode/skills` tree in this repo — it reads the same symlink farms as Claude/agents.

## Update upstream

```bash
# Refresh packages/ from GitHub (example)
git clone --depth 1 https://github.com/obra/superpowers.git /tmp/superpowers
rsync -a --delete /tmp/superpowers/ packages/superpowers/
git -C packages/superpowers log -1 --format='%H %ci %s' > packages/superpowers/VENDOR_VERSION

# Repeat for delegate-skills and review-skills, then:
./scripts/vendor-external-skills.sh
./install.sh
```

## Medium article verification

Source reviewed: [Claude Code Got 100x Better With Superpowers Skill](https://medium.com/@codeandbird/claude-code-got-100x-better-with-superpowers-skill-a36450f708b1) (Jan 2026) against `obra/superpowers` @ v6.3.0.

### Accurate

| Claim | Verdict |
|-------|---------|
| Seven-phase workflow: brainstorm → worktree → plan → execute → TDD → code review → finish | **Correct** — maps to `brainstorming`, `using-git-worktrees`, `writing-plans`, `subagent-driven-development` / `executing-plans`, `superpowers-test-driven-development`, `requesting-code-review`, `finishing-a-development-branch` |
| Skills trigger automatically once the plugin/harness bootstrap is active | **Correct for plugin installs**; skills-only symlink install requires agents to invoke `using-superpowers` (or your router) — no session-start hook |
| Claude Code install via marketplace (`obra/superpowers-marketplace`) | **Correct** |
| Codex / OpenCode need separate setup | **Correct** — OpenCode uses `plugin: ["superpowers@git+https://github.com/obra/superpowers.git"]` in upstream docs; this repo uses symlink install instead |
| TDD enforces red-green-refactor; code before tests gets deleted | **Correct** — see `superpowers-test-driven-development` |
| Philosophy: YAGNI, systematic debugging, evidence over claims | **Correct** |

### Incomplete or missing from the article

| Gap | Detail |
|-----|--------|
| Full skill count | Article covers 7 workflow skills; upstream ships **14** skills |
| Not listed | `using-superpowers`, `writing-skills`, `systematic-debugging`, `verification-before-completion`, `receiving-code-review`, `dispatching-parallel-agents` |
| `executing-plans` vs `subagent-driven-development` | Article mentions both in phase 4 but not when to pick each |
| Cursor install | Article says `/add-plugin superpowers` — accurate for **plugin** path; symlink path (this repo) does not install hooks |
| v6.x changes | Combined task reviewer in SDD, platform-neutral prose — not covered (article predates or omits) |
| delegate-skills / review-skills | **Not in article** — separate repos; review-skills **depends on** delegate-skills |

### Name collision handled in this repo

| Skill | Resolution |
|-------|------------|
| `test-driven-development` | Repo already has addyosmani/agent-skills TDD. Superpowers strict TDD vendored as **`superpowers-test-driven-development`**. Use that skill when following the Superpowers workflow. |

## Superpowers skills (14)

| Skill | Role |
|-------|------|
| `using-superpowers` | Meta bootstrap — invoke skills before acting |
| `brainstorming` | Design before code |
| `using-git-worktrees` | Isolated branch + clean baseline |
| `writing-plans` | Bite-sized implementation plan |
| `executing-plans` | Batch execution with checkpoints |
| `subagent-driven-development` | One subagent per task + two-stage review |
| `superpowers-test-driven-development` | Strict iron-law TDD |
| `requesting-code-review` | Pre-merge review against plan |
| `receiving-code-review` | Respond to review feedback |
| `finishing-a-development-branch` | Merge / PR / discard decision |
| `systematic-debugging` | Four-phase root cause |
| `verification-before-completion` | Prove fix before declaring done |
| `dispatching-parallel-agents` | Parallel subagent workflows |
| `writing-skills` | Author new skills |

## delegate-skills (18)

Orchestrator dispatches work to another CLI; you review and commit.

| Skill | Implementer |
|-------|-------------|
| `delegate-setup` | Fleet / lane configuration (no dispatch) |
| `cursor-delegate` | Cursor Agent CLI |
| `claude-delegate` | Claude Code |
| `codex-delegate` | OpenAI Codex |
| `opencode-delegate` | OpenCode |
| `copilot-delegate` | GitHub Copilot CLI |
| `kimi-delegate`, `grok-delegate`, `agy-delegate`, `pi-delegate`, `omp-delegate`, `qoder-delegate`, `vibe-delegate`, `warp-delegate`, `zcode-delegate`, `cline-delegate`, `commandcode-delegate`, `aider-delegate` | Other CLIs |

## review-skills (2)

Requires **delegate-skills** with read-only lanes `review-main` and `review-debate` (create via `delegate-setup`).

| Skill | Role |
|-------|------|
| `debate-review` | Two-model PR/MR review → one inline review |
| `babysit-pr` | Work review rounds: verify, fix, reply, resolve, re-run |

### Typical combined flow

```text
delegate-setup → debate-review on PR #N → babysit-pr until merge-ready
```

## Plugin vs symlink install

| | Cursor/Claude plugin | This repo (`install.sh`) |
|--|---------------------|---------------------------|
| Skills markdown | Yes | Yes |
| Session-start bootstrap hook | Yes | No — load `using-superpowers` or `using-agent-skills` |
| Slash commands (`/superpowers:brainstorm`) | Plugin only | Not included |
| Multi-machine git sync | Manual | **Yes** — primary purpose of this repo |

For full Superpowers plugin behavior in Cursor, you can still run `/add-plugin superpowers` **in addition to** this repo's skills.
