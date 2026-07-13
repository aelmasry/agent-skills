#!/usr/bin/env bash
# Bootstrap Cursor on Mac, Linux, or Windows (Git Bash) from this repo.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SECRETS_FILE="${CURSOR_SECRETS_FILE:-$HOME/.cursor-secrets.env}"

# shellcheck source=platform.sh
source "$(dirname "${BASH_SOURCE[0]}")/platform.sh"
detect_cursor_paths

backup_if_exists() {
  local file="$1"
  if [[ -f "$file" ]]; then
    cp "$file" "${file}.bak.$(date +%Y%m%d%H%M%S)"
  fi
}

link_dir() {
  local source="$1"
  local dest="$2"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    rm -rf "$dest"
  fi
  ln -sfn "$source" "$dest"
}

echo "Bootstrapping Cursor from: $REPO_ROOT"
echo "OS: $PLATFORM"
echo

# 1) Skills (existing installer)
bash "$REPO_ROOT/install.sh"

# 2) Slash commands
mkdir -p "$CURSOR_DIR"
if [[ -d "$REPO_ROOT/commands" ]]; then
  link_dir "$REPO_ROOT/commands" "$CURSOR_DIR/commands"
  echo "Linked commands -> $CURSOR_DIR/commands"
fi

# 3) Prompts library
if [[ -d "$REPO_ROOT/prompts" ]]; then
  link_dir "$REPO_ROOT/prompts" "$CURSOR_DIR/prompts"
  echo "Linked prompts -> $CURSOR_DIR/prompts"
fi

# 4) Settings + keybindings
mkdir -p "$CURSOR_USER_DIR"
if [[ -f "$REPO_ROOT/config/settings.json" ]]; then
  backup_if_exists "$CURSOR_USER_DIR/settings.json"
  cp "$REPO_ROOT/config/settings.json" "$CURSOR_USER_DIR/settings.json"
  echo "Installed settings.json"
fi

if [[ -f "$REPO_ROOT/config/$KEYBINDINGS_FILE" ]]; then
  backup_if_exists "$CURSOR_USER_DIR/keybindings.json"
  cp "$REPO_ROOT/config/$KEYBINDINGS_FILE" "$CURSOR_USER_DIR/keybindings.json"
  echo "Installed keybindings from $KEYBINDINGS_FILE"
fi

# 5) MCP from template + secrets
if [[ -f "$REPO_ROOT/config/mcp.json.example" ]]; then
  if [[ -f "$SECRETS_FILE" ]]; then
    # shellcheck disable=SC1090
    set -a && source "$SECRETS_FILE" && set +a
    python3 - "$REPO_ROOT/config/mcp.json.example" "$CURSOR_DIR/mcp.json" <<'PY'
import os, sys
from pathlib import Path

template = Path(sys.argv[1]).read_text()
for key, value in os.environ.items():
    template = template.replace(f"${{{key}}}", value)
Path(sys.argv[2]).write_text(template)
PY
    echo "Rendered MCP config -> $CURSOR_DIR/mcp.json"
  else
    echo "Skip MCP: create $SECRETS_FILE from secrets.env.example"
  fi
fi

# 6) Extensions
if [[ -f "$REPO_ROOT/config/extensions.txt" ]]; then
  CLI=""
  if command -v cursor >/dev/null 2>&1; then
    CLI="cursor"
  elif command -v code >/dev/null 2>&1; then
    CLI="code"
  fi

  if [[ -n "$CLI" ]]; then
    echo "Installing extensions via $CLI (this may take a while)..."
    while IFS= read -r ext || [[ -n "$ext" ]]; do
      [[ -z "$ext" || "$ext" =~ ^# ]] && continue
      $CLI --install-extension "$ext" --force 2>/dev/null || echo "  failed: $ext"
    done < "$REPO_ROOT/config/extensions.txt"
    echo "Extensions install pass complete"
  else
    echo "Skip extensions: cursor/code CLI not found"
  fi
fi

echo
echo "Bootstrap complete."
echo "Plugin MCP servers (Notion, Figma, etc.) may need one-time OAuth on this machine."
echo "Verify: ls ~/.cursor/skills && ls ~/.cursor/commands"
