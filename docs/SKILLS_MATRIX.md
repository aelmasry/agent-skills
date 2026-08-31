# Skills Matrix — Keep / Merge / Drop

Phase-1 audit of the unified matrix: `agent-skills/skills/` + `~/.agents/skills/`.

Active skills install via `install.sh` / `bootstrap` (skips `skills/_archive/`). Azure/Foundry/Entra and brand skills live in this repo with everything else; tools consume them through symlinks.

---

## Keep — Core (Essential)

### Meta / Orchestration

| Skill | Home | Notes |
|-------|------|-------|
| `using-agent-skills` | repo | Unified router |
| `find-skills` | repo | Ecosystem discovery (`npx skills`) |
| `vercel-web-skills` | repo | Bridge to vercel-labs packages |
| `ali-engineering-workflow` | repo | Personal orchestrator + Azure bridge |
| `context-engineering` | both | Context optimization |
| `agents-orchestrator` | repo | Multi-agent pipelines |
| `minimal-change-engineer` | repo | Scope discipline |

### Lifecycle workflows (Define → Ship)

| Phase | Skills |
|-------|--------|
| Define | `interview-me`, `idea-refine`, `spec-driven-development` |
| Plan | `planning-and-task-breakdown` |
| Build | `incremental-implementation`, `test-driven-development`, `api-and-interface-design`, `frontend-ui-engineering`, `source-driven-development`, `doubt-driven-development` |
| Verify | `browser-testing-with-devtools`, `debugging-and-error-recovery` |
| Review | `code-review-and-quality`, `code-simplification`, `security-and-hardening`, `performance-optimization` |
| Ship | `git-workflow-and-versioning`, `ci-cd-and-automation`, `deprecation-and-migration`, `documentation-and-adrs`, `observability-and-instrumentation`, `shipping-and-launch` |

### Career (canonical 6)

| Skill | Role |
|-------|------|
| `ali-career-profile` | Facts + honesty gate |
| `freelance-hunt` | Opportunity scoring |
| `cv-jd-matcher` | JD match + strategy |
| `build-tailored-resume` | DOCX pipeline |
| `linkedin-optimizer` | Profile SEO |
| `rs-interview-prep-generator` | STAR packs (rename deferred to Phase 2) |

### Brand / content

| Skill | Role |
|-------|------|
| `personal-brand` | Voice + pillars (always first) |
| `content-matrix` | 32 headlines (adapted from charlie947; Motivational → Builder story) |
| `social-content-system` | Draft LinkedIn / IG / Reel |
| `social-visuals` | One visual skill: HTML, whiteboard, branded, carousel, insight-quote |
| `analytics-review` | After-the-post metrics loop |

Not vendored from charlie947: `voice-builder`, `post-writer`, `post-formatter`, `profile-optimizer`, `hook-generator`, `analytics-dashboard`, `newsletter-voice`, `youtube-thumbnail`, `pinned-comment`, `post-scorer`, `niche-research` (defer).

### Architecture / product personas

`software-architect`, `backend-architect`, `api-platform-engineer`, `ai-engineer`, `data-engineer`, `mcp-builder`, `product-manager`, `senior-project-manager`, `reality-checker`, `test-engineer`, `accessibility-auditor`, `ui-designer`

### Security (slim core)

`security-architect`, `security-auditor`, `application-security-engineer`

### Azure / Microsoft (in repo)

All `azure-*`, `entra-*`, `microsoft-foundry/**`, `appinsights-instrumentation`, `airunway-aks-setup`, `python-appservice-deploy`

---

## Merge — Absorbed into survivors

| Survivor | Archived (absorbed) | What was ported |
|----------|---------------------|-----------------|
| `build-tailored-resume` | `resume-tailor-master`, `ats-resume-pipeline`, `rs-resume-tailor`, `rs-tech-resume-optimizer` | ATS rules, agent-flow, section templates → `build-tailored-resume/references/` |
| `cv-jd-matcher` | `rs-job-description-analyzer` | Scoring extras → `cv-jd-matcher/references/` |
| `linkedin-optimizer` | `rs-linkedin-profile-optimizer`, `career-branding` | Visibility / branding notes → `linkedin-optimizer/references/` |
| `code-review-and-quality` | `code-reviewer` | Reviewer mode section in SKILL.md |
| `performance-optimization` | `web-performance-auditor`, `performance-benchmarker` | CWV + load-test modes |
| `security-and-hardening` | `senior-secops-engineer` | Secrets / defensive defaults section |
| `frontend-ui-engineering` | `ux-architect` (optional checklist only) | CSS systems checklist → references; persona archived |

---

## Drop / Defer — `skills/_archive/`

Not auto-routed. Invoke only when the user explicitly asks.

### Career legacy

- `career-assistant`
- `career-branding` (after absorb)

### Security specialists

- `penetration-tester`, `incident-responder`, `compliance-auditor`, `threat-detection-engineer`, `cloud-security-architect`, `senior-secops-engineer`

### Marketing / growth

- `content-creator`, `linkedin-content-creator`, `social-media-strategist`, `brand-guardian`, `developer-advocate`
- `recruitment-specialist`, `personal-growth-mentor`

### UX / QA absorbed or deferred

- `persona-walkthrough-specialist`, `ux-researcher`, `ux-architect`
- `api-tester`
- `code-reviewer`, `web-performance-auditor`, `performance-benchmarker`

### Career absorb targets

- `resume-tailor-master`, `ats-resume-pipeline`, `rs-resume-tailor`, `rs-tech-resume-optimizer`
- `rs-job-description-analyzer`, `rs-linkedin-profile-optimizer`

---

## ADG role map

| ADG role | Skills | Exposure |
|----------|--------|----------|
| **Orchestrator** | `using-agent-skills`, `ali-engineering-workflow`, `agents-orchestrator` | Context prompt (router) |
| **Planner** | `interview-me`, `idea-refine`, `spec-driven-development`, `planning-and-task-breakdown`, `product-manager`, `senior-project-manager` | Workflow |
| **Context Retriever** | `context-engineering`, `source-driven-development`, `find-skills`, `ali-career-profile` | Workflow + `npx skills find` |
| **Executor** | Lifecycle Build + Azure domain + `build-tailored-resume` | Workflow + scripts |
| **Reviewer / Auditor** | `code-review-and-quality`, security core, `reality-checker`, `doubt-driven-development`, `accessibility-auditor` | Workflow / persona |
| **Memory / Profile** | `ali-career-profile`, `documentation-and-adrs` | Context prompt |

---

## Counts (post Phase 1)

| Layer | Approx count | Location |
|-------|--------------|----------|
| Active repo skills | ~89 | `skills/*` (excl. `_archive`) |
| Archived | 28 | `skills/_archive/` |
| Shared references | 7 | `references/` |

See also: [SKILLS_ARCHITECTURE.md](SKILLS_ARCHITECTURE.md).
