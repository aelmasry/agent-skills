#!/usr/bin/env bash
# Add curated agency-agents personas to the skills directory.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
AGENCY_SRC="${AGENCY_SRC:-/tmp/agency-agents-src}"
SKILLS_DIR="$REPO_ROOT/skills"

CONVERT="$SCRIPT_DIR/convert-agency-agent.sh"
chmod +x "$CONVERT"

AGENTS=(
  "engineering/engineering-data-engineer.md"
  "engineering/engineering-backend-architect.md"
  "engineering/engineering-ai-engineer.md"
  "engineering/engineering-code-reviewer.md"
  "engineering/engineering-api-platform-engineer.md"
  "engineering/engineering-minimal-change-engineer.md"
  "engineering/engineering-software-architect.md"
  "security/security-architect.md"
  "security/security-appsec-engineer.md"
  "security/security-cloud-security-architect.md"
  "security/security-penetration-tester.md"
  "security/security-incident-responder.md"
  "security/security-compliance-auditor.md"
  "security/security-senior-secops.md"
  "security/security-threat-detection-engineer.md"
  "testing/testing-reality-checker.md"
  "testing/testing-api-tester.md"
  "testing/testing-accessibility-auditor.md"
  "testing/testing-performance-benchmarker.md"
  "product/product-manager.md"
  "project-management/project-manager-senior.md"
  "marketing/marketing-content-creator.md"
  "marketing/marketing-linkedin-content-creator.md"
  "marketing/marketing-social-media-strategist.md"
  "design/design-brand-guardian.md"
  "design/design-ui-designer.md"
  "design/design-ux-researcher.md"
  "design/design-ux-architect.md"
  "design/design-persona-walkthrough.md"
  "specialized/agents-orchestrator.md"
  "specialized/specialized-mcp-builder.md"
  "specialized/recruitment-specialist.md"
  "specialized/personal-growth-mentor.md"
  "specialized/specialized-developer-advocate.md"
)

echo "Converting ${#AGENTS[@]} agency personas..."
for agent in "${AGENTS[@]}"; do
  src="$AGENCY_SRC/$agent"
  if [[ ! -f "$src" ]]; then
    echo "  ! missing: $agent" >&2
    continue
  fi
  "$CONVERT" "$src" "$SKILLS_DIR"
done
echo "Done."
