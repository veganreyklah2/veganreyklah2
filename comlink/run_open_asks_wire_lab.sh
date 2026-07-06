#!/bin/sh
# comlink/run_open_asks_wire_lab.sh — OA-L2 device wire over virtio-net (request + application hops).
#
# Hop 1: guest_open_asks_tx → guest_open_asks_rx (sealed request).
# Hop 2: guest_open_asks_application_tx → guest_open_asks_poster_rx (sealed application, fold applied).
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_request="${COMLINK_OPEN_ASKS_LAB_PORT:-15557}"
port_application="${COMLINK_OPEN_ASKS_APP_LAB_PORT:-15558}"
sock_request="127.0.0.1:${port_request}"
sock_application="127.0.0.1:${port_application}"
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

build_guest comlink/guest_open_asks_rx.rye "$build_dir/open-asks-rx.elf"
build_guest comlink/guest_open_asks_tx.rye "$build_dir/open-asks-tx.elf"
build_guest comlink/guest_open_asks_poster_rx.rye "$build_dir/open-asks-poster-rx.elf"
build_guest comlink/guest_open_asks_application_tx.rye "$build_dir/open-asks-app-tx.elf"

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "oal2 device wire: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "oal2 device wire: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

run_hop "$sock_request" "$build_dir/open-asks-rx.elf" "$build_dir/open-asks-tx.elf" \
    "$build_dir/open-asks-rx.log" "$build_dir/open-asks-tx.log" "request"

run_hop "$sock_application" "$build_dir/open-asks-poster-rx.elf" "$build_dir/open-asks-app-tx.elf" \
    "$build_dir/open-asks-poster-rx.log" "$build_dir/open-asks-app-tx.log" "application"

request_ok=0
application_ok=0
grep -q "sealed request GREEN" "$build_dir/open-asks-rx.log" && request_ok=1
grep -q "sealed application GREEN" "$build_dir/open-asks-poster-rx.log" && application_ok=1

if [ "$request_ok" -eq 1 ] && [ "$application_ok" -eq 1 ]; then
    echo "oal2 device wire lab: GREEN (request + application)"
    exit 0
fi

echo "oal2 device wire lab: RED"
if [ "$request_ok" -ne 1 ]; then
    echo "--- request rx ---"
    cat "$build_dir/open-asks-rx.log"
    echo "--- request tx ---"
    cat "$build_dir/open-asks-tx.log"
fi
if [ "$application_ok" -ne 1 ]; then
    echo "--- application poster rx ---"
    cat "$build_dir/open-asks-poster-rx.log"
    echo "--- application tx ---"
    cat "$build_dir/open-asks-app-tx.log"
fi
exit 1
