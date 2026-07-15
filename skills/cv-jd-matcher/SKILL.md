---
name: cv-jd-matcher
description: >-
  Aligns Ali Salem's (or pasted) CV to a job before apply — Laravel/PHP, MERN
  Full Stack Tech Lead, and related senior roles. Scores match honestly (target
  90%+ when facts allow), checks ATS, writes a cover letter, and a max-7-day
  interview prep plan. Use when pasting resume plus JD, or asking for CV match,
  cover letter, ATS score, or interview prep. Always load ali-career-profile first
  for Ali. For Word .docx output, hand off to build-tailored-resume after tailor.
---

# CV–JD Matcher

## Goal

Before applying: **align the current CV to the new job**, produce a **cover letter**, and a **max 1-week plan** to close fit gaps and prepare for interviews — without inventing experience.

Target match: **~90% when real skills support it.** Otherwise report **max achievable** and blockers.

Works for: full-time, part-time, contract / freelance roles that have a clear JD.

## Profile first (Ali)

If the candidate is Ali Salem (or `ali-career-profile` is available):

1. **Read** `ali-career-profile` / `ali-career-profile.md` before any rewrite.
2. Enforce its Honesty Rules (Magento exposure-only, FinTech = Roqay gateways, no fabricated tools).
3. Use only listed achievements/metrics.
4. Target roles: Senior Laravel Engineer, Senior PHP Developer, Full Stack Tech Lead (UAE/Gulf + remote MENA/UK/EU).

## Inputs required

| Required | Optional |
|----------|----------|
| Current / master resume (paste, `master-resume.md`, or Ali profile) | Achievements log |
| Full job description | Company name / hiring manager |
| | Application deadline / interview date |

If resume or JD is missing, ask once — do not invent.

## Workflow

1. **Parse the JD** — Required vs Preferred vs Nice-to-have; seniority; FT/PT/contract; domain; red flags.
2. **Score match** — [scoring-method.md](scoring-method.md) + [keyword-clusters-laravel-php.md](keyword-clusters-laravel-php.md) (primary for Ali) + [keyword-clusters-ai-arch.md](keyword-clusters-ai-arch.md) only if JD is architecture/AI and Ali confirms fit.
3. **Tailor the CV** — Align *this* version to *this* job: reorder skills, reframe bullets with JD vocabulary, rewrite summary. **Facts only.** Goal: ready to submit.
4. **ATS check** — [ats-checklist.md](ats-checklist.md).
5. **Cover letter** — 250–350 words; hook → 2–3 JD requirements mapped to real proof → close. Every claim from resume/achievements.
6. **7-day plan (max)** — [week-prep-plan.md](week-prep-plan.md): fit actions + interview prep only. Cap at 7 days; shorter if interview is sooner.
7. **Interview prep pack** — STAR stubs, technical + leadership Qs, honest gap study.
8. **Explain changes** — Material edits + recruiter one-liner: would this earn a screen?

## Non-negotiable rules

- Never invent employers, titles, technologies, metrics, or certifications.
- Partial credit only when the user can defend the skill in interview.
- Prefer measurable outcomes; use `[add metric]` when unknown.
- No keyword stuffing.
- Cover letter mirrors JD language naturally — not a resume paste.

## Output format (always)

```
1. JD summary (what they really want; FT / PT / contract)
2. Match score: X% → max achievable: Y%
3. Gap table (Present / Partial / Missing)
4. Tailored CV (application-ready)
5. Cover letter (copy-ready)
6. ATS notes
7. 7-day fit & interview plan (or fewer days if urgent)
8. Interview prep pack
9. What changed and why
```

### Interview prep pack (minimum)

- 5 STAR story stubs mapped to JD themes
- 8–12 likely technical questions (system design / AI production / backend)
- 3–5 leadership / behavioral questions
- Gaps to study (honest)

### Cover letter (minimum)

- 250–350 words
- Company + role named
- 2–3 requirement → proof mappings
- No invented metrics

## Related skills

- `ali-career-profile` — **load first** for Ali Salem facts + honesty rules
- `build-tailored-resume` — DOCX Word render after content is tailored
- `resume-tailor-master` — master-profile visibility system + pandoc DOCX
- `ats-resume-pipeline` — multi-agent gap / ATS / cover / interview pipeline
- `freelance-hunt` — triage FT / PT / freelance / client before deep tailor
- `linkedin-optimizer` — profile / recruiter visibility
- `rs-interview-prep-generator` / `rs-job-description-analyzer` — Param ResumeSkills helpers
- `career-branding` — fuller standards library
- `career-assistant` — legacy Data Engineering / Azure only
