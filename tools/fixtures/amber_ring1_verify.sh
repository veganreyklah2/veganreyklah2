#!/usr/bin/env sh
# amber_ring1_verify.sh — verify stones match manifest; optional golden manifest digest
set -eu
OUT=${1:?usage: amber_ring1_verify.sh outdir [golden_manifest_digest]}
GOLDEN=${2:-}
MANIFEST="$OUT/manifest.bron"

test -f "$MANIFEST" || { echo "FAIL missing manifest"; exit 1; }

while read -r line; do
  case "$line" in
    entry\ *)
      relpath=$(printf '%s\n' "$line" | awk '{print $2}')
      expect=$(printf '%s\n' "$line" | awk '{print $3}')
      stone="$OUT/stones/$expect"
      test -f "$stone" || { echo "FAIL missing stone $expect for $relpath"; exit 1; }
      got=$(openssl dgst -sha3-256 -r "$stone" | awk '{print $1}')
      test "$got" = "$expect" || { echo "FAIL digest mismatch $relpath"; exit 1; }
      ;;
  esac
done < "$MANIFEST"

digest=$(openssl dgst -sha3-256 -r "$MANIFEST" | awk '{print $1}')
echo "MANIFEST_DIGEST $digest"

if [ -n "$GOLDEN" ]; then
  test "$digest" = "$GOLDEN" || { echo "FAIL golden mismatch want=$GOLDEN got=$digest"; exit 1; }
  echo "GOLDEN ok"
fi

echo "VERIFY ok"
