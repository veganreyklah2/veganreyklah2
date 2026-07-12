# Proven-seat G1 — crossing pin (named path)

*Spike answer for Claude’s honest first question: which build path crosses a Rye receipt seed onto Genode’s POSIX-compatible runtime?*

**Stamp:** `20260712.195339`
**Language:** EN
**Style:** Radiant
**Voice:** Rio 3
**Status:** Checkable — path **named** · toolchain **not yet fetched** this sitting · serial GREEN still ahead
**Ground:** Claude counsel [`20260712-195155_proven-seat-g1-claude-opening-counsel.md`](20260712-195155_proven-seat-g1-claude-opening-counsel.md) · public Genode Applications / Foundations docs · Sculpt **26.04** already pinned for G0

---

## Verdict (bench)

| Candidate | Role |
|-----------|------|
| **Host `vendor/zig-toolchain` + `rye build` alone** | **Refuse as the Genode crossing** — produces a Linux or wasm guest ABI, not Genode’s libc |
| **Genode toolchain** (`./tool/tool_chain` or prebuilt tarball; Goa `install-toolchain`) | **Teacher for compile** — GCC/binutils Genode ships; version locked to the targeted Sculpt release |
| **Genode `posix` + `libc` libraries** | **Runtime shape** — FreeBSD-derived libc; enter via `Libc::Component::construct`; VFS is per-component |
| **Goa SDK** | **Likely day-to-day builder** for Sculpt-targeted packages — same toolchain family as the Sculpt version |

**Pinned path for G1:** build the `receipt_core` verify-witness seed with the **Genode toolchain** as a **posix/libc** component (or Goa package equivalent), run it under jailed TCG serial on the existing Sculpt/Genode seat. Do **not** link AGPL Genode into Rye ship binaries — guest artifact only under `tools/.cache/proven-seat/`.

## Fetch recipe (Framework host · next kg)

1. Read https://genode.org/download/tool-chain — choose the prebuilt matching **Sculpt 26.04** / Goa’s expected toolchain (do not guess a tarball stamp until the page names it).
2. Unpack under `tools/.cache/proven-seat/genode-toolchain/` (gitignored).
3. Optional: clone Genode framework for study only under gratitude/local rules — AGPL; never into `caravan/` or ship trees.
4. Re-run `tools/proven_seat_g1_crossing_probe.rish` then grow `tools/proven_seat_g1.rish` until one serial GREEN.

## Witness

`rishi/bin/rishi run tools/proven_seat_g1_crossing_probe.rish`

---

*May the path be named before the binary claims the seat.*
