#!/usr/bin/env sh
# comlink/chain_read_monad.sh — POSIX seam for reading a Monad testnet transaction.
#
# Hosted by a future tools/chain_read_monad.rish. Read-only, wallet-free: this
# asks Monad's own public ledger what it recorded, the way anyone is entitled
# to ask, and prints the answer as JSON for a caller to parse.
#
# Monad is fully EVM-compatible; eth_getTransactionByHash is the same call the
# entire Ethereum tooling ecosystem depends on staying stable, confirmed
# current as of this writing with no deprecation in sight — unlike Sui's own
# lane, which needed a different tool for exactly that reason.
#
# Usage: comlink/chain_read_monad.sh <tx_hash> [rpc_url]
#   tx_hash   0x-prefixed transaction hash to look up
#   rpc_url   defaults to Monad's public testnet RPC; override for a paid
#             endpoint if the public one rate-limits during real use
#
# Canonical entry, once wired: rishi/bin/rishi run tools/chain_read_monad.rish

set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
cd "${ROOT}"

TX_HASH="${1:-}"
RPC_URL="${2:-https://testnet-rpc.monad.xyz}"

if [ -z "${TX_HASH}" ]; then
  echo "chain_read_monad: RED — no tx_hash given"
  echo "usage: comlink/chain_read_monad.sh <tx_hash> [rpc_url]"
  exit 2
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "chain_read_monad: RED — curl missing on PATH"
  exit 1
fi

echo "chain_read_monad: prepare — eth_getTransactionByHash against ${RPC_URL}"

BODY=$(printf '{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params":["%s"],"id":1}' "${TX_HASH}")

RESPONSE=$(curl -sS -X POST "${RPC_URL}" \
  -H "Content-Type: application/json" \
  --data "${BODY}") || {
  echo "chain_read_monad: RED — request failed"
  exit 1
}

echo "chain_read_monad: response received"
echo "${RESPONSE}"

if ! command -v python3 >/dev/null 2>&1; then
  echo "chain_read_monad: response printed above; python3 missing, skipping field check"
  exit 0
fi

python3 -c '
import json, sys
try:
    payload = json.loads(sys.argv[1])
except json.JSONDecodeError:
    print("chain_read_monad: RED — response was not valid JSON")
    sys.exit(1)
if "error" in payload:
    print("chain_read_monad: RED — node returned an error: " + str(payload["error"]))
    sys.exit(1)
result = payload.get("result")
if result is None:
    print("chain_read_monad: no transaction found for that hash (null result)")
    sys.exit(0)
print("chain_read_monad: GREEN — hash " + result.get("hash", "?") + " blockNumber " + str(result.get("blockNumber", "?")))
' "${RESPONSE}"
