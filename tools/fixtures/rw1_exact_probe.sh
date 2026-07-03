#!/usr/bin/env sh
# rw1_exact_probe.sh — does any weave blob return the exact prior-line bytes?
set -eu
for f in .mantra/blobs/*; do
  sed -n 2p "$f" | cut -f3
done | grep -Fx "let x = 1" >/dev/null && echo MATCH
