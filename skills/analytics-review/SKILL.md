---
name: analytics-review
description: Reviews posted content performance data (LinkedIn/Instagram metrics pasted or exported by the user) and updates a running best-performers log to inform future content decisions. Use when Ali shares post metrics, asks "what's working," or asks for a weekly/monthly content review.
---

# Analytics Feedback Loop

This skill closes the loop between `social-content-system` output and real
results. It does not connect to any API on its own — Ali pastes metrics
(from LinkedIn analytics, Instagram Insights, or an MCP tool output if
connected) and this skill interprets them.

## What to track per post
- Platform, date, pillar (from personal-brand's 4 pillars), format
  (text/carousel/reel)
- Hook style used (question / contrarian / data-point / story-open)
- Reach, engagement rate, saves (Instagram), comments, profile visits /
  inbound messages (the real signal for a solo professional brand —
  not vanity likes)

## Analysis rules
- Never declare a pattern from 1-2 data points. Need at least 4-5 posts
  before suggesting "this format works better"
- Separate correlation from cause — flag when a spike might be topic-driven
  vs external (e.g. algorithm change, trending news)
- Compare against Ali's own history, not industry benchmarks — the goal is
  Ali's trend line improving, not beating a generic average

## Output format
Maintain a running log (ask Ali where to store it — markdown file in his
`~/.agents/` or project folder) with columns:
`date | platform | pillar | format | hook_type | reach | engagement_rate | saves_or_comments | profile_visits | notes`

After every review, give:
1. What's trending up/down (only if enough data points)
2. ONE specific variable to test next (hook, format, or topic — never
   suggest changing everything at once)
3. Flag anything that underperformed AND felt generic (cross-check against
   personal-brand voice rules — likely cause of underperformance)

## Hard constraint
Never recommend engagement tactics that trade authenticity for reach
(engagement bait, fake urgency, follow-unfollow, purchased engagement).
