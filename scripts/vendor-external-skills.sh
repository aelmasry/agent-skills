#!/usr/bin/env bash
# Vendor external skill packages from packages/ into skills/ for install.sh.
# Re-run after updating packages/<name>/ (see docs/EXTERNAL_SKILLS.md).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGES="$REPO_ROOT/packages"
SKILLS="$REPO_ROOT/skills"

copy_tree() {
  local src="$1"
  local dest="$2"
  rm -rf "$dest"
  mkdir -p "$(dirname "$dest")"
  cp -a "$src" "$dest"
}

vendor_superpowers() {
  local pkg="$PACKAGES/superpowers/skills"
  local skill_dir name dest

  echo "==> superpowers"
  for skill_dir in "$pkg"/*/; do
    name="$(basename "$skill_dir")"
    if [[ "$name" == "test-driven-development" ]]; then
      dest="$SKILLS/superpowers-test-driven-development"
      echo "  -> superpowers-test-driven-development (avoids collision with test-driven-development)"
      copy_tree "${skill_dir%/}" "$dest"
      # Rename skill identifier so agents can distinguish strict Superpowers TDD.
      if [[ -f "$dest/SKILL.md" ]]; then
        sed -i '' \
          's/^name: test-driven-development$/name: superpowers-test-driven-development/' \
          "$dest/SKILL.md" 2>/dev/null || \
        sed -i \
          's/^name: test-driven-development$/name: superpowers-test-driven-development/' \
          "$dest/SKILL.md"
      fi
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

patch_using_superpowers_tdd_ref() {
  local f="$SKILLS/using-superpowers/SKILL.md"
  [[ -f "$f" ]] || return 0
  if grep -q 'superpowers-test-driven-development' "$f" && \
     ! grep -q 'during implementation; → superpowers:systematic-debugging' "$f"; then
    return 0
  fi
  # Fix broken patch from older script versions, then ensure TDD note exists.
  sed -i '' \
    's/- "Fix this bug" → superpowers-test-driven-development during implementation; → superpowers:systematic-debugging first, then domain skills./- "Fix this bug" → systematic-debugging first, then domain skills./' \
    "$f" 2>/dev/null || \
  sed -i \
    's/- "Fix this bug" → superpowers-test-driven-development during implementation; → superpowers:systematic-debugging first, then domain skills./- "Fix this bug" → systematic-debugging first, then domain skills./' \
    "$f"
  if ! grep -q 'superpowers-test-driven-development' "$f"; then
    sed -i '' \
      '/- "Fix this bug" → systematic-debugging first, then domain skills./a\
- During implementation → superpowers-test-driven-development (strict red-green-refactor; repo also has `test-driven-development` for general TDD).
' \
      "$f" 2>/dev/null || \
    sed -i \
      '/- "Fix this bug" → systematic-debugging first, then domain skills./a\
- During implementation → superpowers-test-driven-development (strict red-green-refactor; repo also has `test-driven-development` for general TDD).
' \
      "$f"
  fi
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
  patch_using_superpowers_tdd_ref

  echo
  echo "Done. Run ./install.sh to symlink into Cursor, Claude, and OpenCode."
}

main "$@"
