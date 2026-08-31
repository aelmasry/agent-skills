---
name: social-visuals
description: >-
  Produces LinkedIn/Instagram visuals for an already-drafted post: HTML/CSS
  screenshot graphic, Gemini whiteboard or branded infographic, slide-by-slide
  carousel prompts (1080x1350), or an insight-quote image. Use when the user
  asks to design a graphic, carousel images, infographic, quote card, or
  "make a visual for this post". Always load personal-brand first. Does not
  write the post (social-content-system) and does not optimize the LinkedIn
  profile (linkedin-optimizer).
---

# Social Visuals

Merged and adapted from [charlie947/social-media-skills](https://github.com/charlie947/social-media-skills)
(MIT): `graphic-designer`, `gemini-carousel`, `gemini-infographic`, `quote-post`.

Requires `personal-brand`. Apply it first if it is not in context.

Output is **prompts and/or HTML only**. Ali pastes Gemini prompts into a
separate Gemini chat with Create Image enabled. This skill does not publish
and does not call an image API.

Prompt templates: [references/gemini-prompts.md](references/gemini-prompts.md).

## Step 1 — Get the source post

Use the draft already in this conversation if one exists. Otherwise ask Ali
to paste the post (or the carousel slide copy from `social-content-system`).

If there is no post yet, stop and send him to `social-content-system` first.
Do not invent copy to decorate.

## Step 2 — Pick a mode

If Ali already named the format, skip this. Otherwise ask which one:

| Mode | Use when |
|------|----------|
| `html` | Framework, steps, comparison, or data. Editable. Screenshot to export. |
| `whiteboard` | Recap a workflow or list as a hand-drawn notebook/whiteboard photo. |
| `branded` | Same recap, clean flat infographic in brand colours. |
| `carousel` | Multi-slide 1080×1350 set with an approval gate. |
| `quote` | One insight line baked into an image. Not motivational posters. |

If Ali says "you decide": numbered steps / comparison / table → `html`.
Story or concept recap → `whiteboard`. Explicit carousel request → `carousel`.

## Brand defaults

`personal-brand` has no hex kit. Use these unless Ali pastes others:

- Background: `#0F172A`
- Text: `#F8FAFC`
- Accent: `#38BDF8`
- Secondary: `#1E3A5F`

Footer name: **Ali Elsayed Salem**. No fake logos. No "Repost ♻️" engagement
bait unless Ali explicitly asks for a repost line.

## Mode: html

Single self-contained HTML file, inline CSS, 1200×1400 CSS pixels.

- Dark background (`#0F172A` or Ali's colour), high-contrast text
- Sans (Inter / system-ui), 40px minimum padding
- Distil the post: headline (5–8 words) + visual blocks, not the full post
- Every block must be readable on a phone
- Footer: Ali Elsayed Salem

Save the file when Write is available. Tell Ali to open it in a browser and
screenshot.

## Mode: whiteboard / branded

1. Build a brief: title (≤6 words), 3–7 bullets (≤10 words each), structure
   (steps / comparison / stats / list), visual notes.
2. Show the brief. Wait for Ali to say generate (or equivalent). Do not
   output the Gemini prompt before approval.
3. Fill the matching template in [references/gemini-prompts.md](references/gemini-prompts.md).
4. Output one prompt in a fenced code block. Tell Ali: paste into a new
   Gemini chat, Create Image, 1080×1350.

Whiteboard: hand-drawn markers, imperfect lines, no digital fonts.
Branded: flat, no 3D, no stock photos, brand hexes, max ~40 words on the image.

## Mode: carousel

1. Brief, slide by slide (6 / 8 / 10 — ask if unspecified):
   - Slide 1: hook, large type
   - Body slides: one idea, headline ≤8 words, body ≤15 words
   - Last slide: takeaway. Soft CTA only if it is a real next step, not "thoughts?"
2. Show the brief. Wait for approval.
3. One Gemini prompt per slide, each in its own code block, using the
   carousel template. Same brand hexes on every slide.
4. Cover and CTA slides must look distinct from body slides.

1080×1350 (4:5) only.

## Mode: quote

Ali's brand forbids motivational fluff. This mode is an **insight line from
the post**, not growth-poster quotes.

1. Offer 6 options, each under 15 words, grouped:
   - Contrarian (2)
   - Specific result / mechanism (2)
   - Admission of a real trade-off (2)
2. Every option must be something Ali can back up. No "you don't find the
   time, you make it."
3. If the post has no defensible one-liner, say so and switch to `html` or
   `whiteboard` instead of forcing a quote.
4. After Ali picks (or pastes his own), output the quote-image template.
   Attribute nothing unless Ali asks to sign it.

## After any mode

Offer one next step only:

- Score / metrics later → `analytics-review` (after it is posted)
- Rewrite copy → `social-content-system`
- Another visual mode of the same post

## What this skill does not do

- Does not write LinkedIn/Instagram copy
- Does not generate YouTube thumbnails
- Does not use `about-me.md` / `voice.md` / Charlie Hills benchmarks
- Does not add meme pinned comments or engagement-bait recycle CTAs by default
- Does not mix with `ui-designer` (that is product UI, not feed graphics)
