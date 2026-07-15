# Research Report — Resume / Job-Hunt Skills (2026-07-15)

## Evaluated repos (criteria 1–5)

| Repo | ATS | Honest gaps | Master profile | DOCX | Cursor/Claude | Maintained | **Total /30** |
|------|-----|-------------|----------------|------|---------------|------------|---------------|
| [SankaiAI/ats-optimized-resume-agent-skill](https://github.com/SankaiAI/ats-optimized-resume-agent-skill) | 5 | 5 | 3 | **5** | 5 | 5 (2026-04) | **28** |
| [olegvg/resume-tailor-plugin](https://github.com/olegvg/resume-tailor-plugin) | 5 | 5 | **5** | 4 (pandoc) | 5 | 5 (2026-05) | **29** |
| [nishilbhave/ats-resume-tailor](https://github.com/nishilbhave/ats-resume-tailor) | 5 | **5** | 2 | 2 | 4 | 4 (2026-03) | **22** |
| [Paramchoudhary/ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills) | 4 | 4 | 3 | 2 | **5** | 5 (2026-06) | **23** |
| [varunr89/resume-tailoring-skill](https://github.com/varunr89/resume-tailoring-skill) | 4 | 5 | 4 | 4* | 4 | 4 (2026-02) | **25** |
| [art2url/career-agent-skills](https://github.com/art2url/career-agent-skills) | 4 | 4 | 2 | 1 | 5 | 4 (2026-04) | **20** |

\*varunr89 DOCX via optional `document-skills` plugin — not always installed.

### TOP selected for install

1. **olegvg** → `resume-tailor-master` (best master-profile model)
2. **SankaiAI** → `build-tailored-resume` (best deterministic DOCX)
3. **nishilbhave** → `ats-resume-pipeline` (honesty + interview/cover agents)
4. **Param subset** → `rs-*` (job analyzer, interview, linkedin, tech resume, tailor)

### Not bulk-installed

- Full Param 20-skill pack (noise) — only high-signal subset
- art2url pack — overlaps `freelance-hunt` / `linkedin-optimizer`; keep as optional later
- varunr89 — strong but heavy library + plugin dependency; patterns covered by olegvg + Sankai

### Paid / external deps (report separately)

| Dependency | Skill | Notes |
|------------|-------|-------|
| `pip install resume-skill` (or local renderer) | `build-tailored-resume` | Free OSS; local install — run `install-renderer.sh` |
| `pandoc` / weasyprint | `resume-tailor-master` | System packages for DOCX/PDF |
| Claude Code marketplace plugins | olegvg upstream | Optional; we vendor SKILL.md for Cursor |
| No paid ATS SaaS required | — | Scores are estimates |

### Reddit

Targeted Reddit search (r/ClaudeAI, r/cursor, r/jobsearchhacks) returned **no high-signal indexed threads** in this pass beyond GitHub skill ecosystems. Prefer GitHub skills above; community wisdom already encoded in nishil/olegvg anti-fabrication rules.
