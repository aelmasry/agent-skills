#!/usr/bin/env bash
# Convert an agency-agents .md file to a Cursor skill directory.
set -euo pipefail

SRC="${1:?Usage: convert-agency-agent.sh <agent.md> <output-skills-dir>}"
OUT_DIR="${2:?Usage: convert-agency-agent.sh <agent.md> <output-skills-dir>}"

get_field() {
  awk -v f="$1" '
    /^---$/ { fm++; next }
    fm == 1 && $0 ~ "^" f ": " { sub("^" f ": ", ""); print; exit }
  ' "$SRC"
}

get_body() {
  awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$SRC"
}

slugify() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]' \
    | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//'
}

name="$(get_field name "$SRC")"
description="$(get_field description "$SRC")"
slug="$(slugify "$name")"

# Fallback slug from filename if name is empty
if [[ -z "$slug" ]]; then
  base="$(basename "$SRC" .md)"
  slug="$(echo "$base" | sed 's/^[a-z]*-//')"
fi

# Append trigger hint for discovery
description="${description} Use when the user needs a ${name} specialist or mentions ${slug}."

skill_dir="$OUT_DIR/$slug"
mkdir -p "$skill_dir"

cat > "$skill_dir/SKILL.md" <<EOF
---
name: ${slug}
description: >-
  ${description}
---

$(get_body "$SRC")
EOF

echo "  + ${slug}"
