#!/usr/bin/env sh
# pond_build_drawn_terminal.sh — build with staged progress (silent Zig compile).
# Run from repo root; also invoked from pond_build_drawn_terminal.rish.
set -eu

ZIG="${RYE_ZIG:-vendor/zig-toolchain/zig}"
BIN="pond/bin/drawn-terminal"

echo "build: Language EN — drawn-terminal compile witness."
echo "build: Style Radiant — witness-first; staged lines carry progress."
echo "build: Lens TAME — Zig may run silent until link finishes; that is normal."

echo "build: ensuring pond/bin..."
mkdir -p pond/bin

echo "build: invoking rye → ${BIN}"
echo "build:     (first compile often 1–3 min; ai-jail may be slower — heartbeat every 15s)"

(
  env RYE_ZIG="${ZIG}" rye/bin/rye build pond/apps/drawn_terminal.rye brushstroke/xdg-shell-protocol.c \
    -Ibrushstroke -lc -lwayland-client -lrt -femit-bin="${BIN}"
) &
BPID=$!
SECS=0
while kill -0 "${BPID}" 2>/dev/null; do
  sleep 15
  SECS=$((SECS + 15))
  echo "build: still compiling… ${SECS}s elapsed"
done
wait "${BPID}"
RC=$?

if [ "${RC}" -ne 0 ]; then
  echo "build: RED — rye compile failed (exit ${RC})"
  exit "${RC}"
fi

if ! test -x "${BIN}"; then
  echo "build: RED — ${BIN} missing after compile"
  exit 1
fi

echo "GREEN: ${BIN} built."
