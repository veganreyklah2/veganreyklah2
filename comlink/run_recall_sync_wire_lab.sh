#!/bin/sh
# comlink/run_recall_sync_wire_lab.sh — NS-L3 wire lap 2 device wire over virtio-net.
#
# Hop 1: guest_sync_fetcher_tx → guest_sync_source_rx (sealed sync request).
# Hop 2: guest_sync_source_tx → guest_sync_fetcher_rx (sealed sync response, recall beta).
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_request="${COMLINK_SYNC_LAB_PORT:-15561}"
port_response="${COMLINK_SYNC_RESP_LAB_PORT:-15562}"
sock_request="127.0.0.1:${port_request}"
sock_response="127.0.0.1:${port_response}"
build_dir="comlink/.build"

if [ -z "${RYE_ZIG:-}" ] && [ -x "vendor/zig-toolchain/zig" ]; then
    RYE_ZIG="$repo/vendor/zig-toolchain/zig"
    export RYE_ZIG
fi

rye_flags="-target riscv64-freestanding-none -mcmodel=medium -fno-entry -T aurora/layout.ld"
mkdir -p "$build_dir"

build_guest() {
    echo "building $1 ..."
    rye/bin/rye build "$1" $rye_flags -femit-bin="$2"
}

build_guest comlink/guest_sync_source_rx.rye "$build_dir/sync-source-rx.elf"
build_guest comlink/guest_sync_fetcher_tx.rye "$build_dir/sync-fetcher-tx.elf"
build_guest comlink/guest_sync_fetcher_rx.rye "$build_dir/sync-fetcher-rx.elf"
build_guest comlink/guest_sync_source_tx.rye "$build_dir/sync-source-tx.elf"

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "nsw2 device wire: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "nsw2 device wire: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

run_hop "$sock_request" "$build_dir/sync-source-rx.elf" "$build_dir/sync-fetcher-tx.elf" \
    "$build_dir/sync-source-rx.log" "$build_dir/sync-fetcher-tx.log" "request"

run_hop "$sock_response" "$build_dir/sync-fetcher-rx.elf" "$build_dir/sync-source-tx.elf" \
    "$build_dir/sync-fetcher-rx.log" "$build_dir/sync-source-tx.log" "response"

request_ok=0
response_ok=0
grep -q "sealed sync request GREEN" "$build_dir/sync-source-rx.log" && request_ok=1
grep -q "sealed sync response GREEN" "$build_dir/sync-fetcher-rx.log" && response_ok=1

if [ "$request_ok" -eq 1 ] && [ "$response_ok" -eq 1 ]; then
    echo "nsw2 device wire lab: GREEN (request + response)"
    exit 0
fi

echo "nsw2 device wire lab: RED"
if [ "$request_ok" -ne 1 ]; then
    echo "--- request source rx ---"
    cat "$build_dir/sync-source-rx.log"
    echo "--- request fetcher tx ---"
    cat "$build_dir/sync-fetcher-tx.log"
fi
if [ "$response_ok" -ne 1 ]; then
    echo "--- response fetcher rx ---"
    cat "$build_dir/sync-fetcher-rx.log"
    echo "--- response source tx ---"
    cat "$build_dir/sync-source-tx.log"
fi
exit 1
