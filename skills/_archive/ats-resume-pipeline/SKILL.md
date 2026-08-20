---
name: ats-resume-pipeline
description: Tailor a resume to a specific job description. Spawns sequential agents to analyze gaps, rewrite bullets, generate diffs, and score ATS compatibility. Trigger when user says "tailor my resume", "match my resume to this JD", "help me apply for this job", "update my resume for this role", or provides a job description alongside their resume.
---

# Resume Tailor Skill

Orchestrates a sequential pipeline of specialized agents to analyze a resume against a job description, then produces a tailored resume with gap analysis, ATS scoring, change tracking, and actionable next steps.

## Commands

- `/resume tailor` — Full pipeline: analysis, gap report, rewrite, diff, ATS score, synthesis
- `/resume gap` — Gap analysis only (no rewrite)
- `/resume ats` — ATS compatibility score only
- `/resume cover` — Generate cover letter (3 variants: standard, short, talking points)
- `/resume interview` — Interview prep from gap analysis + JD
- `/resume compare` — Compare resume against multiple JDs with fit matrix

---

## Input Requirements

Before starting, collect:
1. **Resume** — paste as text, or provide a `.pdf`/`.docx` file path
2. **Job Description** — paste full JD text or provide a file path
3. **Target role title** (if not clear from JD)
4. **Optional:** Company name, submission channel (ATS portal / email / referral), specific concerns ("I lack X skill")

If any required inputs are missing, ask for them before proceeding. Do NOT proceed with partial inputs.

For `/resume compare`, collect 2-5 job descriptions instead of one.

---

## Full Tailor Flow (`/resume tailor`)

### Step 1: Structured Analysis (Replaces Python Parser)

Analyze the resume and JD directly in-context. Do NOT use any external scripts. Extract the following structured data by reading both documents carefully:

**From the Resume:**
- All technical skills (languages, frameworks, tools, platforms, databases, methodologies) — extract everything mentioned, not just from a predefined list
- All soft skills and leadership indicators (team size, mentoring, cross-functional work)
- Experience timeline: for each role, extract company, title, start date, end date. Calculate cumulative experience handling overlapping roles correctly (overlapping months count once, not twice)
- Section-by-section breakdown: summary, experience, skills, education, projects, certifications
- Quantified achievements: any numbers, percentages, scale indicators

**From the Job Description:**
- All requirements classified as:
  - **Core Technical** — Primary tech stack (weighted highest)
  - **Supporting Technical** — Infrastructure, tooling, adjacent tech
  - **Process & Methodology** — Agile, code review, testing practices
  - **Soft Skills** — Communication, leadership, collaboration
  - **Nice-to-Have** — Explicitly optional items
  - **Boilerplate** — Generic filler ("team player", "fast-paced environment") — ignore these
- Years of experience required
- Seniority signals (IC vs lead vs manager)
- Domain/industry requirements

**Keyword Overlap (with semantic matching):**
- Exact matches between resume and JD
- Terminology mismatches (same skill, different name — e.g., "JS" vs "JavaScript")
- Truly missing skills (not in resume at all)
- Semantic matches (e.g., resume says "led a team of 5" → JD says "leadership experience")

Store this analysis in memory for use by all downstream agents.

### Step 2: Gap Analyzer Agent

Read `agents/gap-analyzer.md` and run it with:
- Full resume text
- Full JD text
- The structured analysis from Step 1

This agent produces:
- Candidate profile (career stage, move type)
- JD requirement classification (what's truly required vs aspirational)
- Hard gaps with severity ratings (DEAL-BREAKER / SIGNIFICANT / MINOR)
- Soft gaps with rewrite suggestions
- Keyword gaps (true gaps vs terminology mismatches)
- Strengths to emphasize
- Overall match assessment

**The gap analysis output feeds all downstream agents. This step must complete before proceeding.**

### Step 3: Bullet Rewriter Agent

Read `agents/bullet-rewriter.md` and run it with:
- Full resume text
- Full JD text
- Gap analysis output from Step 2

This agent produces:
- Rewritten summary (if applicable)
- Rewritten experience bullets using XYZ formula
- Rewritten skills section with JD-matched terminology
- List of keywords injected and where
- Warnings about estimated numbers needing verification

### Step 4: Diff Generator Agent

Read `agents/diff-generator.md` and run it with:
- Original resume text
- Tailored resume text (constructed from bullet rewriter output)
- Gap analysis output
- Bullet rewriter output

This agent produces:
- Section-by-section diff of all changes
- Change type classification (rewrite, reorder, add, remove, terminology)
- Reason for each change tied to JD requirements
- Confidence ratings and verification flags
- Summary statistics (X bullets rewritten, Y keywords added, etc.)

### Step 5: ATS Scorer Agent

Read `agents/ats-scorer.md` and run it with:
- Original resume text
- Tailored resume text
- Full JD text

This agent produces:
- Before/after ATS scores with dimension breakdown
- Complete keyword audit table
- Formatting issues
- File format recommendations
- Specific improvement recommendations

### Step 6: Synthesize & Output

After all agents complete, merge their outputs into the final deliverable following the Output Format below. Apply these validation rules during synthesis:

**Validation Rules:**
1. **No fabrication** — Cross-check every rewritten bullet against the original. If a rewrite adds experience, skills, or achievements not present or inferable from the original, reject it and use a conservative rewrite.
2. **Conflict resolution** — If the gap analyzer says something is a hard gap but the bullet rewriter added it, flag the conflict. Hard gaps cannot be resolved by rewriting — they must be addressed in the cover letter or action items.
3. **Confidence annotations** — Any change with `low` confidence or `[verify]` tags must appear in the verification checklist.
4. **Score consistency** — The ATS score improvement should be consistent with the number and type of changes made. A 5-point improvement with 15 keyword additions doesn't add up — investigate.

---

## Gap Only Flow (`/resume gap`)

1. Structured analysis (Step 1)
2. Gap Analyzer agent (Step 2)
3. Output: Gap report section only (from Output Format)

---

## ATS Only Flow (`/resume ats`)

1. Structured analysis (Step 1)
2. ATS Scorer agent (Step 5, using original resume only — no "tailored" score)
3. Output: ATS dashboard section only (from Output Format)

---

## Cover Letter Flow (`/resume cover`)

1. If no prior `/resume tailor` run in this session, run Steps 1-2 first (need gap analysis)
2. Read `agents/cover-writer.md` and run it with:
   - Tailored resume (or original if no tailor run)
   - Full JD text
   - Gap analysis output
   - Company name and role title
3. Output: All three cover letter variants (standard, short, talking points)

---

## Interview Prep Flow (`/resume interview`)

1. If no prior `/resume tailor` run in this session, run Steps 1-2 first (need gap analysis)
2. Read `agents/interview-prep.md` and run it with:
   - Gap analysis output
   - Full JD text
   - Tailored resume (or original)
   - Role title and company name
3. Output: Technical questions, gap defense scripts, behavioral questions, questions to ask, red flag preparation

---

## Multi-JD Comparison Flow (`/resume compare`)

1. Collect 2-5 job descriptions
2. Structured analysis (Step 1) for each JD
3. Read `agents/jd-comparator.md` and run it with:
   - Full resume text
   - All JD texts with role titles and company names
4. Output: Fit matrix, rankings, shared requirements, skill investment recommendations, application strategy

---

## Output Format

The full `/resume tailor` output must include ALL of the following sections in this order:

### 1. Executive Summary

One paragraph containing:
- Overall fit percentage
- Top strength (the single best match between resume and JD)
- Critical gap (the most important thing missing, or "none" if strong match)
- Verdict: one of `STRONG_MATCH`, `STRONG_WITH_GAPS`, `MODERATE_MATCH`, `WEAK_MATCH`, `POOR_FIT`
- One-sentence recommendation (apply as-is, tailor and apply, apply with strong cover letter, consider upskilling first)

### 2. ATS Score Dashboard

```
ATS COMPATIBILITY
=================
                    Original    Tailored    Change
Keyword Match       ██████░░░░  ████████░░  52% → 85%  (+33)
Formatting          ████████░░  ████████░░  80% → 80%  (+0)
Completeness        ███████░░░  ████████░░  70% → 80%  (+10)
Title Alignment     ████░░░░░░  █████████░  40% → 90%  (+50)
─────────────────────────────────────────────────────────
TOTAL               ██████░░░░  ████████░░  58% → 82%  (+24)
```

Include the dimension breakdown explanation from the ATS scorer.

### 3. Gap Report

Ordered by severity:

**DEAL-BREAKER gaps** (if any):
> These gaps may prevent your application from advancing. Address in cover letter and consider upskilling.

**SIGNIFICANT gaps:**
> Important but addressable. Covered by resume tailoring and cover letter.

**MINOR gaps:**
> Low risk. Nice-to-haves or items where your adjacent experience is sufficient.

For each gap: requirement, severity, current status, mitigation strategy.

### 4. Tailored Resume

The complete tailored resume text, ready to copy-paste. Clean formatting, no JSON, no metadata — just the resume as it should be submitted.

### 5. Change Log

A table showing every modification:

```
| # | Section | Change Type | Original | New | Reason | Confidence |
|---|---------|-------------|----------|-----|--------|------------|
| 1 | Summary | add | (none) | "Senior Backend..." | Match JD title | high |
| 2 | Exp - Fooddarzee #1 | rewrite | "Built REST APIs" | "Designed RESTful APIs..." | Add specificity + keywords | medium |
```

Flag items needing verification with a marker.

### 6. Verification Checklist

Numbered list of every item the candidate must verify before submitting:
- Estimated numbers that need confirmation
- Reframes that might overstate experience
- Terminology changes that need validation

### 7. Action Items

Numbered checklist of next steps:

```
[ ] Review and verify all [verify] tagged items in the tailored resume
[ ] Update resume file with tailored version
[ ] Submit via [recommended format] to [ATS/email]
[ ] Prepare cover letter addressing [critical gap]
[ ] Consider: [skill investment recommendation]
[ ] Run /resume interview for interview preparation
```

---

## Principles

- **Never fabricate experience or skills** — reframe what exists, flag what doesn't
- **Preserve the candidate's voice** — don't over-sanitize into generic corporate speak
- **Flag hard gaps honestly** — if a requirement genuinely can't be addressed, say so
- **Prioritize recency** — most relevant/recent experience gets the most attention
- **Every change needs a reason** — no modifications without a clear JD-driven rationale
- **Candidate has final say** — the verification checklist exists because the candidate must review and approve every change
