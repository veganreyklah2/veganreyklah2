#!/usr/bin/env sh
# ensure_grpcurl.sh — fetch grpcurl into tools/.build on first use.
#
# Host tool for comlink/chain_read_sui.sh (Sui testnet gRPC seam). The binary
# is not vendored in git — tools/.build/ is gitignored, same family as qrencode.
#
# Usage (from repository root):
#   tools/ensure_grpcurl.sh
#
# Pin: grpcurl v1.9.3 — https://github.com/fullstorydev/grpcurl

set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
BUILD="${ROOT}/tools/.build"
BIN="${BUILD}/grpcurl"
VERSION="1.9.3"

if [ -x "${BIN}" ]; then
  echo "ensure_grpcurl: already present at ${BIN}"
  exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "ensure_grpcurl: RED — curl missing; cannot fetch grpcurl"
  exit 1
fi

ARCH=$(uname -m)
case "${ARCH}" in
  x86_64|amd64) GARCH="x86_64" ;;
  aarch64|arm64) GARCH="arm64" ;;
  *)
    echo "ensure_grpcurl: RED — unsupported architecture ${ARCH}"
    exit 1
    ;;
esac

URL="https://github.com/fullstorydev/grpcurl/releases/download/v${VERSION}/grpcurl_${VERSION}_linux_${GARCH}.tar.gz"
TMP=$(mktemp -d)
trap 'rm -rf "${TMP}"' EXIT

mkdir -p "${BUILD}"
echo "ensure_grpcurl: fetching v${VERSION} for linux_${GARCH}"

curl -fsSL "${URL}" -o "${TMP}/grpcurl.tgz"
tar -xzf "${TMP}/grpcurl.tgz" -C "${TMP}" grpcurl
install -m 755 "${TMP}/grpcurl" "${BIN}"

echo "ensure_grpcurl: GREEN — installed ${BIN}"
"${BIN}" --version
