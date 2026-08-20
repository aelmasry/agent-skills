---
name: freelance-hunt
description: >-
  Opportunity hunt for AI Engineering, Solutions Architecture, and Backend:
  full-time jobs, part-time roles, freelance/consulting gigs, and potential
  clients. Scores fit (Go/No-go/Negotiate), suggests channels, and produces a
  pitch or application angle. Use when the user shares a JD, gig, RFP, LinkedIn
  role, client lead, or asks whether to apply, bid, or approach a prospect —
  employment or freelance.
---

# Opportunity Hunt (`freelance-hunt`)

## Profile first

When working for **Ali Salem**, load `ali-career-profile` before scoring. Equal priority: full-time jobs and freelance/clients.

## Goal

Help select and pursue the **right opportunities** — not mass apply.

Opportunity types (all supported):

| Type | Examples |
|------|----------|
| **Full-time** | Staff AI Eng, Solutions Architect, etc. |
| **Part-time** | Fractional architect / advisor |
| **Freelance / contract** | Fixed-scope build, retainer |
| **Potential client** | Warm lead, inbound DM, company to approach |

Optimize for: fit to AI / Architecture / Backend positioning, seriousness of counterparty, clear next step.

## Inputs required

| Required | Optional |
|----------|----------|
| Opportunity text (JD, gig, brief, or prospect notes) | Master resume / `target-profile.md` |
| | Comp / rate expectations |
| | How you found them (referral, LinkedIn, board) |

## Workflow

1. **Classify type** — FT / PT / freelance / potential client.
2. **Score** — [opportunity-scorecard.md](opportunity-scorecard.md) (dimensions adapt by type).
3. **Recommend** — Go / No-go / Negotiate (with reasons).
4. **Positioning** — 1 short paragraph: why *you* for *this* opportunity.
5. **Next artifact** —
   - FT / PT with JD → tell user to run **`cv-jd-matcher`** (CV + cover letter + 7-day plan).
   - Freelance / RFP → [proposal-template.md](proposal-template.md).
   - Potential client → short outreach note + discovery questions (no spam).
6. **Channel advice** — [channels.md](channels.md).
7. **Comp / rate framework** — seniority × complexity × risk; never invent a number unless user provides data or asks for a labeled estimate.

## Non-negotiable rules

- No auto-apply / mass outreach
- No fake case studies
- Prefer fewer high-fit opportunities
- Flag vague scope, unpaid trials, IP red flags, “unicorn JD” mismatch

## Output format (always)

```
1. Opportunity snapshot (type: FT | PT | Freelance | Client)
2. Scorecard (scores + notes)
3. Recommendation: Go | No-go | Negotiate
4. Positioning pitch (copy-ready)
5. Next artifact:
   - Apply path → handoff to cv-jd-matcher
   - OR proposal skeleton
   - OR client outreach + discovery questions
6. Risks & questions to ask them
7. Next actions (3 max)
```

## Related skills

- `cv-jd-matcher` — after Go on a job/contract with a JD: tailor CV, cover letter, week plan
- `linkedin-optimizer` — inbound visibility (jobs + clients)
- `ali-career-profile` — facts + honesty gate before any apply pack
- `build-tailored-resume` — DOCX after content is ready
- `rs-interview-prep-generator` — STAR packs
