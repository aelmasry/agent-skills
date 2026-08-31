---
name: social-content-system
description: Produces LinkedIn posts, Instagram carousels/Reel scripts, and cross-posted derivatives from a single source idea, following Ali's personal-brand voice. Use when the user asks to write a post, turn an idea/article/experience into content, or repurpose one piece of content across platforms. For a month of headlines use content-matrix first. For graphics after a draft use social-visuals. Always load personal-brand skill first if not already active in context.
---

# Social Content Production System

Requires `personal-brand` context (voice, positioning, audience, pillars).
If that skill hasn't been applied yet in this conversation, apply it first.

Need 32 headlines / a month of angles first? Use `content-matrix`, then come
back here with one cell. Need a graphic after the draft? Use `social-visuals`.

## Workflow: one idea → multi-platform output

### Step 1 — Capture the source idea
Ask Ali for the raw material if not given: a technical insight, a bug fixed,
an architecture decision, a tool built, an observation. Real and specific,
not abstract.

### Step 2 — Check against brand fit
Before writing anything, verify:
- Does this match one of the 4 content pillars?
- Is every claim in it something Ali can actually back up?
- Does it avoid confidential client/employer specifics?
If any check fails, say so and ask how to adjust before drafting.

### Step 3 — Draft platform-native versions (not one post copy-pasted)

**LinkedIn** (primary platform for this audience):
- First-person, insight-led, one clear point per post
- Hook in first 1-2 lines (curiosity or contrarian angle, never clickbait)
- 150-300 words, short paragraphs, no hashtag spam (3-5 max, relevant only)
- End with a genuine question or a stated trade-off, not "thoughts?" filler

**Instagram** (secondary, visual-first):
- Carousel: 5-8 slides, one idea per slide, slide 1 = hook, last slide =
  takeaway or soft CTA. Write slide-by-slide copy, not paragraphs.
- Reel script: hook (0-3s) → problem → build/reveal → payoff, written for
  15-30s delivery, spoken language not written language
- Caption: short, supports the visual, doesn't repeat it word-for-word

**Derivative (optional, only if asked):** 2-3 shorter variants for repost/
Threads/X — same core insight, different framing, not the same sentence
truncated.

### Step 4 — Score before presenting
For each draft, self-check:
- Would this post make sense from a random anonymous account, or does it
  clearly sound like Ali specifically? (If the former, rewrite — too generic.)
- Is the hook earning attention honestly or through exaggeration?
- Is there a single unnecessary sentence? Cut it.

### Step 5 — Present with the gap flagged
Always show drafts with any open question flagged inline, e.g.
"[confirm this number before posting]" — never invent stats/data to
fill gaps.

### Step 6 — Optional visual
If Ali wants a graphic, carousel images, or a quote card, hand off to
`social-visuals` with this draft. Do not invent image prompts here.

## What this skill does NOT do
- Does not publish anything — output is draft text/scripts only
- Does not fabricate engagement hooks based on fake urgency or false claims
- Does not repost the same sentence structure across platforms — every
  platform gets native-feeling content
- Does not generate a 32-cell idea grid (`content-matrix`) or Gemini/HTML
  graphics (`social-visuals`)
- Does not optimize the LinkedIn profile (`linkedin-optimizer`)
