#!/usr/bin/env bash
# Export portable Cursor config from this machine into the repo.
# Run from repo root after making local changes you want to keep.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# shellcheck source=platform.sh
source "$(dirname "${BASH_SOURCE[0]}")/platform.sh"
detect_cursor_paths

echo "Exporting Cursor config from: $PLATFORM"
echo "Repo: $REPO_ROOT"
echo

mkdir -p "$REPO_ROOT/config" "$REPO_ROOT/commands" "$REPO_ROOT/prompts"

# Extensions manifest
if command -v cursor >/dev/null 2>&1; then
  cursor --list-extensions > "$REPO_ROOT/config/extensions.txt"
elif command -v code >/dev/null 2>&1; then
  code --list-extensions > "$REPO_ROOT/config/extensions.txt"
else
  echo "Warning: neither cursor nor code CLI found; skipping extensions export" >&2
fi
echo "  -> config/extensions.txt ($(wc -l < "$REPO_ROOT/config/extensions.txt" | tr -d ' ') extensions)"

# Slash commands
if [[ -d "$CURSOR_DIR/commands" ]]; then
  rsync -a --delete "$CURSOR_DIR/commands/" "$REPO_ROOT/commands/"
  echo "  -> commands/"
fi

# Prompts library (if you symlink or store under ~/.cursor/prompts)
if [[ -d "$CURSOR_DIR/prompts" ]]; then
  rsync -a --delete "$CURSOR_DIR/prompts/" "$REPO_ROOT/prompts/"
  echo "  -> prompts/"
fi

# Keybindings (platform-specific)
if [[ -f "$CURSOR_USER_DIR/keybindings.json" ]]; then
  cp "$CURSOR_USER_DIR/keybindings.json" "$REPO_ROOT/config/$KEYBINDINGS_FILE"
  echo "  -> config/$KEYBINDINGS_FILE"
fi

# Settings: manual merge recommended — this copies current file for review
if [[ -f "$CURSOR_USER_DIR/settings.json" ]]; then
  cp "$CURSOR_USER_DIR/settings.json" "$REPO_ROOT/config/settings.exported.json"
  echo "  -> config/settings.exported.json (review before replacing settings.json)"
fi

# MCP template reminder
if [[ -f "$CURSOR_DIR/mcp.json" ]]; then
  echo
  echo "MCP: update config/mcp.json.example manually if servers changed."
  echo "Never commit ~/.cursor/mcp.json with real tokens."
fi

echo
echo "Done. Review changes, then:"
echo "  git diff"
echo "  git add -A && git commit -m 'sync cursor config from $(hostname)'"
