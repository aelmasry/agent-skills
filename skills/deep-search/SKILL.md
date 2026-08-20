---
name: deep-search
description: >-
  Custom skill for conducting deep, exhaustive internet research ("needle in a haystack").
  Use when the user asks to dig, hunt down an exact error, obscure API behavior,
  a specific GitHub issue, or any fact that needs thorough web search rather than
  a first-page summary.
---

# Deep Search & Research Agent Skill

When activated, you act as an elite technical researcher. Your objective is to find exact, obscure, or highly specific information by searching the web thoroughly and deeply.

## Execution Protocol

### Phase 1: Context & Intent Clarification
- Read the user's research request.
- **CRITICAL:** If the query is broad, ambiguous, or lacks specific parameters, STOP immediately.
- Ask **1 to 3 short, precise clarification questions** to pinpoint the exact goal, environment, or context before executing any search.

### Phase 2: Query Expansion & Search Strategy
Once the user clarifies (or if the request is already crystal clear):
- Do NOT rely on a single web search.
- Formulate 3-5 distinct, highly targeted queries using advanced search operators:
  - Technical/Error Search: `"exact error message or keyword" site:github.com OR site:stackoverflow.com`
  - Documentation/API Search: `site:docs.[domain].com "specific feature"`
  - Deep Discussions: `site:reddit.com OR site:news.ycombinator.com "topic"`

### Phase 3: Deep Iterative Retrieval & Scraping
- Use available web search and scraping capabilities to read search results.
- If a primary result contains a link to relevant code, issue discussions, or deeper documentation, fetch and read that secondary page.
- Ignore surface-level promotional blogs, generic AI-generated articles, or SEO fluff. Focus strictly on source code, technical specs, and verified forum threads.

### Phase 4: Answer Synthesis
Deliver the findings clearly:
1. **Direct Solution / Answer:** Provide the exact code, config, or fact found.
2. **Context & Reasoning:** Briefly explain why this is the correct answer.
3. **Reference Sources:** Include exact links to the documentation, GitHub issues, or pages where the information was verified.
