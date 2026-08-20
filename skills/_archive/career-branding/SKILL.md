---
name: career-branding
description: >-
  Career branding for resume optimization, LinkedIn positioning, ATS tailoring,
  cover letters, interview prep, executive branding, and thought leadership.
  Works standalone or with the career-branding workspace (memory/, prompts/,
  templates/). Use when the user asks for resume review, LinkedIn optimization,
  job matching, cover letter, interview preparation, personal branding, recruiter
  perspective, or hiring manager review.
---

# Career Branding

## Primary Goal

Maximize interview opportunities by improving career documents while keeping all information truthful.

**Never invent** experience, projects, certifications, metrics, or technologies.

## Standalone vs Workspace Mode

| Mode | When | What to read |
|------|------|--------------|
| **Workspace** | User has `career-branding` repo open | `memory/`, `prompts/`, `templates/`, `.cursor/rules/` |
| **Standalone** | Any other project or pasted documents | This skill + `standards/` + user-provided content |

In standalone mode, ask the user for resume/LinkedIn/JD text and target role. Apply standards from `standards/` directly.

## Core Principles

Read [standards/core-principles.md](standards/core-principles.md) — truthfulness, quality bar, 8-section review format.

## Standards (always apply)

| Document | Use for |
|----------|---------|
| [writing-standards.md](standards/writing-standards.md) | Voice, structure, anti-patterns |
| [resume-standards.md](standards/resume-standards.md) | ATS, sections, bullet patterns |
| [linkedin-standards.md](standards/linkedin-standards.md) | Headline, About, recruiter search |
| [content-creation-standards.md](standards/content-creation-standards.md) | Thought leadership, posts |
| [interview-standards.md](standards/interview-standards.md) | STAR, technical + leadership prep |
| [positioning-focus.md](standards/positioning-focus.md) | Role targeting, out-of-scope guardrails |

## Workflow Routing

| User request | Standards | Details |
|--------------|-----------|---------|
| Resume review | resume, writing | [workflows.md](workflows.md#resume-review) |
| Resume tailoring + JD | resume, writing | [workflows.md](workflows.md#resume-tailoring-resume--jd) |
| LinkedIn optimization | linkedin, writing | [workflows.md](workflows.md#linkedin-optimization) |
| Cover letter | writing, resume | [workflows.md](workflows.md#cover-letter) |
| Interview prep | interview | [workflows.md](workflows.md#interview-preparation) |
| Executive branding | resume, positioning | [workflows.md](workflows.md) |
| Thought leadership | content-creation | [workflows.md](workflows.md) |
| JD analysis | — | [keyword-reference.md](keyword-reference.md) |

Full step details: [workflows.md](workflows.md)

## Framework before Content

When using the career-branding workspace:

1. **Framework phase** — load template; produce scaffold with `[PLACEHOLDERS]`
2. **Content phase** — read `memory/`; fill placeholders from facts only
3. **If memory empty** — deliver scaffold + list which memory files to fill

## Standard Review Format

For document reviews (resume, LinkedIn, cover letter):

1. Overall assessment
2. Strengths
3. Weaknesses
4. Missing keywords (relative to stated goal)
5. ATS / platform recommendations
6. Recruiter recommendations
7. Improved version
8. Explanation of significant changes

## Related Skills

- `cv-jd-matcher` — align CV to JD, cover letter, ATS, ≤7-day interview prep
- `freelance-hunt` — opportunity hunt (FT / PT / freelance / potential client)
- `linkedin-optimizer` — LinkedIn profile + recruiter/client visibility
- `career-assistant` — legacy Data Engineering / Azure / Fabric lanes
- `linkedin-content-creator` — LinkedIn post drafting persona
- `brand-guardian` — personal/professional brand strategy
- `recruitment-specialist` — recruiter-side perspective

## Clarification Prompts

When information is missing, ask:

- "What was team size, scale, or measurable outcome?"
- "Which systems did you architect or own in production?"
- "What is your target role title and geography?"
- "Do you hold [relevant] certifications?"

Never fill gaps with invented answers.
