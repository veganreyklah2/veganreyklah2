#!/bin/sh
# comlink/run_device_wire_lab.sh — device-wire lab on two QEMU virt guests.
#
# Sub-lap 2: a fixed link pattern crosses virtio-net (guest_pattern_*).
# Sub-lap 3: a sealed datagram crosses and opens on the far side (guest_sealed_*).
# The device is asked for the modern (version 2) transport with force-legacy=false;
# the ruling in active-designing explains why. Exits 0 only when both laps are GREEN.
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port="${COMLINK_LAB_PORT:-15555}"
sock="127.0.0.1:${port}"
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

build_guest comlink/guest_pattern_rx.rye "$build_dir/pattern-rx.elf"
build_guest comlink/guest_pattern_tx.rye "$build_dir/pattern-tx.elf"
build_guest comlink/guest_sealed_rx.rye  "$build_dir/sealed-rx.elf"
build_guest comlink/guest_sealed_tx.rye  "$build_dir/sealed-tx.elf"

# Modern transport: the device shows version 2 and the split-queue layout.
common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_lap() {
    lap="$1"; rx_elf="$2"; tx_elf="$3"; banner="$4"
    rx_log="$build_dir/${lap}-rx.log"; tx_log="$build_dir/${lap}-tx.log"
    rm -f "$rx_log" "$tx_log"
    echo "lap ${lap}: RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "lap ${lap}: TX connect ${sock} ..."
    tx_status=0
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || tx_status=$?
    wait "$rx_pid" || true
    if grep -q "$banner" "$rx_log"; then
        echo "lap ${lap}: GREEN"
    else
        echo "lap ${lap}: RED"; echo "--- rx ---"; cat "$rx_log"; echo "--- tx ---"; cat "$tx_log"
        return 1
    fi
}

run_lap pattern "$build_dir/pattern-rx.elf" "$build_dir/pattern-tx.elf" "linktest GREEN"
run_lap sealed  "$build_dir/sealed-rx.elf"  "$build_dir/sealed-tx.elf"  "sealed datagram GREEN"

echo "comlink device wire lab: GREEN — sub-lap 2 and sub-lap 3"
