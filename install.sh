#!/usr/bin/env bash
# Install cursor-skills globally via symlinks to ~/.cursor/skills/
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${CURSOR_SKILLS_DIR:-$HOME/.cursor/skills}"

mkdir -p "$TARGET"

echo "Installing cursor-skills from: $REPO_ROOT"
echo "Target: $TARGET"
echo

count=0
for skill_dir in "$REPO_ROOT"/skills/*/; do
  name="$(basename "$skill_dir")"
  dest="$TARGET/$name"
  # Replace real directories left from a previous non-symlink install
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    rm -rf "$dest"
  fi
  ln -sfn "$skill_dir" "$dest"
  echo "  -> $name"
  ((count++)) || true
done

# Shared references for engineering workflows
ln -sfn "$REPO_ROOT/references" "$TARGET/references"
echo "  -> references (shared checklists)"

echo
echo "Installed $count skills + references to $TARGET"
echo
echo "Verify: ls $TARGET"
