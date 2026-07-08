#!/usr/bin/env sh
# tools/fixtures/slcl3_lane_b_settle.sh — Monad testnet settlement seam (POSIX external interpreter).
#
# Selftest mode (default): pinned testnet-shaped response for witness bolt.
# Live mode: set SLCL3_LIVE=1 and configure EVM toolchain — not required for parity.
set -eu
digest="${1:?log digest hex required}"
amount="${2:?amount required}"
if [ "${SLCL3_LIVE:-}" = "1" ]; then
  echo "slcl3: live Monad lane not configured on this bench" >&2
  exit 2
fi
echo "chain monad-testnet"
echo "asset usdc"
echo "tx_id 0xMonadTESTNETpinnedDIGESTlaneB0002"
echo "amount ${amount}"
echo "log_digest ${digest}"
echo "peg_notes USDC issuer freeze surface named; peg history cited in horizon refresh 041000"
