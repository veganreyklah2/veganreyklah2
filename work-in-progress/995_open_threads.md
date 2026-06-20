# 995 · Open Threads — The System Takes Shape

*A living snapshot of what has landed, what is closed, and what remains open. Updated at `145612`: parity runs `rye run` on `.rye` corpus; `.rye`/`.zig` discipline recorded.*

**Language:** EN
**Version:** `20260620.145612` (Rye chronological stamp)
**Last updated:** 2026-06-20
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Voice:** Reya 2

---

## What Just Landed (this session)

- **Parity via `rye run` (`145612`).** `tools/parity.rish` and `parity-selftest.rish` run corpus `.rye` files through `rye run`; baseline arm sets `RYE_LIB` to pinned vendor std. No more `parity-work` `.zig` copies.
- **`.rye` vs `.zig` discipline (`145312`–`145612`).** Documented in *Ongoing — Rye vocabulary* below: we author `.rye`; we strengthen `rye/lib/std/*.zig` until Rye owns the import graph.
- **Strengthening pass 9983 (`144812`).** `std.fs.path.join` buffer postcondition + `maybe` for empty components; corpus 21/21 GREEN.
- **Rishi `join` (`144412`).** List-to-string compose builtin.
- **Strengthening pass 9984 (`144112`).** `readFileAlloc` limit postcondition; pairs with 9985 write path.
- **Strengthening pass 9985 (`143912`).** `writeStreamingAll` postcondition.
- **Rishi `ends-with` (`143612`).** String suffix builtin; `rishi/tests/ends_with.rish` green.
- **Strengthening pass 9987 (`050912`).** `Allocator.alloc` postcondition; Skate modules migrated from `.zig` to `.rye`; corpus 17/17 GREEN.
- **Tablecloth vocabulary (`043212`).** Store module renamed from the retired name; **silo** / **siloed** names the clean-room discipline only.
- **Tablecloth prompt ladder (`10018`–`10022`).** Five rungs from `043712`–`044112`: index, Brix split, build flow, value model, v1 seed frame.
- **Prompt numbering (`044412`).** `10010_reserved.md` holds the number open; **`10023`** carries the main-track build order (Skate → strengthening → Rishi).

## Threads Now Closed

- **Crypto foundation** — AEAD, SHA3-512, Ed25519, X25519. Parity-green, hosted and freestanding.
- **Sealed datagram** — `posted.rye`: two harts, shared-memory mailbox.
- **`parity.rish`** — the gate in our own shell, GREEN and RED.
- **Rishi arithmetic + stdout** — `+`/`-`/`*`/`/`, correct precedence, `say`.
- **Tally seed** — one Region, 13 invariants.
- **Tally v1 named gardens** — `Gardens`, blob/diff/frame, 15/15 GREEN.
- **Strengthening 9994–9983** — through path.join. Corpus 21.
- **Mantra seed** — weave, LCS diff, SHA3-256 store, init/add/status.
- **Mantra for the repo (seed)** — commit chain, add-all walks `.brix`, log follows chain. 9/9 bricks.
- **`init.garden` (phase 1)** — `std.process.Init.garden` renamed from upstream `arena`.
- **Brix minimum** — `.brix` descriptor, 10 tracked bricks.
- **Rishi file I/O** — `read-file`, `write-file`, `list-dir`.
- **Rishi `lines` + `starts-with`** — string splitting, prefix checking, paren depth fix.
- **Caravan seed** — parent/child restart, 5 assertions.
- **Caravan bounded** — supervision + Tally garden, 10 assertions.
- **Aurora deciding stage** — wake, prove, decide, rest.
- **`additive-gate.rish`** — gate trio complete in Rishi. `.sh` fallbacks removed.
- **`parity-selftest.rish`** — the gate proves RED.
- **Brix + Tablecloth naming** — compose (Brix) vs store (Tablecloth) vs discipline (silo/siloed); prompt ladder `10018`–`10022`.
- **TAME Style spec** — `context/specs/tame-style.md` + Claude rule.
- **GPL compliance** — gitlinks, River not cloned, clean-room boundary.
- **Garden vocabulary sweep** — phase 2: locals, docs, `start.zig`; `ArenaAllocator` stays inherited.
- **Formats, editors, inference research (`970`).**
- **Horizon modules siloed (`978`).** Scribble, Lantern, Lattice, Anvil.
- **Flow of values foundation (`977`).**
- **Seed vocabulary (`976`).**
- **Brushstroke Wayland seed.** Native window, one frame from values.
- **Caravan multi-child (twin seed).** Two supervised children, independent gardens.
- **Caravan chain-loading (`caravan/chain.rye`).**
- **Comlink hosted wire (`comlink/hosted_wire.rye`).**
- **Rishi string builtins (`length`, `trim`, `slice`).** Parity 16/16.
- **Skate text grid.** Monospace 8×8 glyphs on `wayland_seed`; headless `selftest` green.

## Threads Still Open

**Main track — Rye · Rishi · strengthening:** `expanding-prompts/10023_main_track_rye_rishi_strengthening.md` (`044412`). Run this for the current build order; `10010` is a reserved stub only.

| Priority | Thread | Anchor |
|----------|--------|--------|
| 1 | **Strengthening series** — next `std` surface through gate trio | `10023` Track B, `998` |
| 2 | **Rishi** — builtins as gates and Pond policy need them (`join` done) | `10023` Track C |
| 3 | **TAME assertion backlog** — fix as code is touched | audit list |

**Near — build (after main track holds green):**

- **Device wire (virtio-net)** — sealed datagram over emulated link (`10016`).
- **Caravan capability table** — small Rye struct per child (`984` step 5).

**Documented — Tablecloth (deferred code, ladder ready):**

- **`10018`–`10022`** — vocabulary, Brix split, build contract, value model, v1 seed spec.
- **Tablecloth v1** — grow from `.mantra/blobs/` when Rye/Rishi/strengthening stay on track (`10022`, `996` Horizon 2). Prose and prompts are unified; implementation waits.

**Near — study:**

- **Display-layer study** — Wayland specs for Brushstroke; Ghostty (MIT) for Skate.
- **Close reading** — packet format, commit rule, relay protocols from `gratitude/`.
- **TAME editor design** — select-then-act, Brix settings, Rishi behavior (`971`, `980`).
- **JSON unified with Brix** — one value grammar (`970`, `978`).
- **Comlink remoting** — value-based state sync (`971`).

**Horizon 2:**

- **Pond GUI** — Rishi REPL + Mantra in a Brushstroke window (`10009`, `986`).
- **The Forge** — Mantra-native forge (`982`).
- **Brix v1** — lawful combinator over brick descriptors (`10019`, `10020`).

**Horizon — inference & tensors** *(see `978`):* Lantern, Lattice, Anvil.

**Ongoing — design:**

- **`pond.rish`** — enclosure as a value.
- **Owner-key PKI** — rotation, revocation, recovery.
- **Verify-flag hot path** — data-plane postconditions.

**Ongoing — Rye vocabulary (`.rye` vs `.zig`):**

| Layer | Extension | Role |
|-------|-----------|------|
| **Our programs** | `.rye` | Rishi, seeds, Skate, corpus tests — what we author |
| **Our std** | `.zig` under `rye/lib/std` | Strengthened surfaces the compiler reads via `--zig-lib-dir` |
| **Ephemeral bridge** | adjacent `.zig` | `rye run` / `rye build` only; deleted after compile |

Skate briefly used `.zig` modules; migrated at `050912` with recursive `.rye` import bridging. **Whole std as `.rye`** is a horizon move — the lib tree is the backend layout today.

**Parity contract (`145612`):**

- **Compare:** baseline `vendor/zig-toolchain/lib` vs strengthened `rye/lib` — same test, same pinned Zig (`RYE_ZIG`).
- **Invoke:** `rye run rye/tests/<name>.rye` on both arms (`RYE_LIB` for baseline); exercises the real bridge path.
- **Hold:** exit code + stdout/stderr identical — assertions change what code *says*, never what it *does*.
- **Horizon:** strengthened std modules as `.rye` when Rye controls imports without bridging the full lib tree.

## The Through-Line

One value model, all the way down. The main work now is **Rye** growing surely, **Rishi** scripting the gates, and **strengthening** earning each `std` surface before the next layer composes. Tablecloth's ladder waits documented on the side — store prose unified, v1 seed named, code deferred until the track is green again.

---

*May the threads stay visible while they are open, and be tied off honestly when they close.*
