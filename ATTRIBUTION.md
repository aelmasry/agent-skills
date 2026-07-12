# Attribution

This repository combines skills from multiple open-source projects with custom additions.

## Upstream Sources

### agent-skills (Engineering Workflows)

- **Source:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)
- **License:** MIT
- **Contents:** 24 engineering lifecycle skills + 7 reference checklists
- **Location in this repo:** `skills/` (workflow skills) and `references/`

### agency-agents (Specialist Personas)

- **Source:** [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)
- **License:** MIT
- **Contents:** 28 curated specialist personas (converted to Cursor skill format)
- **Location in this repo:** `skills/` (persona skills)
- **Conversion:** `scripts/convert-agency-agent.sh`

### agent-skills (Review Personas)

- **Source:** [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — `agents/` directory
- **License:** MIT
- **Contents:** 3 audit personas (`web-performance-auditor`, `security-auditor`, `test-engineer`)
- **Location in this repo:** `skills/`
- **Conversion:** `scripts/convert-agent-persona.sh`

### career-branding (Custom)

- **Author:** Ali
- **Source workspace:** [aelmasry/career-branding](https://github.com/aelmasry/career-branding)
- **Contents:**
  - `career-assistant` — lightweight standalone career skill
  - `career-branding` — full branding workflow with bundled `standards/` from project rules
- **Location in this repo:** `skills/career-assistant/`, `skills/career-branding/`

## License

This repository is licensed under MIT. See [LICENSE](LICENSE).

Upstream components retain their original MIT licenses from their respective repositories.
