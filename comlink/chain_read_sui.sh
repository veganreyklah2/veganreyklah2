#!/usr/bin/env sh
# comlink/chain_read_sui.sh — POSIX seam for reading a Sui testnet transaction.
#
# Hosted by a future tools/chain_read_sui.rish. Read-only, wallet-free: this
# asks Sui's own public ledger what it recorded, the way anyone is entitled
# to ask, and prints the answer as JSON for a caller to parse.
#
# Sui's JSON-RPC public endpoints are sunsetting on testnet this same week,
# mainnet the week of July 20, full deactivation July 31 — named plainly in
# counsel 212212. GraphQL, the other successor, is mainnet-only as of this
# writing; testnet must go through gRPC. This seam calls Sui's own documented
# method, sui.rpc.v2.LedgerService/GetTransaction, confirmed consistently
# across Sui's own docs and independent RPC providers before being written
# here — never guessed at.
#
# New tool dependency, named honestly: this needs grpcurl, not just curl.
# Bench bootstrap: tools/ensure_grpcurl.sh fetches v1.9.3 into gitignored
# tools/.build/grpcurl on first use (same family as qrencode).
# Manual install: https://github.com/fullstorydev/grpcurl
#
# Usage: comlink/chain_read_sui.sh <base58_digest> [grpc_endpoint]
#   base58_digest   the transaction digest, base58-encoded
#   grpc_endpoint   defaults to Sui's own public testnet full node;
#                   override for a provider's dedicated endpoint if the
#                   public one rate-limits or restricts testnet access
#
# Canonical entry, once wired: rishi/bin/rishi run tools/chain_read_sui.rish

set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
cd "${ROOT}"

DIGEST="${1:-}"
ENDPOINT="${2:-fullnode.testnet.sui.io:443}"
METHOD="sui.rpc.v2.LedgerService/GetTransaction"

if [ -z "${DIGEST}" ]; then
  echo "chain_read_sui: RED — no digest given"
  echo "usage: comlink/chain_read_sui.sh <base58_digest> [grpc_endpoint]"
  exit 2
fi

if command -v grpcurl >/dev/null 2>&1; then
  GRPCURL=grpcurl
elif [ -x "${ROOT}/tools/.build/grpcurl" ]; then
  GRPCURL="${ROOT}/tools/.build/grpcurl"
else
  "${ROOT}/tools/ensure_grpcurl.sh" || exit 1
  GRPCURL="${ROOT}/tools/.build/grpcurl"
fi

echo "chain_read_sui: prepare — ${METHOD} against ${ENDPOINT}"

BODY=$(printf '{"digest":"%s","read_mask":{"paths":["digest","transaction","effects","events"]}}' "${DIGEST}")

# Try server reflection first — the simplest path, needing no local .proto
# file. If the endpoint declines reflection, fall back to Sui's published
# proto, fetched fresh rather than vendored, since this file's whole schema
# is the part of this seam most likely to shift under an active migration.
RESPONSE=$("${GRPCURL}" -d "${BODY}" "${ENDPOINT}" "${METHOD}" 2>/tmp/chain_read_sui_grpcurl_err.txt) && REFLECTION_OK=1 || REFLECTION_OK=0

if [ "${REFLECTION_OK}" = "0" ]; then
  echo "chain_read_sui: reflection unavailable, trying with a fetched proto"
  cat /tmp/chain_read_sui_grpcurl_err.txt >&2
  PROTO_DIR=$(mktemp -d)
  trap 'rm -rf "${PROTO_DIR}"' EXIT
  if command -v curl >/dev/null 2>&1; then
    curl -sS -o "${PROTO_DIR}/ledger_service.proto" \
      "https://raw.githubusercontent.com/MystenLabs/sui-apis/main/proto/sui/rpc/v2/ledger_service.proto" || true
  fi
  if [ -f "${PROTO_DIR}/ledger_service.proto" ]; then
    RESPONSE=$("${GRPCURL}" -proto "${PROTO_DIR}/ledger_service.proto" -import-path "${PROTO_DIR}" \
      -d "${BODY}" "${ENDPOINT}" "${METHOD}") || {
      echo "chain_read_sui: RED — request failed even with a fetched proto"
      exit 1
    }
  else
    echo "chain_read_sui: RED — could not fetch a fallback proto; endpoint needs reflection or a local proto tree"
    exit 1
  fi
fi

echo "chain_read_sui: response received"
echo "${RESPONSE}"

if ! command -v python3 >/dev/null 2>&1; then
  echo "chain_read_sui: response printed above; python3 missing, skipping field check"
  exit 0
fi

python3 -c '
import json, sys
try:
    payload = json.loads(sys.argv[1])
except json.JSONDecodeError:
    print("chain_read_sui: RED — response was not valid JSON")
    sys.exit(1)
txn = payload.get("transaction") or {}
digest = txn.get("digest") or payload.get("digest")
if digest is None:
    print("chain_read_sui: no digest field in response — check read_mask paths against the current schema")
    sys.exit(0)
print("chain_read_sui: GREEN — digest " + digest)
' "${RESPONSE}"
