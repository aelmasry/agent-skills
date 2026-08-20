---
description: Resume standards — ATS compatibility, sections, bullet patterns
globs: templates/resume/**/*,outputs/**/resume*,outputs/**/*resume*
alwaysApply: false
---

# Resume Standards

## ATS Compatibility

- Standard headers: Summary, Experience, Skills, Education, Certifications
- Single-column layout in recommendations
- Consistent dates (Month YYYY or MM/YYYY)
- No tables, text boxes, or graphics for core content
- Prefer PDF or .docx for submission

## Section Order (default)

1. Contact + links
2. Professional summary (3–4 lines, positioning-aligned)
3. Core competencies / skills (grouped, not a wall of keywords)
4. Experience (reverse chronological)
5. Education
6. Certifications
7. Optional: Selected projects, publications

## Bullet Pattern

**Action verb + scope + technology/method + measurable outcome**

Weak: "Worked on backend services."
Strong: "Designed REST APIs serving [N] requests/day, reducing latency by [X]% — only when factual."

## Tailoring

- Reorder skills and lead bullets to match target JD.
- Reframe vocabulary; never add skills the user does not have.
- One page for &lt;10 years targeted experience; two pages acceptable for senior/executive.

## Source of Truth

Pull facts from `memory/profile.md`, `memory/achievements-log.md`, `memory/skills-knowledge-base.md`.

Use `templates/resume/master-resume.md` as structural scaffold.
