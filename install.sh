#!/usr/bin/env bash
# Install agent-skills globally via symlinks into Cursor, Claude Code,
# and OpenCode-compatible dirs (~/.agents/skills).
# OpenCode has no skills dir of its own; it loads ~/.claude/skills then ~/.agents/skills.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_SKILLS="$REPO_ROOT/skills"

CURSOR_SKILLS="${CURSOR_SKILLS_DIR:-$HOME/.cursor/skills}"
CLAUDE_SKILLS="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
AGENTS_SKILLS="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"
CODEGPT_SKILLS="${CODEGPT_SKILLS_DIR:-$HOME/.codegpt/skills}"

link_path() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -L "$dest" ]]; then
    rm -f "$dest"
  elif [[ -e "$dest" ]]; then
    rm -rf "$dest"
  fi
  ln -sfn "$src" "$dest"
}

install_into() {
  local target="$1"
  local with_references="${2:-0}"
  mkdir -p "$target"
  local count=0
  local skill_dir name dest

  echo "Target: $target"
  for skill_dir in "$REPO_SKILLS"/*/; do
    name="$(basename "$skill_dir")"
    if [[ "$name" == "_archive" ]]; then
      continue
    fi
    dest="$target/$name"
    link_path "${skill_dir%/}" "$dest"
    echo "  -> $name"
    ((count++)) || true
  done

  if [[ -d "$target" ]]; then
    for entry in "$target"/*; do
      [[ -e "$entry" || -L "$entry" ]] || continue
      name="$(basename "$entry")"
      if [[ "$name" == "references" ]]; then
        continue
      fi
      if [[ ! -e "$REPO_SKILLS/$name" ]]; then
        rm -rf "$entry"
        echo "  removed stale: $name"
      fi
    done
  fi

  if [[ "$with_references" == "1" ]]; then
    link_path "$REPO_ROOT/references" "$target/references"
    echo "  -> references (shared checklists)"
  fi

  echo "Installed $count skills into $target"
  echo
}

install_codegpt() {
  mkdir -p "$CODEGPT_SKILLS"
  echo "Target: $CODEGPT_SKILLS (browser-automation, game-development only)"
  local name
  for name in browser-automation game-development; do
    if [[ -d "$REPO_SKILLS/$name" ]]; then
      link_path "$REPO_SKILLS/$name" "$CODEGPT_SKILLS/$name"
      echo "  -> $name"
    fi
  done
  echo
}

echo "Installing agent-skills from: $REPO_ROOT"
echo

install_into "$CURSOR_SKILLS" 1
install_into "$CLAUDE_SKILLS" 0
install_into "$AGENTS_SKILLS" 0
install_codegpt

# Discussion-mode instructions (Claude + OpenCode)
mkdir -p "$HOME/.agents"
link_path "$REPO_ROOT/DISCUSSION-MODE.md" "$HOME/.agents/DISCUSSION-MODE.md"
echo "Linked DISCUSSION-MODE.md -> $HOME/.agents/DISCUSSION-MODE.md"
if [[ ! -e "$HOME/.claude/CLAUDE.md" ]]; then
  mkdir -p "$HOME/.claude"
  printf '%s\n' '@~/.agents/DISCUSSION-MODE.md' > "$HOME/.claude/CLAUDE.md"
  echo "Wrote $HOME/.claude/CLAUDE.md pointer"
fi

echo "Verify:"
echo "  ls -la $CURSOR_SKILLS | head"
echo "  ls -la $CLAUDE_SKILLS | head"
echo "  ls -la $AGENTS_SKILLS | head"
