# Match Scoring Method

Honest scoring. Never inflate to hit 90%.

## Weights

| Bucket | Weight | What counts |
|--------|--------|-------------|
| Required skills / must-haves | 70% | Explicit "required", "must have", "minimum" |
| Preferred / nice-to-have | 20% | Preferred, plus, bonus |
| Role / domain keywords | 10% | Title phrases, domain (e.g. healthcare, fintech), seniority signals |

## Per-item credit

| Status | Credit | When |
|--------|--------|------|
| **Present** | 1.0 | Exact or clear synonym on resume + user can defend it |
| **Partial** | 0.5 | Related skill (e.g. "Azure OpenAI" vs "Amazon Bedrock") with transferable depth |
| **Missing** | 0.0 | Not on resume / cannot claim truthfully |

## Formula

```
required_score   = sum(credits) / count(required_items)
preferred_score  = sum(credits) / count(preferred_items)   # if none, use 1.0
role_score       = sum(credits) / count(role_keywords)

match% = 100 * (0.70 * required_score + 0.20 * preferred_score + 0.10 * role_score)
```

Round to nearest integer.

## Two numbers to report

1. **Current match** — before tailoring (as-written resume vs JD).
2. **After tailor (truthful)** — after reordering / reframing only. Cannot add skills.

Also report **max achievable** = after-tailor score. If max < 90%, list blockers:

```
Blockers to 90%:
- Missing: Kubernetes production ownership
- Missing: Spark at scale
```

## Tailoring that may raise the score

Allowed:

- Add JD keywords already true but worded differently
- Surface buried skills into Skills / Summary
- Lead with matching bullets

Not allowed:

- Adding tools never used
- Inflating titles or years
- Fake metrics

## Example (short)

Required: 8 items → 6 present, 1 partial, 1 missing → (6+0.5)/8 = 0.8125  
Preferred: 4 items → 2 present, 2 missing → 2/4 = 0.5  
Role: 2/2 = 1.0  

match% = 100 * (0.70*0.8125 + 0.20*0.5 + 0.10*1.0) ≈ **74%**
