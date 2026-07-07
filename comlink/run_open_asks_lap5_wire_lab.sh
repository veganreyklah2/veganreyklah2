#!/bin/sh
# comlink/run_open_asks_lap5_wire_lab.sh — OA-L5 device wire (acceptance + completion + consent hops).
#
# Hop 1: guest_open_asks_acceptance_tx → guest_open_asks_acceptance_rx
# Hop 2: guest_open_asks_completion_tx → guest_open_asks_completion_rx
# Hop 3: guest_open_asks_consent_tx → guest_open_asks_consent_rx (reputation fold)
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

port_acceptance="${COMLINK_OPEN_ASKS_ACCEPT_PORT:-15561}"
port_completion="${COMLINK_OPEN_ASKS_COMPLETE_PORT:-15562}"
port_consent="${COMLINK_OPEN_ASKS_CONSENT_PORT:-15563}"
sock_acceptance="127.0.0.1:${port_acceptance}"
sock_completion="127.0.0.1:${port_completion}"
sock_consent="127.0.0.1:${port_consent}"
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

build_guest comlink/guest_open_asks_acceptance_rx.rye "$build_dir/open-asks-accept-rx.elf"
build_guest comlink/guest_open_asks_acceptance_tx.rye "$build_dir/open-asks-accept-tx.elf"
build_guest comlink/guest_open_asks_completion_rx.rye "$build_dir/open-asks-complete-rx.elf"
build_guest comlink/guest_open_asks_completion_tx.rye "$build_dir/open-asks-complete-tx.elf"
build_guest comlink/guest_open_asks_consent_rx.rye "$build_dir/open-asks-consent-rx.elf"
build_guest comlink/guest_open_asks_consent_tx.rye "$build_dir/open-asks-consent-tx.elf"

common="-machine virt -bios none -nographic -global virtio-mmio.force-legacy=false -device virtio-net-device,netdev=net0"

run_hop() {
    sock="$1"
    rx_elf="$2"
    tx_elf="$3"
    rx_log="$4"
    tx_log="$5"
    label="$6"
    rm -f "$rx_log" "$tx_log"
    echo "oal5 device wire: ${label} RX listen ${sock} ..."
    timeout 60 qemu-system-riscv64 $common -netdev "socket,id=net0,listen=${sock}" -kernel "$rx_elf" >"$rx_log" 2>&1 &
    rx_pid=$!
    sleep 1
    echo "oal5 device wire: ${label} TX connect ${sock} ..."
    timeout 30 qemu-system-riscv64 $common -netdev "socket,id=net0,connect=${sock}" -kernel "$tx_elf" >"$tx_log" 2>&1 || true
    wait "$rx_pid" || true
}

run_hop "$sock_acceptance" "$build_dir/open-asks-accept-rx.elf" "$build_dir/open-asks-accept-tx.elf" \
    "$build_dir/open-asks-accept-rx.log" "$build_dir/open-asks-accept-tx.log" "acceptance"

run_hop "$sock_completion" "$build_dir/open-asks-complete-rx.elf" "$build_dir/open-asks-complete-tx.elf" \
    "$build_dir/open-asks-complete-rx.log" "$build_dir/open-asks-complete-tx.log" "completion"

run_hop "$sock_consent" "$build_dir/open-asks-consent-rx.elf" "$build_dir/open-asks-consent-tx.elf" \
    "$build_dir/open-asks-consent-rx.log" "$build_dir/open-asks-consent-tx.log" "consent"

accept_ok=0
complete_ok=0
consent_ok=0
grep -q "sealed acceptance GREEN" "$build_dir/open-asks-accept-rx.log" && accept_ok=1
grep -q "sealed completion GREEN" "$build_dir/open-asks-complete-rx.log" && complete_ok=1
grep -q "sealed consent GREEN" "$build_dir/open-asks-consent-rx.log" && consent_ok=1

if [ "$accept_ok" -eq 1 ] && [ "$complete_ok" -eq 1 ] && [ "$consent_ok" -eq 1 ]; then
    echo "oal5 device wire lab: GREEN (acceptance + completion + consent)"
    exit 0
fi

echo "oal5 device wire lab: RED"
if [ "$accept_ok" -ne 1 ]; then
    echo "--- acceptance rx ---"
    cat "$build_dir/open-asks-accept-rx.log"
    echo "--- acceptance tx ---"
    cat "$build_dir/open-asks-accept-tx.log"
fi
if [ "$complete_ok" -ne 1 ]; then
    echo "--- completion rx ---"
    cat "$build_dir/open-asks-complete-rx.log"
    echo "--- completion tx ---"
    cat "$build_dir/open-asks-complete-tx.log"
fi
if [ "$consent_ok" -ne 1 ]; then
    echo "--- consent rx ---"
    cat "$build_dir/open-asks-consent-rx.log"
    echo "--- consent tx ---"
    cat "$build_dir/open-asks-consent-tx.log"
fi
exit 1
