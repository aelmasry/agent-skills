#!/usr/bin/env bash
# Add agent-skills personas (from agents/ directory) to the skills folder.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
AGENT_SKILLS_SRC="${AGENT_SKILLS_SRC:-/tmp/agent-skills-src}"
SKILLS_DIR="$REPO_ROOT/skills"

CONVERT="$SCRIPT_DIR/convert-agent-persona.sh"
chmod +x "$CONVERT"

PERSONAS=(
  "agents/web-performance-auditor.md"
  "agents/security-auditor.md"
  "agents/test-engineer.md"
)

echo "Converting ${#PERSONAS[@]} agent-skills personas..."
for persona in "${PERSONAS[@]}"; do
  src="$AGENT_SKILLS_SRC/$persona"
  if [[ ! -f "$src" ]]; then
    echo "  ! missing: $persona" >&2
    continue
  fi
  "$CONVERT" "$src" "$SKILLS_DIR"
done
echo "Done."
