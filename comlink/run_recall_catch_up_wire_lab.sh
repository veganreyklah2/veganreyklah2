#!/bin/sh
# comlink/run_recall_catch_up_wire_lab.sh — catch-up device wire over virtio-net.
#
# Phase 1: rev 2 catch-up hop (request + response).
# Phase 2: rev 3 catch-up hop (request + response).
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_request="${COMLINK_CATCHUP_LAB_PORT:-15565}"
port_response="${COMLINK_CATCHUP_RESP_LAB_PORT:-15566}"
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
    echo "ns-catchupw device: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "ns-catchupw device: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

build_guest comlink/guest_catchup_source_rx.rye "$build_dir/catchup-source-rx.elf"
build_guest comlink/guest_catchup_fetcher_tx_r2.rye "$build_dir/catchup-fetcher-tx-r2.elf"
build_guest comlink/guest_catchup_fetcher_rx_r2.rye "$build_dir/catchup-fetcher-rx-r2.elf"
build_guest comlink/guest_catchup_source_tx_r2.rye "$build_dir/catchup-source-tx-r2.elf"
build_guest comlink/guest_catchup_fetcher_tx_r3.rye "$build_dir/catchup-fetcher-tx-r3.elf"
build_guest comlink/guest_catchup_fetcher_rx_r3.rye "$build_dir/catchup-fetcher-rx-r3.elf"
build_guest comlink/guest_catchup_source_tx_r3.rye "$build_dir/catchup-source-tx-r3.elf"

run_hop "$sock_request" "$build_dir/catchup-source-rx.elf" "$build_dir/catchup-fetcher-tx-r2.elf" \
    "$build_dir/catchup-source-rx-r2.log" "$build_dir/catchup-fetcher-tx-r2.log" "rev2-request"

run_hop "$sock_response" "$build_dir/catchup-fetcher-rx-r2.elf" "$build_dir/catchup-source-tx-r2.elf" \
    "$build_dir/catchup-fetcher-rx-r2.log" "$build_dir/catchup-source-tx-r2.log" "rev2-response"

run_hop "$sock_request" "$build_dir/catchup-source-rx.elf" "$build_dir/catchup-fetcher-tx-r3.elf" \
    "$build_dir/catchup-source-rx-r3.log" "$build_dir/catchup-fetcher-tx-r3.log" "rev3-request"

run_hop "$sock_response" "$build_dir/catchup-fetcher-rx-r3.elf" "$build_dir/catchup-source-tx-r3.elf" \
    "$build_dir/catchup-fetcher-rx-r3.log" "$build_dir/catchup-source-tx-r3.log" "rev3-response"

r2_ok=0
r3_ok=0
grep -q "catch-up rev 2 GREEN" "$build_dir/catchup-fetcher-rx-r2.log" && r2_ok=1
grep -q "catch-up rev 3 GREEN" "$build_dir/catchup-fetcher-rx-r3.log" && r3_ok=1

if [ "$r2_ok" -eq 1 ] && [ "$r3_ok" -eq 1 ]; then
    echo "ns-catchupw device wire lab: GREEN (rev 2 + rev 3 catch-up)"
    exit 0
fi

echo "ns-catchupw device wire lab: RED"
if [ "$r2_ok" -ne 1 ]; then
    echo "--- rev2 fetcher rx ---"
    cat "$build_dir/catchup-fetcher-rx-r2.log"
fi
if [ "$r3_ok" -ne 1 ]; then
    echo "--- rev3 fetcher rx ---"
    cat "$build_dir/catchup-fetcher-rx-r3.log"
fi
exit 1
