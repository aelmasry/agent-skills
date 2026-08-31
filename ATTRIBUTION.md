# Attribution

This repository combines skills from multiple open-source projects with custom additions.

## Upstream Sources

### agent-skills (Engineering Workflows)

- **Source:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)
- **License:** MIT
- **Contents:** 24 engineering lifecycle skills + 7 reference checklists
- **Location in this repo:** `skills/` (workflow skills) and `references/`

### agency-agents (Specialist Personas)

- **Source:** [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)
- **License:** MIT
- **Contents:** Specialist personas (converted to Cursor skill format); active set slimmed in Phase-1 — deferred personas live in `skills/_archive/`
- **Location in this repo:** `skills/` (active) and `skills/_archive/`
- **Conversion:** `scripts/convert-agency-agent.sh`

### agent-skills (Review Personas)

- **Source:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — `agents/` directory
- **License:** MIT
- **Contents:** Audit personas; `test-engineer` and `security-auditor` remain active. `web-performance-auditor` absorbed into `performance-optimization` modes (archived).
- **Location in this repo:** `skills/` / `skills/_archive/`
- **Conversion:** `scripts/convert-agent-persona.sh`

### Career skills (Custom + researched)

- **Author:** Ali (+ upstream resume skill research)
- **Canonical active path (6):** `ali-career-profile`, `freelance-hunt`, `cv-jd-matcher`, `build-tailored-resume`, `linkedin-optimizer`, `rs-interview-prep-generator`
- **Absorbed / archived:** `career-assistant`, `career-branding`, `resume-tailor-master`, `ats-resume-pipeline`, `rs-resume-tailor`, `rs-tech-resume-optimizer`, `rs-job-description-analyzer`, `rs-linkedin-profile-optimizer` → `skills/_archive/` (unique refs ported into survivors)
- **Related workspace:** [aelmasry/career-branding](https://github.com/aelmasry/career-branding)

### social-media-skills (Charlie Hills — adapted, not full vendor)

- **Source:** [charlie947/social-media-skills](https://github.com/charlie947/social-media-skills)
- **License:** MIT
- **Pin:** commit `d2e948719eafc8ed9e2436357ad18489bb371a81` (2026-08-30)
- **What we took:** `content-matrix` (pillars × formats ideation) and a merged `social-visuals` from `graphic-designer`, `gemini-carousel`, `gemini-infographic`, `quote-post`
- **What we did not install:** the other 13 upstream skills (`voice-builder`, `post-writer`, `profile-optimizer`, etc.) — they duplicate `personal-brand`, `social-content-system`, `linkedin-optimizer`, or `analytics-review`
- **Adaptations:** `personal-brand` instead of `about-me.md`/`voice.md`; Motivational format → Builder story; quote mode is insight-only (no motivational posters); no Cowork `AskUserQuestion` / British-English / Charlie Hills benchmarks; handoff to `social-content-system`
- **Location:** `skills/content-matrix/`, `skills/social-visuals/`

### designer-skills (Design prompts — adapted)

- **Source:** [julianoczkowski/designer-skills](https://github.com/julianoczkowski/designer-skills) (MIT)
- **Contents:** Design workflow prompts adapted for `prompts/design/` (not full skill copies)
- **Location in this repo:** `prompts/design/`

### vercel-labs (ecosystem discovery + web bridge)

- **find-skills:** [vercel-labs/skills](https://github.com/vercel-labs/skills/tree/main/skills/find-skills) — vendored as `skills/find-skills/`
- **agent-skills packages:** [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) — referenced by thin bridge `skills/vercel-web-skills/` (not fully vendored; install via `npx skills add`)
- **CLI / registry:** https://skills.sh/

### Superpowers (obra/superpowers) — partial

- **Source:** [obra/superpowers](https://github.com/obra/superpowers)
- **License:** MIT
- **Contents:** Only `using-git-worktrees` — other Superpowers skills duplicate our lifecycle stack and are skipped by `vendor-external-skills.sh`
- **Location:** `skills/using-git-worktrees/` (vendored via `packages/superpowers/`)

### delegate-skills (multi-CLI delegation)

- **Source:** [amElnagdy/delegate-skills](https://github.com/amElnagdy/delegate-skills)
- **License:** MIT
- **Contents:** 18 skills — orchestrator delegates to Cursor, Claude, Codex, OpenCode, and other implementer CLIs
- **Location:** `skills/*-delegate`, `skills/delegate-setup`

### review-skills (debate PR review)

- **Source:** [amElnagdy/review-skills](https://github.com/amElnagdy/review-skills)
- **License:** MIT
- **Contents:** `debate-review`, `babysit-pr` — requires delegate-skills lanes
- **Location:** `skills/debate-review`, `skills/babysit-pr`

## License

This repository is licensed under MIT. See [LICENSE](LICENSE).

Upstream components retain their original MIT licenses from their respective repositories.
