#!/usr/bin/env bash
# Vendor external skill packages from packages/ into skills/ for install.sh.
# Re-run after updating packages/<name>/ (see docs/EXTERNAL_SKILLS.md).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGES="$REPO_ROOT/packages"
SKILLS="$REPO_ROOT/skills"

# Superpowers skills that duplicate our lifecycle stack are skipped.
SUPERPOWERS_ALLOWLIST=(using-git-worktrees)

copy_tree() {
  local src="$1"
  local dest="$2"
  rm -rf "$dest"
  mkdir -p "$(dirname "$dest")"
  cp -a "$src" "$dest"
}

allowed_superpower() {
  local name="$1"
  local item
  for item in "${SUPERPOWERS_ALLOWLIST[@]}"; do
    [[ "$name" == "$item" ]] && return 0
  done
  return 1
}

vendor_superpowers() {
  local pkg="$PACKAGES/superpowers/skills"
  local skill_dir name dest

  echo "==> superpowers (allowlist: ${SUPERPOWERS_ALLOWLIST[*]})"
  for skill_dir in "$pkg"/*/; do
    name="$(basename "$skill_dir")"
    if ! allowed_superpower "$name"; then
      echo "  skip $name (duplicate of existing lifecycle skill)"
      continue
    fi
    dest="$SKILLS/$name"
    echo "  -> $name"
    copy_tree "${skill_dir%/}" "$dest"
  done
}

vendor_delegate() {
  local pkg="$PACKAGES/delegate-skills/skills"
  local skill_dir name dest

  echo "==> delegate-skills"
  for skill_dir in "$pkg"/*/; do
    name="$(basename "$skill_dir")"
    dest="$SKILLS/$name"
    echo "  -> $name"
    copy_tree "${skill_dir%/}" "$dest"
  done
}

vendor_review() {
  local pkg="$PACKAGES/review-skills/skills"
  local skill_dir name dest

  echo "==> review-skills"
  for skill_dir in "$pkg"/*/; do
    name="$(basename "$skill_dir")"
    dest="$SKILLS/$name"
    echo "  -> $name"
    copy_tree "${skill_dir%/}" "$dest"
  done
}

main() {
  [[ -d "$PACKAGES/superpowers/skills" ]] || {
    echo "Missing $PACKAGES/superpowers/skills — clone upstream first." >&2
    exit 1
  }
  [[ -d "$PACKAGES/delegate-skills/skills" ]] || {
    echo "Missing $PACKAGES/delegate-skills/skills" >&2
    exit 1
  }
  [[ -d "$PACKAGES/review-skills/skills" ]] || {
    echo "Missing $PACKAGES/review-skills/skills" >&2
    exit 1
  }

  vendor_superpowers
  vendor_delegate
  vendor_review

  echo
  echo "Done. Run ./install.sh to symlink into Cursor, Claude, and OpenCode."
}

main "$@"
