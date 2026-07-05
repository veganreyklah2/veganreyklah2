#!/bin/sh
# comlink/run_device_wire_lab.sh — sub-lap 2 lab: two virt guests on socket netdev.
#
# RX guest listens; TX guest connects and sends the fixed pattern. The shell
# asserts both QEMU exits clean and the RX console carries the GREEN banner.
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port="${COMLINK_LAB_PORT:-15555}"
sock="127.0.0.1:${port}"
build_dir="comlink/.build"
rx_elf="${build_dir}/pattern-rx.elf"
tx_elf="${build_dir}/pattern-tx.elf"
rx_log="${build_dir}/pattern-rx.log"
tx_log="${build_dir}/pattern-tx.log"

if [ -z "${RYE_ZIG:-}" ] && [ -x "vendor/zig-toolchain/zig" ]; then
    RYE_ZIG="$repo/vendor/zig-toolchain/zig"
    export RYE_ZIG
fi

rye_flags="-target riscv64-freestanding-none -mcmodel=medium -fno-entry -T aurora/layout.ld"

mkdir -p "$build_dir"

build_guest() {
    src="$1"
    out="$2"
    echo "building ${src} ..."
    rye/bin/rye build "$src" $rye_flags -femit-bin="$out"
}

build_guest comlink/guest_pattern_rx.rye "$rx_elf"
build_guest comlink/guest_pattern_tx.rye "$tx_elf"

qemu_common="-machine virt -bios none -nographic -device virtio-net-device,netdev=net0"

rm -f "$rx_log" "$tx_log"

echo "waking RX guest (listen ${sock}) ..."
timeout 30 qemu-system-riscv64 $qemu_common \
    -netdev "socket,id=net0,listen=${sock}" \
    -kernel "$rx_elf" >"$rx_log" 2>&1 &
rx_pid=$!

# Give the listener a moment to bind before the TX guest connects.
sleep 1

echo "waking TX guest (connect ${sock}) ..."
tx_status=0
timeout 20 qemu-system-riscv64 $qemu_common \
    -netdev "socket,id=net0,connect=${sock}" \
    -kernel "$tx_elf" >"$tx_log" 2>&1 || tx_status=$?

rx_status=0
wait "$rx_pid" || rx_status=$?

echo "---- RX console ----"
cat "$rx_log"
echo "---- TX console ----"
cat "$tx_log"
echo "----"

if [ "$tx_status" -ne 0 ]; then
    echo "comlink device wire lab: TX guest exited ${tx_status}" >&2
    exit 1
fi

if ! grep -Fq "linktest GREEN" "$rx_log"; then
    echo "comlink device wire lab: RX missing GREEN banner" >&2
    exit 1
fi

if ! grep -Fq "sub-lap 2" "$rx_log"; then
    echo "comlink device wire lab: RX missing sub-lap 2 banner" >&2
    exit 1
fi

echo "comlink device wire lab: linktest GREEN — sub-lap 2 pattern TX/RX"
exit 0
