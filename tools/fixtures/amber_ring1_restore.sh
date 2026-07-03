#!/usr/bin/env sh
# amber_ring1_restore.sh — restore manifest + stones into a target directory tree
set -eu
OUT=${1:?usage: amber_ring1_restore.sh outdir targetdir}
TARGET=${2:?usage: amber_ring1_restore.sh outdir targetdir}
MANIFEST="$OUT/manifest.bron"

test -f "$MANIFEST" || { echo "FAIL missing manifest"; exit 1; }
rm -rf "$TARGET"
mkdir -p "$TARGET"

while read -r line; do
  case "$line" in
    entry\ *)
      relpath=$(printf '%s\n' "$line" | awk '{print $2}')
      digest=$(printf '%s\n' "$line" | awk '{print $3}')
      stone="$OUT/stones/$digest"
      dest="$TARGET/$relpath"
      mkdir -p "$(dirname "$dest")"
      cp "$stone" "$dest"
      ;;
  esac
done < "$MANIFEST"

echo "RESTORE ok target=$TARGET"
