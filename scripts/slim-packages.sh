#!/usr/bin/env bash
# Keep only re-vendor essentials in packages/ (skills + license + version pin).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGES="$REPO_ROOT/packages"

slim_one() {
  local dir="$1"
  [[ -d "$dir" ]] || return 0
  local keep=(skills LICENSE LICENSE.md VENDOR_VERSION README.md)
  local entry
  for entry in "$dir"/*; do
    [[ -e "$entry" ]] || continue
    local base
    base="$(basename "$entry")"
    local ok=0
    for k in "${keep[@]}"; do
      [[ "$base" == "$k" ]] && ok=1 && break
    done
    [[ "$ok" == 1 ]] && continue
    rm -rf "$entry"
    echo "  removed packages/$(basename "$dir")/$base"
  done
}

echo "Slimming packages/ to skills + LICENSE + VENDOR_VERSION + README..."
for pkg in superpowers delegate-skills review-skills; do
  echo "==> $pkg"
  slim_one "$PACKAGES/$pkg"
done
echo "Done."
