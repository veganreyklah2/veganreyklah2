# 995 · Open Threads — The System Takes Shape

*A living snapshot of what has landed, what is closed, and what remains open. Updated at `044012`: Tablecloth prompt ladder unified and pruned; main track returns to Rye, Rishi, and strengthening.*

**Language:** EN
**Version:** `20260620.044012` (Rye chronological stamp)
**Last updated:** 2026-06-20
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Voice:** Reya 2

---

## What Just Landed (this session)

- **Tablecloth vocabulary (`043212`).** Store module renamed from the retired name; **silo** / **siloed** names the clean-room discipline only.
- **Tablecloth prompt ladder (`10018`–`10022`).** Five rungs from `043712`–`044112`: index, Brix split, build flow, value model, v1 seed frame.
- **Prompt history pruned (`044012`).** `10010` removed; `10005` renamed to `silo_the_surface`; expanding-prompts carry **Tablecloth** only for the store.

## Threads Now Closed

- **Crypto foundation** — AEAD, SHA3-512, Ed25519, X25519. Parity-green, hosted and freestanding.
- **Sealed datagram** — `posted.rye`: two harts, shared-memory mailbox.
- **`parity.rish`** — the gate in our own shell, GREEN and RED.
- **Rishi arithmetic + stdout** — `+`/`-`/`*`/`/`, correct precedence, `say`.
- **Tally seed** — one Region, 13 invariants.
- **Tally v1 named gardens** — `Gardens`, blob/diff/frame, 15/15 GREEN.
- **Strengthening 9994–9988** — SHA3-256, mem diff, fs boundary, Dir.iterate, allocPrint/trimEnd. Corpus 16.
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

## Threads Still Open

**Discipline (from `10017`):** **⅔ implementation · ⅓ design** — build catches the active-designing map.

**Main track — Rye · Rishi · strengthening (now):**

| Priority | Thread | Anchor |
|----------|--------|--------|
| 1 | **Skate text grid** — monospace glyphs on `wayland_seed` | `980`, `981`, `10017` Track B |
| 2 | **Strengthening series** — next `std` surface through gate trio | `998`, corpus 16 |
| 3 | **Rishi** — builtins as gates and Pond policy need them | `10017` |
| 4 | **TAME assertion backlog** — fix as code is touched | audit list |

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

## The Through-Line

One value model, all the way down. The main work now is **Rye** growing surely, **Rishi** scripting the gates, and **strengthening** earning each `std` surface before the next layer composes. Tablecloth's ladder waits documented on the side — store prose unified, v1 seed named, code deferred until the track is green again.

---

*May the threads stay visible while they are open, and be tied off honestly when they close.*
