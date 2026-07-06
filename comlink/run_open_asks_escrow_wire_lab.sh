#!/bin/sh
# comlink/run_open_asks_escrow_wire_lab.sh — OA-L3 lap 2 device wire (hold + release hops).
#
# Hop 1: guest_open_asks_escrow_hold_tx → guest_open_asks_escrow_hold_rx (sealed hold).
# Hop 2: guest_open_asks_escrow_release_tx → guest_open_asks_escrow_release_rx (sealed release).
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_hold="${COMLINK_OPEN_ASKS_ESCROW_HOLD_PORT:-15559}"
port_release="${COMLINK_OPEN_ASKS_ESCROW_RELEASE_PORT:-15560}"
sock_hold="127.0.0.1:${port_hold}"
sock_release="127.0.0.1:${port_release}"
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

build_guest comlink/guest_open_asks_escrow_hold_rx.rye "$build_dir/open-asks-escrow-hold-rx.elf"
build_guest comlink/guest_open_asks_escrow_hold_tx.rye "$build_dir/open-asks-escrow-hold-tx.elf"
build_guest comlink/guest_open_asks_escrow_release_rx.rye "$build_dir/open-asks-escrow-release-rx.elf"
build_guest comlink/guest_open_asks_escrow_release_tx.rye "$build_dir/open-asks-escrow-release-tx.elf"

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "oal3l2 device wire: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "oal3l2 device wire: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

run_hop "$sock_hold" "$build_dir/open-asks-escrow-hold-rx.elf" "$build_dir/open-asks-escrow-hold-tx.elf" \
    "$build_dir/open-asks-escrow-hold-rx.log" "$build_dir/open-asks-escrow-hold-tx.log" "hold"

run_hop "$sock_release" "$build_dir/open-asks-escrow-release-rx.elf" "$build_dir/open-asks-escrow-release-tx.elf" \
    "$build_dir/open-asks-escrow-release-rx.log" "$build_dir/open-asks-escrow-release-tx.log" "release"

hold_ok=0
release_ok=0
grep -q "sealed hold GREEN" "$build_dir/open-asks-escrow-hold-rx.log" && hold_ok=1
grep -q "sealed release GREEN" "$build_dir/open-asks-escrow-release-rx.log" && release_ok=1

if [ "$hold_ok" -eq 1 ] && [ "$release_ok" -eq 1 ]; then
    echo "oal3l2 device wire lab: GREEN (hold + release)"
    exit 0
fi

echo "oal3l2 device wire lab: RED"
if [ "$hold_ok" -ne 1 ]; then
    echo "--- hold rx ---"
    cat "$build_dir/open-asks-escrow-hold-rx.log"
    echo "--- hold tx ---"
    cat "$build_dir/open-asks-escrow-hold-tx.log"
fi
if [ "$release_ok" -ne 1 ]; then
    echo "--- release rx ---"
    cat "$build_dir/open-asks-escrow-release-rx.log"
    echo "--- release tx ---"
    cat "$build_dir/open-asks-escrow-release-tx.log"
fi
exit 1
