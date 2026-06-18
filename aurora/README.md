# Aurora — the dawn a machine wakes into

**Version:** `20260618.191412` (Rye chronological stamp)
**Style:** Radiant prose (see `../context/RADIANT_STYLE.md`); code in TAME Style (`../external-research/996_TAME_STYLE.md`)
**Status:** First seed — small, runnable, and growing

---

## What Aurora Is

Aurora is the dawn a machine wakes into: the boot, the first light between a cold
processor and a living system. The fuller vision — RISC-V cohesion, a flow of
named values, content-addressed stages, owner keys — lives in
`../external-research/993_aurora_boot_riscv.md`, read forward through the rethink
in `../external-research/986_decided_design_aurora_mantra.md`. This folder holds
the part that already breathes.

## The First Seed

Following Gall's Law — a working complex system grows from a working simple one —
Aurora begins with the smallest boot that runs. In `src/seed.rye`, one hart wakes
on a freestanding RISC-V machine, gives itself a stack, speaks a single line over
the console, and asks the machine to rest. No operating system sits beneath it
and no standard library above it: only Rye's own toolchain, aimed at bare metal,
and an emulator to wake in.

It is also the step where Rye and Aurora meet. Rye's north star asks it to cohere
with open hardware (`../context/specs/rye-as-its-own-language.md`); a freestanding
RISC-V binary, built by Rye and run on a real emulator, is that coherence made
concrete — and the same artifact is Aurora's first living stage. One step, two
roots fed.

## Build and Run

```sh
aurora/run-seed.sh
```

That single command asks `rye build` to emit a freestanding RISC-V ELF — Rye
building its own bare-metal artifact, against its own standard library — and then
wakes it on `qemu-system-riscv64 -machine virt`. You should see:

```
Aurora seed: a hart woke on RISC-V, spoke this line, and halted.
```

and a clean exit (status 0), because the seed writes the machine's test finisher
to power itself down. The script uses the vendored Zig 0.16.0 toolchain beside
the project, so it needs no extra setup; an emulator (`qemu-system-riscv64`) is
the one thing it expects to find.

## The Shape of the Folder

```
aurora/
  README.md          <- this introduction
  src/
    seed.rye         <- the first seed: a hart wakes, speaks, and halts
  seed.ld            <- where the seed lives in memory (RAM base, _start first)
  run-seed.sh        <- build with rye, wake in qemu
  .build/            <- the emitted ELF (built on demand, untracked)
```

## How It Grows

The seed is the simple system that works; each later stage is grown from it,
never bolted on. The near steps: a **second asserted stage** — read a register or
a device, prove a value, hand off — turning one line of output into the first
true relay; then, as the other modules ripen, Tally's bounded gardens for the
boot's own memory, Caravan's hand on what runs next, and Silo describing the
stages as values rather than code. Mantra will give each stage an enduring,
content-addressed name, so a boot can say exactly what it ran. The roadmap that
holds these steps lives in `../work-in-progress/996_roadmap.md`.

---

*May the first light be gentle and sure: a hart waking, a single true line
spoken, and a clean rest — the dawn the rest of the system grows into.*
