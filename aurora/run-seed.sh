#!/bin/sh
# aurora/run-seed.sh — build Aurora's first seed with Rye, and wake it in an emulator.
#
# A hart wakes on a freestanding RISC-V machine, speaks one line over the
# console, and powers the machine off cleanly (exit 0). This is the smallest
# living piece of the boot story — the simple, working system the rest grows from.
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(cd "$here/.." && pwd)"
cd "$repo"

# Rye needs its toolchain. Honor a pre-set RYE_ZIG; otherwise use the vendored
# Zig 0.16.0 kept beside the project, so the seed builds with no extra setup.
if [ -z "${RYE_ZIG:-}" ] && [ -x "vendor/zig-toolchain/zig" ]; then
    RYE_ZIG="$repo/vendor/zig-toolchain/zig"
    export RYE_ZIG
fi

mkdir -p aurora/.build

echo "building the seed with rye build (freestanding riscv64) ..."
rye/bin/rye build aurora/src/seed.rye \
    -target riscv64-freestanding-none \
    -mcmodel=medium \
    -fno-entry \
    -T aurora/seed.ld \
    -femit-bin=aurora/.build/seed.elf

echo "waking the seed in qemu-system-riscv64 (machine virt) ..."
echo "----"
status=0
timeout 10 qemu-system-riscv64 -machine virt -bios none -nographic \
    -kernel aurora/.build/seed.elf || status=$?
echo "----"
echo "qemu exited with status $status (0 means the hart asked the machine to rest)"
exit "$status"
