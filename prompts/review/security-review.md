# Security review (diff scope)

Use skills: `security-and-hardening`, `security-auditor`.

Focus on the **changed code** and its trust boundaries. For a full-repo audit with two-pass fix workflow, use `prompts/review/codebase-audit.md` or `/audit`.

## Checklist
- [ ] Input validation and output encoding
- [ ] Authentication and authorization on every sensitive path
- [ ] Secrets not logged, committed, or returned in errors
- [ ] Dependency versions — known CVEs?
- [ ] OWASP top risks relevant to this stack

## Output
- Threat model (1–2 sentences: assets, actors, entry points)
- Findings by severity with file:line and remediation
- Residual risk if anything is accepted as-is
