#!/bin/sh
# comlink/run_recall_two_way_sync_wire_lab.sh — two-way sync device wire over virtio-net.
#
# Phase 1: peerB → peerA (existing NS-L3 sync guests).
# Phase 2: peerA → peerB (reversed roles — guest_2way_*).
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

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "ns-2wayw device: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "ns-2wayw device: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

# Phase 1 — peerB into peerA (reuses NS-L3 lap-2 guests).
build_guest comlink/guest_sync_source_rx.rye "$build_dir/sync-source-rx.elf"
build_guest comlink/guest_sync_fetcher_tx.rye "$build_dir/sync-fetcher-tx.elf"
build_guest comlink/guest_sync_fetcher_rx.rye "$build_dir/sync-fetcher-rx.elf"
build_guest comlink/guest_sync_source_tx.rye "$build_dir/sync-source-tx.elf"

run_hop "$sock_request" "$build_dir/sync-source-rx.elf" "$build_dir/sync-fetcher-tx.elf" \
    "$build_dir/sync-source-rx.log" "$build_dir/sync-fetcher-tx.log" "peerB-request"

run_hop "$sock_response" "$build_dir/sync-fetcher-rx.elf" "$build_dir/sync-source-tx.elf" \
    "$build_dir/sync-fetcher-rx.log" "$build_dir/sync-source-tx.log" "peerB-response"

phase1_ok=0
grep -q "sealed sync request GREEN" "$build_dir/sync-source-rx.log" && \
    grep -q "sealed sync response GREEN" "$build_dir/sync-fetcher-rx.log" && phase1_ok=1

# Phase 2 — peerA into peerB (roles reversed).
build_guest comlink/guest_2way_source_rx.rye "$build_dir/2way-source-rx.elf"
build_guest comlink/guest_2way_fetcher_tx.rye "$build_dir/2way-fetcher-tx.elf"
build_guest comlink/guest_2way_fetcher_rx.rye "$build_dir/2way-fetcher-rx.elf"
build_guest comlink/guest_2way_source_tx.rye "$build_dir/2way-source-tx.elf"

run_hop "$sock_request" "$build_dir/2way-source-rx.elf" "$build_dir/2way-fetcher-tx.elf" \
    "$build_dir/2way-source-rx.log" "$build_dir/2way-fetcher-tx.log" "peerA-request"

run_hop "$sock_response" "$build_dir/2way-fetcher-rx.elf" "$build_dir/2way-source-tx.elf" \
    "$build_dir/2way-fetcher-rx.log" "$build_dir/2way-source-tx.log" "peerA-response"

phase2_ok=0
grep -q "sealed peerA sync request GREEN" "$build_dir/2way-source-rx.log" && \
    grep -q "sealed peerA sync response GREEN" "$build_dir/2way-fetcher-rx.log" && phase2_ok=1

if [ "$phase1_ok" -eq 1 ] && [ "$phase2_ok" -eq 1 ]; then
    echo "ns-2wayw device wire lab: GREEN (peerB + peerA, roles reversed)"
    exit 0
fi

echo "ns-2wayw device wire lab: RED"
if [ "$phase1_ok" -ne 1 ]; then
    echo "--- phase 1 peerB request source rx ---"
    cat "$build_dir/sync-source-rx.log"
    echo "--- phase 1 peerB request fetcher tx ---"
    cat "$build_dir/sync-fetcher-tx.log"
    echo "--- phase 1 peerB response fetcher rx ---"
    cat "$build_dir/sync-fetcher-rx.log"
    echo "--- phase 1 peerB response source tx ---"
    cat "$build_dir/sync-source-tx.log"
fi
if [ "$phase2_ok" -ne 1 ]; then
    echo "--- phase 2 peerA request source rx ---"
    cat "$build_dir/2way-source-rx.log"
    echo "--- phase 2 peerA request fetcher tx ---"
    cat "$build_dir/2way-fetcher-tx.log"
    echo "--- phase 2 peerA response fetcher rx ---"
    cat "$build_dir/2way-fetcher-rx.log"
    echo "--- phase 2 peerA response source tx ---"
    cat "$build_dir/2way-source-tx.log"
fi
exit 1
