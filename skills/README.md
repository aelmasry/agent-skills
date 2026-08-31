# Skills catalog

111 active skills. Source of truth is this folder. Cursor, Claude Code, and OpenCode load them via symlinks (`./install.sh`).

Archived / absorbed skills live in [`_archive/`](_archive/) and are **not** installed.

External packages (delegate-skills, review-skills, one Superpowers skill): [docs/EXTERNAL_SKILLS.md](../docs/EXTERNAL_SKILLS.md)

---

## How to use

In chat: `Run code-review-and-quality before we merge.`  
Or name the skill: `Use azure-cost to explain this bill.`

Start with `using-agent-skills` if you are unsure which one applies. For Ali’s Azure/PHP stack, start with `ali-engineering-workflow`. For career work, always load `ali-career-profile` first.

---

## Meta / routing

| Skill | What it does |
|-------|----------------|
| `using-agent-skills` | Picks the right skill for the current task (start here if unsure). |
| `ali-engineering-workflow` | Routes Ali’s work to spec / TDD / API / security / Azure skills. |
| `find-skills` | Finds and installs extra skills from the public ecosystem (`npx skills`). |
| `vercel-web-skills` | Points to Vercel/React/Next.js packages when building web UI. |
| `agents-orchestrator` | Coordinates multi-step work with real skills and slash commands. |
| `adaptive-ai-workflow` | Understand-before-code workflow: size the change, spec/plan, then verify. |
| `skill-creator` | Create, edit, and evaluate new skills. |
| `context-engineering` | Sets up agent context so the session has the right files and facts. |
| `task-observer` | Logs friction and repeated mistakes so skills can be improved later. |
| `deep-search` | Exhaustive web research for exact, obscure facts (needle in a haystack). |

## External — delegate & review (amElnagdy)

| Skill | What it does |
|-------|----------------|
| `delegate-setup` | Discover CLIs and configure fleet lanes. |
| `cursor-delegate` | Delegate to Cursor Agent CLI. |
| `claude-delegate` | Delegate to Claude Code. |
| `codex-delegate` | Delegate to OpenAI Codex. |
| `opencode-delegate` | Delegate to OpenCode. |
| `*-delegate` (others) | Kimi, Grok, Copilot, Pi, Cline, Aider, etc. |
| `debate-review` | Two-model debate review on a PR/MR. |
| `babysit-pr` | Work review rounds until merge-ready. |

Requires Node 18+, `gh`/`glab`, and delegate lanes for review. Details: [EXTERNAL_SKILLS.md](../docs/EXTERNAL_SKILLS.md).

## Define → Plan

| Skill | What it does |
|-------|----------------|
| `interview-me` | Asks one question at a time until the real intent is clear. |
| `idea-refine` | Turns a rough idea into a sharp, actionable concept. |
| `spec-driven-development` | Writes a spec before any code. |
| `planning-and-task-breakdown` | Splits a spec into ordered, implementable tasks. |

## Build

| Skill | What it does |
|-------|----------------|
| `incremental-implementation` | Ships the change in small slices, not one giant diff. |
| `test-driven-development` | Writes tests first for logic, bugs, and behavior changes. |
| `frontend-ui-engineering` | Builds accessible, production UI. |
| `api-and-interface-design` | Designs stable APIs and module boundaries. |
| `source-driven-development` | Grounds code in official docs, not memory. |
| `doubt-driven-development` | Adversarial review of non-trivial decisions before they land. |
| `minimal-change-engineer` | Smallest possible diff — no drive-by refactors. |
| `git-workflow-and-versioning` | Branching, commits, and versioning for the change. |
| `using-git-worktrees` | Isolated git worktree / workspace before feature work (from obra/superpowers). |

## Verify / review / ship

| Skill | What it does |
|-------|----------------|
| `browser-testing-with-devtools` | Tests in a real browser via Chrome DevTools. |
| `debugging-and-error-recovery` | Systematic root-cause debugging when something breaks. |
| `code-review-and-quality` | Multi-axis review before merge. |
| `code-simplification` | Simplifies code without changing behavior. |
| `security-and-hardening` | Hardens input, auth, secrets, and integrations. |
| `performance-optimization` | Speeds up frontend, backend, queries, and Core Web Vitals. |
| `observability-and-instrumentation` | Adds logs, metrics, traces, and alerts. |
| `documentation-and-adrs` | Records architecture decisions. |
| `deprecation-and-migration` | Removes old APIs and migrates systems. |
| `ci-cd-and-automation` | Sets up or changes build/deploy pipelines. |
| `shipping-and-launch` | Pre-production checklist, rollout, and rollback. |

## Personas (role lens)

| Skill | What it does |
|-------|----------------|
| `software-architect` | System design, DDD, ADRs, trade-offs. |
| `backend-architect` | Scalable backend, data, and service design. |
| `api-platform-engineer` | Public/partner APIs: OpenAPI, versioning, gateway, DX. |
| `ai-engineer` | ML features, model integration, data pipelines. |
| `data-engineer` | Reliable data pipelines and storage. |
| `mcp-builder` | Designs and tests MCP servers. |
| `product-manager` | Discovery, roadmap, and shipping the right thing. |
| `senior-project-manager` | Spec → tasks with realistic scope. |
| `reality-checker` | Evidence-based “is this actually ready?” |
| `test-engineer` | Test strategy, suites, and coverage. |
| `accessibility-auditor` | WCAG audit: keyboard, screen reader, contrast. |
| `ui-designer` | Visual design systems and UI intent. |
| `security-architect` | Threat model and secure-by-design (not line-by-line SAST). |
| `security-auditor` | Vulnerability-focused security review. |
| `application-security-engineer` | AppSec across the SDLC: review, SAST/DAST, secure defaults. |

## Career (Ali)

Always load `ali-career-profile` first.

| Skill | What it does |
|-------|----------------|
| `ali-career-profile` | Facts, honesty rules, real stack and achievements — never invent. |
| `freelance-hunt` | Scores a full-time / part-time / freelance / client opportunity. |
| `cv-jd-matcher` | Aligns CV + cover letter + a short prep plan to a job. |
| `build-tailored-resume` | Produces an ATS-ready Word `.docx`. |
| `linkedin-optimizer` | Headline, About, Experience, Skills, and visibility. |
| `rs-interview-prep-generator` | STAR stories, practice questions, talking points. |

## Brand / content

Load `personal-brand` before writing posts. Profile SEO is `linkedin-optimizer` (career), not this path.

| Skill | What it does |
|-------|----------------|
| `personal-brand` | Ali’s voice, positioning, and audience. |
| `content-matrix` | 32+ headlines from Ali’s 4 pillars × 8 formats. |
| `social-content-system` | LinkedIn posts, Instagram carousels/Reels, cross-posting. |
| `social-visuals` | HTML or Gemini graphics for an already-drafted post. |
| `analytics-review` | Reviews post metrics and what to double down on. |

## Azure / Microsoft

| Skill | What it does |
|-------|----------------|
| `azure-prepare` | Prepares an azd app for Azure (`azure.yaml`, infra). |
| `azure-validate` | Pre-deploy readiness checks. |
| `azure-deploy` | Deploys an already-prepared app (`azd up` / Bicep / Terraform). |
| `azure-compute` | VMs and scale sets: size, create, connect, troubleshoot. |
| `azure-kubernetes` | Plan and configure production AKS. |
| `azure-storage` | Blob, Files, Queue, Table. |
| `azure-cost` | Bills, forecasts, waste, rightsizing. |
| `azure-diagnostics` | Production triage: App Service, AKS, Functions, messaging. |
| `azure-compliance` | Compliance / security audit (`azqr`, Key Vault expiry). |
| `azure-rbac` | Least-privilege role for an identity. |
| `azure-quotas` | Quota and usage across providers. |
| `azure-reliability` | Reliability posture for PaaS apps. |
| `azure-upgrade` | Plan/SKU/tier upgrades and migrations. |
| `azure-resource-lookup` | Find resources across subscriptions. |
| `azure-resource-visualizer` | Mermaid architecture of a resource group. |
| `azure-enterprise-infra-planner` | Landing-zone / hub-spoke / Bicep or Terraform (not azd). |
| `azure-cloud-migrate` | AWS/GCP/Heroku-style workloads → Azure. |
| `azure-messaging` | Event Hubs / Service Bus SDK issues. |
| `azure-kusto` | KQL against Azure Data Explorer. |
| `azure-ai` | Azure AI Search, Speech, OpenAI, Document Intelligence. |
| `azure-aigateway` | APIM as an AI gateway (cache, safety, MCP, tokens). |
| `appinsights-instrumentation` | Application Insights SDK and telemetry patterns. |
| `airunway-aks-setup` | AI Runway on AKS: cluster → GPU → first model. |
| `python-appservice-deploy` | Flask/Django/FastAPI onto App Service Linux. |
| `entra-app-registration` | Entra app registration and OAuth. |
| `entra-agent-id` | Entra Agent Identity blueprints and principals. |
| `microsoft-foundry` | Foundry agents: deploy, eval, fine-tune, optimize. |

Nested under `microsoft-foundry/` and `azure-kubernetes/` (loaded with the parent):

| Skill | What it does |
|-------|----------------|
| `microsoft-foundry/finetuning` | SFT / DPO / RFT fine-tunes. |
| `microsoft-foundry/models/deploy-model` | Deploy a Foundry model. |
| `…/preset` · `…/capacity` · `…/customize` | Preset, quota/capacity, and custom deploy paths. |
| `azure-kubernetes/azure-kubernetes-automatic-readiness` | Readiness checks for AKS Automatic. |

## Security / design extras

| Skill | What it does |
|-------|----------------|
| `owasp-security` | OWASP Top 10, ASVS, and LLM/agent security review. |
| `impeccable` | Design, critique, and polish visual work. |

## Tool extras

| Skill | What it does |
|-------|----------------|
| `browser-automation` | Load a page in a headless browser and report what actually happened. |
| `game-development` | Build, launch, and inspect a game or mod from the editor. |

---

## Install

From the repo root:

```bash
./install.sh
```

That recreates symlinks in `~/.cursor/skills`, `~/.claude/skills`, and `~/.agents/skills`.
See the [root README](../README.md) for clone/bootstrap on a new machine.
