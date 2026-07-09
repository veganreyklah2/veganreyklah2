#!/bin/sh
# wov_tb_ensure_binary.sh — copy or build the pinned TigerBeetle binary into tools/.build.
#
# Clean room: never links TB into Rye. Hosts the pin binary for seam-A REPL labs.
# Requires Zig 0.14.1 from gratitude/tigerbeetle/zig/ (run zig/download.sh once).
#
# Usage (from repo root):
#   sh tools/wov_tb_ensure_binary.sh

set -eu
root="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
pin="$root/gratitude/tigerbeetle"
out="$root/tools/.build/tigerbeetle"
mkdir -p "$out"

if [ -x "$pin/tigerbeetle" ]; then
  cp -f "$pin/tigerbeetle" "$out/tigerbeetle"
elif [ -x "$pin/zig-out/bin/tigerbeetle" ]; then
  cp -f "$pin/zig-out/bin/tigerbeetle" "$out/tigerbeetle"
else
  if [ ! -x "$pin/zig/zig" ]; then
    echo "wov-tb-ensure: missing $pin/zig/zig — run: (cd gratitude/tigerbeetle && sh zig/download.sh)" >&2
    exit 1
  fi
  (cd "$pin" && ./zig/zig build -Drelease)
  cp -f "$pin/tigerbeetle" "$out/tigerbeetle"
fi

test -x "$out/tigerbeetle"
"$out/tigerbeetle" version >/dev/null
echo "WOV-TB-BINARY-OK $out/tigerbeetle"
