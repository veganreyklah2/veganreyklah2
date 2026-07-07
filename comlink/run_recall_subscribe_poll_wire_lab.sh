#!/bin/sh
# comlink/run_recall_subscribe_poll_wire_lab.sh — poll wire device: one cycle body = catch-up rev 2.
#
# Outer poll composes catch-up wire exchanges; device proves one cycle's catch-up hop.
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_request="${COMLINK_CATCHUP_LAB_PORT:-15565}"
port_response="${COMLINK_CATCHUP_RESP_LAB_PORT:-15566}"
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

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "ns-pollw device: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "ns-pollw device: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

sock_request="127.0.0.1:${port_request}"
sock_response="127.0.0.1:${port_response}"

build_guest comlink/guest_catchup_source_rx.rye "$build_dir/catchup-source-rx.elf"
build_guest comlink/guest_catchup_fetcher_tx_r2.rye "$build_dir/catchup-fetcher-tx-r2.elf"
build_guest comlink/guest_catchup_fetcher_rx_r2.rye "$build_dir/catchup-fetcher-rx-r2.elf"
build_guest comlink/guest_catchup_source_tx_r2.rye "$build_dir/catchup-source-tx-r2.elf"

run_hop "$sock_request" "$build_dir/catchup-source-rx.elf" "$build_dir/catchup-fetcher-tx-r2.elf" \
    "$build_dir/poll-source-rx.log" "$build_dir/poll-fetcher-tx.log" "poll-rev2-request"

run_hop "$sock_response" "$build_dir/catchup-fetcher-rx-r2.elf" "$build_dir/catchup-source-tx-r2.elf" \
    "$build_dir/poll-fetcher-rx.log" "$build_dir/poll-source-tx.log" "poll-rev2-response"

if grep -q "catch-up rev 2 GREEN" "$build_dir/poll-fetcher-rx.log"; then
    echo "ns-pollw device wire lab: GREEN (one poll-cycle catch-up body)"
    exit 0
fi

echo "ns-pollw device wire lab: RED"
cat "$build_dir/poll-fetcher-rx.log"
exit 1
