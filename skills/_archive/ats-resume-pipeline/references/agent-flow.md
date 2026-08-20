# Agent Flow & Data Contracts

Documents how data flows between the orchestrator (`SKILL.md`) and the six sub-agents.

---

## Overview

```
User Input (resume + JD)
        │
        ▼
┌─────────────────────────┐
│  Step 1: Structured     │
│  Analysis (in-context)  │
│  No external scripts    │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│  Step 2: Gap Analyzer   │
│  gap-analyzer.md        │
│  → gap_analysis         │
└───────────┬─────────────┘
            │ (gap analysis feeds all downstream)
            ▼
┌─────────────────────────┐
│  Step 3: Bullet         │
│  Rewriter               │
│  bullet-rewriter.md     │
│  → rewrites             │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│  Step 4: Diff Generator │
│  diff-generator.md      │
│  → change_log           │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│  Step 5: ATS Scorer     │
│  ats-scorer.md          │
│  → scores               │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│  Step 6: Synthesis      │
│  (Orchestrator merges   │
│   all outputs)          │
└───────────┬─────────────┘
            │
            ▼
      Final Output
```

**Pipeline is strictly sequential.** Each step depends on the output of the previous step. Do not run agents in parallel — the bullet rewriter needs gap analysis, the diff generator needs rewrites, and the ATS scorer needs the tailored resume.

---

## Data Contracts

### Step 1 Output: Structured Analysis

Produced by in-context analysis (no external script). Consumed by all agents.

```json
{
  "resume": {
    "summary": "string | null",
    "experience": [
      {
        "company": "string",
        "role": "string",
        "start_date": "string",
        "end_date": "string | Present",
        "bullets": ["string"]
      }
    ],
    "skills": ["string"],
    "education": [
      {
        "institution": "string",
        "degree": "string",
        "year": "string"
      }
    ],
    "projects": ["string"] ,
    "certifications": ["string"],
    "all_technical_skills": ["string"],
    "all_soft_skills": ["string"],
    "cumulative_years": "number",
    "quantified_achievements": ["string"]
  },
  "jd": {
    "requirements": [
      {
        "text": "string",
        "category": "Core Technical | Supporting Technical | Process | Soft Skills | Nice-to-Have | Boilerplate",
        "is_truly_required": "boolean"
      }
    ],
    "keywords": ["string"],
    "years_required": "number",
    "seniority_level": "junior | mid | senior | staff | manager",
    "domain": "string"
  },
  "overlap": {
    "exact_matches": ["string"],
    "terminology_mismatches": [
      {
        "resume_term": "string",
        "jd_term": "string"
      }
    ],
    "truly_missing": ["string"],
    "semantic_matches": [
      {
        "resume_evidence": "string",
        "jd_requirement": "string"
      }
    ],
    "initial_match_pct": "number"
  }
}
```

---

### Step 2 Output: Gap Analysis

Produced by `agents/gap-analyzer.md`. Consumed by bullet-rewriter, cover-writer, interview-prep, diff-generator, and orchestrator.

```json
{
  "candidate_profile": {
    "career_stage": "junior | mid-level | senior | staff+",
    "estimated_years": "number",
    "move_type": "vertical | lateral | career_change | step_up",
    "profile_summary": "string",
    "severity_context": "string"
  },
  "jd_requirements": [
    {
      "requirement": "string",
      "category": "string",
      "is_truly_required": "boolean",
      "flexibility_note": "string | null"
    }
  ],
  "hard_gaps": [
    {
      "requirement": "string",
      "jd_category": "string",
      "severity": "DEAL-BREAKER | SIGNIFICANT | MINOR",
      "status": "missing | partial",
      "adjacent_experience": "string",
      "mitigation": "string",
      "screening_impact": "string",
      "learning_curve": "string"
    }
  ],
  "soft_gaps": [
    {
      "requirement": "string",
      "jd_category": "string",
      "resume_evidence": "string",
      "suggestion": "string",
      "impact": "string"
    }
  ],
  "keyword_gaps": [
    {
      "jd_term": "string",
      "resume_term": "string | null",
      "gap_type": "true_gap | terminology_gap",
      "note": "string"
    }
  ],
  "strengths": [
    {
      "jd_requirement": "string",
      "resume_match": "string",
      "priority": "high | medium | low",
      "recommendation": "string"
    }
  ],
  "overall_assessment": {
    "match_percent": "number",
    "verdict": "STRONG_MATCH | STRONG_WITH_GAPS | MODERATE_MATCH | WEAK_MATCH | POOR_FIT",
    "one_line": "string",
    "top_strength": "string",
    "critical_gap": "string",
    "recommendation": "string"
  }
}
```

---

### Step 3 Output: Rewrites

Produced by `agents/bullet-rewriter.md`. Consumed by diff-generator, ats-scorer, and orchestrator.

```json
{
  "summary": {
    "original": "string | null",
    "rewritten": "string | null",
    "changes": ["string"]
  },
  "experience": [
    {
      "company": "string",
      "role": "string",
      "original_bullets": ["string"],
      "rewritten_bullets": ["string"],
      "bullets_reordered": "boolean",
      "reorder_reason": "string | null"
    }
  ],
  "skills_section": {
    "original": "string",
    "rewritten": "string",
    "keywords_added": ["string"],
    "note": "string"
  },
  "keywords_injected": [
    {
      "keyword": "string",
      "location": "string",
      "context": "string",
      "verified": "boolean"
    }
  ],
  "warnings": ["string"]
}
```

---

### Step 4 Output: Change Log

Produced by `agents/diff-generator.md`. Consumed by orchestrator.

```json
{
  "changes": [
    {
      "section": "string",
      "change_type": "rewrite | reorder | add | remove | terminology",
      "original": "string | null",
      "new_text": "string",
      "reason": "string",
      "jd_requirement": "string",
      "confidence": "high | medium | low",
      "flags": ["string"]
    }
  ],
  "summary": {
    "total_changes": "number",
    "bullets_rewritten": "number",
    "bullets_reordered": "number",
    "keywords_added": "number",
    "sections_added": "number",
    "terminology_fixes": "number",
    "items_needing_verification": "number"
  },
  "verification_checklist": ["string"]
}
```

---

### Step 5 Output: ATS Scores

Produced by `agents/ats-scorer.md`. Consumed by orchestrator.

```json
{
  "original_score": {
    "total": "number",
    "keyword_match": "number",
    "formatting": "number",
    "completeness": "number",
    "title_alignment": "number",
    "breakdown": "string"
  },
  "tailored_score": {
    "total": "number",
    "keyword_match": "number",
    "formatting": "number",
    "completeness": "number",
    "title_alignment": "number",
    "breakdown": "string"
  },
  "score_improvement": {
    "delta": "number",
    "primary_drivers": ["string"]
  },
  "keyword_audit": [
    {
      "jd_keyword": "string",
      "found": "boolean",
      "locations": ["string"],
      "variant_used": "string | null",
      "frequency": "number",
      "status": "MATCH | VARIANT_MISMATCH | MISSING",
      "recommendation": "string | null"
    }
  ],
  "formatting_issues": [
    {
      "issue": "string",
      "impact": "high | medium | low",
      "fix": "string"
    }
  ],
  "format_recommendation": {
    "portal_submission": "string",
    "email_submission": "string",
    "notes": "string"
  },
  "recommendations": ["string"]
}
```

---

### Optional: Cover Letter Output

Produced by `agents/cover-writer.md` when `/resume cover` is run.

```json
{
  "detected_culture": "string",
  "tone_rationale": "string",
  "standard": {
    "subject_line": "string",
    "body": "string",
    "word_count": "number",
    "gaps_addressed": ["string"],
    "strengths_highlighted": ["string"],
    "keywords_included": ["string"]
  },
  "short": {
    "body": "string",
    "word_count": "number",
    "best_for": "string"
  },
  "talking_points": ["string"]
}
```

---

### Optional: Interview Prep Output

Produced by `agents/interview-prep.md` when `/resume interview` is run.

```json
{
  "role_context": {
    "title": "string",
    "company": "string",
    "interview_style": "string",
    "estimated_rounds": "string"
  },
  "technical_questions": ["..."],
  "gap_defense": ["..."],
  "behavioral_questions": ["..."],
  "questions_to_ask": ["..."],
  "red_flags": ["..."]
}
```

---

### Optional: JD Comparison Output

Produced by `agents/jd-comparator.md` when `/resume compare` is run.

```json
{
  "jd_analyses": ["..."],
  "comparison_matrix": {
    "dimensions": ["..."],
    "rankings": { "best_overall_fit": {}, "best_growth_opportunity": {}, "highest_callback_likelihood": {} }
  },
  "shared_requirements": ["..."],
  "skill_investments": ["..."],
  "application_strategy": {}
}
```

---

## Agent Dependencies

| Agent | Reads | Writes | When |
|-------|-------|--------|------|
| `gap-analyzer.md` | structured analysis, resume, JD | gap_analysis | Always (Step 2) |
| `bullet-rewriter.md` | resume, JD, gap_analysis | rewrites | `/resume tailor` (Step 3) |
| `diff-generator.md` | original resume, tailored resume, gap_analysis, rewrites | change_log | `/resume tailor` (Step 4) |
| `ats-scorer.md` | original resume, tailored resume, JD | scores | `/resume tailor` (Step 5), `/resume ats` |
| `cover-writer.md` | tailored resume, JD, gap_analysis | cover_letter | `/resume cover` |
| `interview-prep.md` | gap_analysis, JD, tailored resume | interview_prep | `/resume interview` |
| `jd-comparator.md` | resume, multiple JDs | comparison | `/resume compare` |

---

## Execution Order by Command

### `/resume tailor` (strictly sequential)

1. Structured analysis (in-context) → structured data
2. `gap-analyzer.md` → gap_analysis *(required before step 3)*
3. `bullet-rewriter.md` → rewrites *(requires gap_analysis)*
4. `diff-generator.md` → change_log *(requires rewrites)*
5. `ats-scorer.md` → scores *(requires tailored resume)*
6. Orchestrator synthesizes → final output (all 7 sections)

### `/resume gap`

1. Structured analysis → structured data
2. `gap-analyzer.md` → gap_analysis
3. Output gap report

### `/resume ats`

1. Structured analysis → structured data
2. `ats-scorer.md` → scores (original only)
3. Output ATS score report

### `/resume cover`

Requires gap_analysis (from prior run or runs steps 1-2 first).

1. `cover-writer.md` → cover_letter
2. Output all three variants

### `/resume interview`

Requires gap_analysis (from prior run or runs steps 1-2 first).

1. `interview-prep.md` → interview_prep
2. Output interview preparation materials

### `/resume compare`

1. Structured analysis for each JD
2. `jd-comparator.md` → comparison
3. Output fit matrix and strategy
