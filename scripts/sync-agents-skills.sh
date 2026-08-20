#!/usr/bin/env bash
# Symlink every active repo skill into ~/.claude/skills and ~/.agents/skills.
# Skips destinations that already point at the matching repo directory.
# Does not delete real copies (those are a manual step).
# Does not touch ~/.cursor/skills-cursor, plugin caches, or skills/_archive.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_SKILLS="$REPO_ROOT/skills"
CLAUDE_SKILLS="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
AGENTS_SKILLS="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"

already_linked() {
  local dest="$1"
  local src="$2"
  [[ -L "$dest" ]] || return 1
  local current
  current="$(readlink "$dest")"
  [[ "$current" == "$src" ]] && return 0
  # Also accept equivalent resolved paths
  local resolved_dest resolved_src
  resolved_dest="$(python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$dest")"
  resolved_src="$(python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$src")"
  [[ "$resolved_dest" == "$resolved_src" ]]
}

link_one() {
  local src="$1"
  local dest="$2"
  local name
  name="$(basename "$src")"

  if already_linked "$dest" "$src"; then
    echo "  skip (already linked): $name"
    return 0
  fi

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "  WARN real copy left in place (not deleting): $dest" >&2
    return 0
  fi

  mkdir -p "$(dirname "$dest")"
  if [[ -L "$dest" ]]; then
    rm -f "$dest"
    echo "  relinked: $name"
  else
    echo "  linked: $name"
  fi
  ln -sfn "$src" "$dest"
}

install_into() {
  local target="$1"
  mkdir -p "$target"
  echo "Target: $target"
  local skill_dir name
  for skill_dir in "$REPO_SKILLS"/*/; do
    name="$(basename "$skill_dir")"
    if [[ "$name" == "_archive" ]]; then
      continue
    fi
    link_one "${skill_dir%/}" "$target/$name"
  done
  echo
}

echo "Syncing skills from: $REPO_SKILLS"
echo
install_into "$CLAUDE_SKILLS"
install_into "$AGENTS_SKILLS"
echo "Done. OpenCode reads ~/.claude/skills then ~/.agents/skills."
