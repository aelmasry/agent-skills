# Career Branding Workflows

## Framework before Content (all workflows)

Every workflow runs in two phases:

| Phase | Actions |
|-------|---------|
| **Framework** | Select template → show structure → map placeholders to memory files |
| **Content** | Read memory → fill facts → validate → save to `outputs/` |

If memory is empty, stop after Framework phase. See `framework/workflow-order.md`.

---

## Resume Review

1. Read `memory/profile.md`, `achievements-log.md`, `skills-knowledge-base.md`, `professional-identity.md`
2. Parse user-provided resume (or draft from memory + `templates/resume/master-resume.md`)
3. ATS check per `.cursor/rules/resume-standards.mdc`
4. Compare keywords to `career-goals.md` and `keyword-reference.md`
5. Deliver 8-section standard review
6. Provide improved version in `outputs/` if requested

## Resume Tailoring (Resume + JD)

1. Parse JD into Required vs Preferred skills
2. Build keyword match table (Present / Partial / Missing)
3. Estimate approximate ATS match with rationale
4. Tailor summary, skills order, and bullets — facts unchanged
5. Explain every material change

## LinkedIn Optimization

1. Read identity, profile, skills, career-goals
2. Audit headline, About, current role, skills, projects, featured
3. Apply `.cursor/rules/linkedin-standards.mdc`
4. Deliver 8-section review + improved sections
5. Recommend Top 3 pinned skills

## Cover Letter

1. Confirm resume facts + full JD + company name
2. Structure: hook → requirement alignment → second proof → close
3. 250–350 words; every claim traces to memory
4. Mirror JD language naturally

## Interview Preparation

1. Extract top themes from JD or `career-goals.md`
2. Select 5–8 achievements from log; build STAR stories
3. Prepare technical + leadership question bank
4. Output to `templates/interviews/interview-notes.md` format

## Achievement Generator

1. User provides raw context (project, role, outcome)
2. Apply bullet pattern: verb + scope + method + outcome
3. Offer 2–3 variants (resume bullet, LinkedIn bullet, STAR)
4. Ask for metrics if missing

## Executive Branding Review

1. Emphasize scope, P&L or business impact, org-level influence
2. Use `templates/resume/executive-resume.md` structure
3. Shorter technical depth, stronger leadership narrative

## Content / Thought Leadership

1. Align hook to `professional-identity.md`
2. 3–5 practitioner takeaways; no hype
3. Optional: bilingual only if `writing-style.md` specifies

## Career Planning

1. Assess current state from memory files
2. Gap analysis vs `career-goals.md`
3. 90-day and 12-month action plan
4. Output `templates/career/career-plan.md`

## Incomplete Inputs

| Task | Minimum required |
|------|------------------|
| Resume review | Resume text or filled memory |
| LinkedIn review | Profile URL or pasted sections |
| Job matching | Resume + full JD |
| Cover letter | Resume + JD + company |
| Interview prep | Target role or JD |

Ask targeted questions from SKILL.md if missing.
