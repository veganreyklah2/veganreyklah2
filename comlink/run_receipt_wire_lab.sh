#!/bin/sh
# comlink/run_receipt_wire_lab.sh — SLC-L2 sealed receipt over virtio-net (device wire variant).
#
# One lap: guest_receipt_tx seals the pinned SLC-L1 fact; guest_receipt_rx opens and verifies.
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port="${COMLINK_RECEIPT_LAB_PORT:-15556}"
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

build_guest comlink/guest_receipt_rx.rye "$build_dir/receipt-rx.elf"
build_guest comlink/guest_receipt_tx.rye "$build_dir/receipt-tx.elf"

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

rx_log="$build_dir/receipt-rx.log"
tx_log="$build_dir/receipt-tx.log"
rm -f "$rx_log" "$tx_log"

echo "slcl2 device wire: RX listen ${sock} ..."
timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$build_dir/receipt-rx.elf" >"$rx_log" 2>&1 &
rx_pid=$!
sleep 1
echo "slcl2 device wire: TX connect ${sock} ..."
timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$build_dir/receipt-tx.elf" >"$tx_log" 2>&1 || true
wait "$rx_pid" || true

banner="sealed receipt GREEN"
if grep -q "$banner" "$rx_log"; then
    echo "slcl2 device wire lab: GREEN"
    exit 0
fi

echo "slcl2 device wire lab: RED"
echo "--- rx ---"
cat "$rx_log"
echo "--- tx ---"
cat "$tx_log"
exit 1
