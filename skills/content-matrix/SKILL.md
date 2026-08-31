---
name: content-matrix
description: >-
  Generates 32+ concrete LinkedIn/Instagram post headlines by pairing Ali's
  four personal-brand pillars with eight content formats. Use when the user
  asks for post ideas, a content matrix, what to post this month, or a calendar
  of angles. Load personal-brand first. Do not use for drafting the post itself
  (that is social-content-system) or for profile SEO (linkedin-optimizer).
---

# Content Matrix

Adapted from [charlie947/social-media-skills](https://github.com/charlie947/social-media-skills)
(`content-matrix`, MIT). Voice, pillars, and handoff are Ali-specific.

Requires `personal-brand`. If it is not already in context, apply it first.

This skill produces **ideas only**. Drafting is `social-content-system`.
Graphics are `social-visuals`.

## Step 1 — Lock pillars

Use Ali's four pillars from `personal-brand`. Do not invent a fifth. Do not
ask what the pillars are unless Ali asks to change them.

1. Real AI tooling builds — what broke, what worked, with specifics
2. Architecture decisions — trade-offs from real projects (anonymized)
3. AI Solutions Architecture career transition — lessons, not motivational fluff
4. Gulf-region tech/AI adoption observations

If Ali names a one-off theme (a bug, a launch, a talk), map it onto the
closest pillar rather than adding a row.

## Step 2 — Build the 4 × 8 matrix

Markdown table. Pillars as rows. Formats as columns, always in this order:

| Format | What the cell must be |
|--------|------------------------|
| Actionable | Ultra-specific how-to. One thing the reader can do. |
| Builder story | A real shipped incident with a takeaway. Not inspiration, not "believe in yourself". |
| Analytical | Why something works the way it does. Mechanism, not slogans. |
| Contrarian | Against common advice in the niche, backed by something Ali can defend. |
| Observation | A quiet trend Ali has actually seen (Gulf, infra, AI tooling). |
| X vs Y | Compare two tools, styles, or architectures Ali has used. |
| Present vs future | Current state vs a specific prediction, with the why. |
| Listicle | A numbered list of mistakes, steps, or lessons from Ali's work. |

Every cell is a **specific headline**, not a theme.

- Good: "The Docker disk cleanup that bought me 40GB and a weekend"
- Bad: "Docker tips"

Rules for every cell:

- Sounds like Ali (production builder, not AI commentator)
- No fabricated metrics, clients, or outcomes
- No confidential Seddiqi / employer detail
- No generic "AI will change everything" or motivational filler
- English headlines (LinkedIn-first). Arabic variants only if Ali asks.

## Step 3 — Output

Do not wrap the table in a fenced code block. Print it as a markdown table
so it stays scannable.

Below the table:

1. Name the single strongest cell (pillar × format) and why it fits Ali now.
2. Flag any cell that needs a real number or story Ali has not confirmed.
3. Save to `content-matrix-YYYY-MM-DD.md` in the current working directory
   when file tools are available. Confirm the path.

## Step 4 — Handoff

Ask which cell to draft. Reference it as `Pillar × Format`.

Then:

- Copy → `social-content-system` (LinkedIn + optional IG/Reel)
- Visual → `social-visuals` after the draft exists
- Do not jump to `linkedin-optimizer` (that is profile SEO, not posts)

## What this skill does not do

- Does not write the post body
- Does not generate images
- Does not use Charlie Hills / Cowork voice files (`about-me.md`, `voice.md`)
- Does not add a Motivational column (replaced by Builder story)
