#!/usr/bin/env sh
# tools/fixtures/slcl3_lane_a_settle.sh — Sui testnet settlement seam (POSIX external interpreter).
#
# Selftest mode (default): pinned testnet-shaped response for witness bolt.
# Live mode: set SLCL3_LIVE=1 and configure Sui CLI — not required for parity.
set -eu
digest="${1:?log digest hex required}"
amount="${2:?amount required}"
if [ "${SLCL3_LIVE:-}" = "1" ]; then
  echo "slcl3: live Sui lane not configured on this bench" >&2
  exit 2
fi
echo "chain sui-testnet"
echo "asset usdsui"
echo "tx_id 7xK9suiTESTNETpinnedDIGESTlaneA0001"
echo "amount ${amount}"
echo "log_digest ${digest}"
echo "peg_notes USDsui Circle attestations named; freeze surface documented; May 2026 stress cited"
