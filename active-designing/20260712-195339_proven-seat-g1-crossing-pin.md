# Proven-seat G1 — crossing pin (named path)

*Spike answer for Claude’s honest first question: which build path crosses a Rye receipt seed onto Genode’s POSIX-compatible runtime?*

**Stamp:** `20260712.195339`
**Last updated:** `20260712.203900` — G1 jailed TCG serial GREEN
**Language:** EN
**Style:** Radiant
**Voice:** Rio 3
**Status:** Checkable — **G1 serial GREEN** · digest-grade fixture · posix guest · KERNEL=nova TCG
**Ground:** Claude counsel [`20260712-195155_proven-seat-g1-claude-opening-counsel.md`](20260712-195155_proven-seat-g1-claude-opening-counsel.md) · three asks [`20260712-201200_proven-seat-g1-claude-three-asks.md`](20260712-201200_proven-seat-g1-claude-three-asks.md) · sources revise [`20260712-201802_proven-seat-g1-claude-sources-codeberg-26.05.md`](20260712-201802_proven-seat-g1-claude-sources-codeberg-26.05.md) · Sculpt **26.04** G0 ground

---

## META trio (Claude `201802` revise)

| Pin | Value |
|-----|-------|
| **toolchain** | **25.05** (ubuntu-24.04 · `genode-x86-g++` GCC 14.2.0) |
| **sources** | **26.05** @ `492a51024217fe74ccee1ebdfb81be97046b43eb` (Codeberg canonical) |
| **ground** | **Sculpt 26.04** (G0 seat image; G1 boots its own Genode image) |

Drift between rungs is named, not hidden. Recorded in `g1-sources-meta.txt` / refreshed on `g1-toolchain-meta.txt`.

---

## Verdict (bench)

| Candidate | Role |
|-----------|------|
| **Host `vendor/zig-toolchain` + `rye build` alone** | **Refuse as the Genode crossing** — produces a Linux or wasm guest ABI, not Genode’s libc |
| **Genode toolchain** (prebuilt tarball; Goa `install-toolchain`) | **Teacher for compile** — equal-or-next-smaller for 26.x → **25.05** (still pinned in 26.05 `tool/tool_chain`) |
| **Genode source tree** (Codeberg `genodelabs/genode` @ **26.05**) | **Required to link** posix/libc — commit pin is the content address |
| **Genode `posix` + `libc`** | **Runtime shape** — enter via `Libc::Component::construct`; VFS is per-component |
| **Goa SDK** | Same toolchain family; no mismatch on 25.05 |

**Pinned path for G1:** build the smallest honest `receipt_core` verify-witness as a **posix/libc** component with the **25.05** toolchain + **26.05** Codeberg sources, run under jailed TCG serial. Do **not** link AGPL Genode into Rye ship binaries — guest artifact only under `tools/.cache/proven-seat/`.

---

## Kg unroll (Claude `201200` · sources forge revise `201802`)

1. ~~**Source fetch witness**~~ — **GREEN** `tools/proven_seat_g1_fetch_sources.rish` · Codeberg shallow-clone **26.05** · HEAD `492a5102…`
2. ~~**`tool/ports/prepare_port libc`**~~ — **GREEN** `tools/proven_seat_g1_prepare_libc.rish` · contrib `libc-d6a3665f…` · host-tools flex/bison/m4 in cache
3. ~~**`create_builddir` for x86_64**~~ — **GREEN** `tools/proven_seat_g1_create_builddir.rish` · `genode-build-x86_64` · `CROSS_DEV_PREFIX` + libports pinned
4. ~~**SLC guest**~~ — **GREEN** `tools/proven_seat_g1_guest/` · posix `main` · digest-grade fixture · installed as `g1-receipt-verify`
5. ~~**Jailed TCG serial**~~ — **GREEN** `tools/proven_seat_g1.rish` · `KERNEL=nova` · serial line matched

Jailed TCG needs no `/dev/kvm`. **Park:** permanent Genode module home until first serial GREEN; then `vendor/` precedent.

---

## Toolchain recipe (Framework host · landed GREEN)

```bash
rishi/bin/rishi run tools/proven_seat_g1_fetch_toolchain.rish
```

Pinned: GitHub release **25.05** Ubuntu 24.04 tarball · sha256 `6cab8e5f…b739` → `tools/.cache/proven-seat/genode-toolchain/`.

## Sources recipe (Codeberg · landed GREEN)

```bash
rishi/bin/rishi run tools/proven_seat_g1_fetch_sources.rish
```

Pinned: `git clone --depth 1 --branch 26.05 https://codeberg.org/genodelabs/genode.git` → assert HEAD `492a51024217fe74ccee1ebdfb81be97046b43eb`. Try `git verify-tag 26.05` (record only). Asserts `VERSION` · `repos/base` · `repos/libports` · `tool/ports/prepare_port`.

## Libc prepare recipe (landed GREEN)

```bash
rishi/bin/rishi run tools/proven_seat_g1_prepare_libc.rish
```

Fetches flex/bison/m4 into `tools/.cache/proven-seat/host-tools/` when missing (no sudo). Runs `prepare_port libc`. Asserts contrib `libc-d6a3665f0d2778ce8928c66302f1694cdc0d8480`.

## Builddir recipe (landed GREEN)

```bash
rishi/bin/rishi run tools/proven_seat_g1_create_builddir.rish
```

Creates `tools/.cache/proven-seat/genode-build-x86_64/`, pins absolute `CROSS_DEV_PREFIX` (`…/bin/genode-x86-`), enables `repos/libports`.

## Guest + serial (landed GREEN)

```bash
rishi/bin/rishi run tools/proven_seat_g1_build_guest.rish
rishi/bin/rishi run tools/proven_seat_g1.rish
```

Guest sources: `tools/proven_seat_g1_guest/` (posix · digest-grade fixture from `receipt_core` / `slcl1_fact.bron`). Serial: `KERNEL=nova BOARD=pc` · expect/m4/bison under `host-tools/`.

---

## Witness

`rishi/bin/rishi run tools/proven_seat_g1_crossing_probe.rish`

---

*May the path be named before the binary claims the seat. May the sources arrive at their true address.*
