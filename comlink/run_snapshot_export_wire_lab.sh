#!/bin/sh
# comlink/run_snapshot_export_wire_lab.sh — I2 snapshot lap 3 device wire (one revision batch hop).
#
# Hop 1: guest_snapshot_fetcher_tx → guest_snapshot_source_rx (sealed batch request).
# Hop 2: guest_snapshot_source_tx → guest_snapshot_fetcher_rx (sealed resin-batch).
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_request="${COMLINK_SNAPSHOT_LAB_PORT:-15567}"
port_response="${COMLINK_SNAPSHOT_RESP_LAB_PORT:-15568}"
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

build_guest comlink/guest_snapshot_source_rx.rye "$build_dir/snapshot-source-rx.elf"
build_guest comlink/guest_snapshot_fetcher_tx.rye "$build_dir/snapshot-fetcher-tx.elf"
build_guest comlink/guest_snapshot_fetcher_rx.rye "$build_dir/snapshot-fetcher-rx.elf"
build_guest comlink/guest_snapshot_source_tx.rye "$build_dir/snapshot-source-tx.elf"

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "sed device wire: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "sed device wire: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

run_hop "$sock_request" "$build_dir/snapshot-source-rx.elf" "$build_dir/snapshot-fetcher-tx.elf" \
    "$build_dir/snapshot-source-rx.log" "$build_dir/snapshot-fetcher-tx.log" "request"

run_hop "$sock_response" "$build_dir/snapshot-fetcher-rx.elf" "$build_dir/snapshot-source-tx.elf" \
    "$build_dir/snapshot-fetcher-rx.log" "$build_dir/snapshot-source-tx.log" "response"

request_ok=0
response_ok=0
grep -q "sealed snapshot batch request GREEN" "$build_dir/snapshot-source-rx.log" && request_ok=1
grep -q "sealed snapshot batch response GREEN" "$build_dir/snapshot-fetcher-rx.log" && response_ok=1

if [ "$request_ok" -eq 1 ] && [ "$response_ok" -eq 1 ]; then
    echo "sed device wire lab: GREEN (snapshot revision batch)"
    exit 0
fi

echo "sed device wire lab: RED"
if [ "$request_ok" -ne 1 ]; then
    echo "--- request source rx ---"
    cat "$build_dir/snapshot-source-rx.log"
    echo "--- request fetcher tx ---"
    cat "$build_dir/snapshot-fetcher-tx.log"
fi
if [ "$response_ok" -ne 1 ]; then
    echo "--- response fetcher rx ---"
    cat "$build_dir/snapshot-fetcher-rx.log"
    echo "--- response source tx ---"
    cat "$build_dir/snapshot-source-tx.log"
fi
exit 1
