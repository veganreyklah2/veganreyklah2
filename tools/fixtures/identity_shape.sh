#!/usr/bin/env sh
# identity_shape.sh — one verdict for the identity witness, both worlds handled.
set -eu
[ -f PUBKEYS.template.md ] || { echo "template missing"; exit 1; }
if [ ! -f PUBKEYS.md ]; then
  echo "PUBKEYS.md not in this checkout — forks begin from PUBKEYS.template.md."
  echo "IDENTITY-GREEN (template-only)"
  exit 0
fi
ssh_n=$(grep -c '^SHA256:' PUBKEYS.md || true)
pgp_n=$(grep -cE '^[0-9A-F]{4}( [0-9A-F]{4}){9}$' PUBKEYS.md || true)
grep -E '^SHA256:|^[0-9A-F]{4}( [0-9A-F]{4}){9}$' PUBKEYS.md
if [ "$ssh_n" = "2" ] && [ "$pgp_n" = "2" ]; then
  echo "IDENTITY-GREEN ssh=$ssh_n pgp=$pgp_n"
else
  echo "IDENTITY-RED ssh=$ssh_n pgp=$pgp_n"; exit 1
fi
