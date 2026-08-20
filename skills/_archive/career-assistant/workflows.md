# Career Assistant Workflows

## Resume Review

### Step 1: Parse the document

Identify and evaluate:

- Contact information and professional links
- Summary or professional profile
- Core competencies / skills section
- Work experience (titles, dates, employers, bullets)
- Education
- Certifications
- Projects (if present)

### Step 2: ATS compatibility check

- Use standard section headers (Experience, Education, Skills, Certifications)
- Avoid tables, text boxes, headers/footers, and graphics for core content
- Use a single-column layout in recommendations
- Ensure dates are consistent (MM/YYYY or Month YYYY)
- Check that acronyms appear with full terms at least once (e.g., "Azure Data Factory (ADF)")
- Verify file format guidance if relevant (PDF or .docx; avoid complex formatting)

### Step 3: Bullet point improvement

Apply this pattern where facts support it:

**Action verb + scope + technology/method + measurable outcome**

Examples of weak → strong (only when user confirms facts):

- Weak: "Worked on data pipelines in Azure."
- Strong: "Built Azure Data Factory pipelines ingesting 15+ source systems, reducing manual data loads by X%."

If metrics are unknown, ask the user or note "[add metric]" for them to supply.

### Step 4: Keyword alignment

Compare resume against target role (or infer from experience if no target given). Use [keyword-reference.md](keyword-reference.md) for domain clusters.

Flag keywords that are:

- **Present** — already in resume
- **Partial** — related term used but JD-specific term missing
- **Missing** — not represented; only suggest adding if user has the experience

### Step 5: Deliver standard 8-section response

See SKILL.md Response Format.

---

## LinkedIn Optimization

### Step 1: Headline (max ~220 characters)

Structure: **Role | Specialty | Value or differentiator**

- Include primary title recruiters search for
- Add 2–3 high-value keywords (e.g., Azure, Fabric, Data Engineering)
- Avoid generic phrases ("passionate professional", "results-driven")

### Step 2: About section

- Open with a clear positioning statement in first person
- First 2–3 lines must carry keywords (visible before "see more")
- Include 2–4 proof points drawn from real experience
- End with a light call to action (open to roles, consulting, etc.) if appropriate

### Step 3: Experience

- Mirror resume facts; do not contradict dates or titles
- Expand bullets with context LinkedIn allows (team size, tools, business domain)
- Use the same keyword vocabulary as the target role

### Step 4: Skills

- Recommend Top 3 pinned skills aligned to target role
- Suggest additional skills to add or reorder based on endorsements and JD fit
- Note skills to remove if they dilute positioning

### Step 5: Featured, Projects, Certifications

- Identify gaps vs. target role
- Recommend what to feature (certifications, dashboards, blog posts, repos) only from user's real work

### Step 6: Recruiter search optimization

- Ensure headline and About contain exact phrases recruiters filter on
- Check location and industry settings if user provides them
- Recommend Open to Work settings only if user asks

Deliver standard 8-section response with improved LinkedIn sections in section 7.

---

## Job Matching (Resume + JD)

### Step 1: Parse the job description

Extract into two lists:

**Required skills** — "must have", "required", minimum qualifications

**Preferred skills** — "nice to have", "preferred", "bonus"

Also note:

- Job title and seniority signals
- Domain (finance, healthcare, retail, etc.)
- Tools and platforms named explicitly
- Soft skills and leadership expectations

### Step 2: Build keyword match table

| Keyword / Skill | JD priority | Resume status | Notes |
|-----------------|-------------|---------------|-------|
| Example: PySpark | Required | Partial | Spark mentioned, not PySpark |
| Example: Fabric | Required | Missing | No Fabric/OneLake reference |

### Step 3: Estimate ATS match

Provide an approximate match percentage with rationale:

- Weight required skills heavily
- Note partial matches at reduced weight
- Do not claim precision; label as "approximate"

Example: "Approximate ATS match: 68%. Strong on Azure SQL and ADF; gaps in Fabric and Databricks."

### Step 4: Tailor the resume

- Reorder skills and bullets to lead with JD-aligned experience
- Reframe existing bullets using JD vocabulary without changing facts
- Add a tailored summary targeting this role
- Do not add skills or experience the user does not have

### Step 5: Explain changes

Section 8 must explain every material modification and why it improves match.

---

## Cover Letter Workflow

### Step 1: Confirm inputs

- Resume (facts source)
- Job description
- Company name
- Optional: hiring manager, referral, why this company

### Step 2: Structure the letter

1. Opening — role + company + hook tied to a real achievement
2. Body paragraph 1 — align top JD requirement to specific experience
3. Body paragraph 2 — second requirement + measurable outcome
4. Closing — enthusiasm, availability, call to action

Keep to one page (~250–350 words).

### Step 3: Rules

- Mirror JD language naturally; no keyword stuffing
- Every claim must trace to the resume
- Avoid repeating the resume verbatim; add context and motivation
- Professional tone; no exaggerated claims

### Step 4: Deliver response

Use adapted format from SKILL.md: sections 1–6 as analysis, section 7 as the improved cover letter, section 8 as change explanations.

---

## Clarification Prompts

When information is missing, ask targeted questions:

- "What was the approximate data volume, pipeline count, or team size?"
- "Did you use Synapse, Fabric, or ADF for this project?"
- "Do you hold DP-203, PL-300, or other Azure certifications?"
- "What is your target role title and seniority level?"
- "Which geography or work arrangement are you targeting?"

Never fill gaps with invented answers.
