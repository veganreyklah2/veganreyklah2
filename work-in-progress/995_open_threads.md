# 995 · Open Threads — After Arithmetic, Tally Seed, and the Living Desktop Arc

*A fresh snapshot, taken after Rishi gained arithmetic and a real stdout, after Tally's first seed ran with 13 asserted invariants, and after a new design arc opened the path to a native Pond GUI on x86_64 AMD. It carries forward the still-open threads from the sealed-wire and shell-gate turns, ties off what now runs, and names the new threads that opened today.*

**Language:** EN
**Version:** `20260619.170712` (Rye chronological stamp)
**Last updated:** 2026-06-19
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Voice:** Reya 2

---

## What Just Landed

- **The crypto foundation, whole.** The authenticated seal (AEAD: ChaCha20-Poly1305) joined the content hash (SHA3-512), signing (Ed25519), and key agreement (X25519) — every primitive in Rye's own std, parity-green, hosted and freestanding alike.
- **A sealed message on the bare hart.** `aurora/src/sealed.rye` composes all four primitives freestanding: Alice seals to Bob, Bob verifies and opens, with no OS beneath. The content-name matches the hosted test byte-for-byte.
- **A sealed datagram across the wire between two harts.** `aurora/src/wire.rye` proves the smallest wire — two harts, a shared-memory mailbox, a memory fence — and `posted.rye` carries a whole sealed datagram across it: hart 0 seals, hart 1 shape-casts the raw bytes and opens, trusting only its own secret and what arrived.
- **The network module is named.** Comlink — the keeper's choice from Setu, Doota, Akasha, and Comlink (`../external-research/981`).
- **The shell grew toward a gate.** Rishi gained `==`/`!=`, `assert` (with an optional `else`), list values, and `contains` — each with a passing test and a failing one (`../rishi/tests/checks.rish`, `lists.rish`).
- **The gate trio is portable, and the corpus is eight.** All green, runnable anywhere in plain POSIX shell.
- **`parity.rish` runs in our own shell.** Records, `run`, `map`/`where`, and string interpolation composed into the full differential-parity gate — proven GREEN and RED (`../tools/parity.rish`).
- **Rishi gained arithmetic and a real stdout.** Integer `+`/`-`/`×`/`÷` with correct operator precedence, parenthesized grouping, `say` rebound to stdout. Nine arithmetic assertions in `rishi/tests/arithmetic.rish`, all green.
- **Tally seed runs.** One `Region` struct over a caller-provided backing slice; bump allocate, clear whole, 13 hosted `debug.assert` calls, all green (`tally/seed.rye`). The first bounded garden in Rye.
- **Dual-editor setup committed.** `CLAUDE.md`, `.claude/rules/`, and `tools/` example files in place; Zed and Claude Code share one project with thin editor-specific rule files pointing to `context/`.
- **A new design arc in four documents.** `977` (POSIX at the door — TAME-compatible, not TAME-native), `978` (the living desktop stack — Pond as native desktop framework, Brushstroke as its display surface), `985` (native system interface, quarantined clean room), `986` (the living desktop, quarantined clean room). Ordered plan `10009` names the eight implementation steps.

## Threads Now Closed

- **The encrypted-datagram seed — tied off.** "Two harts, two owner keys, one authenticated, content-named datagram, verified in place" was the open thread; it now runs (`posted.rye`). The seed is done; what remains is its next size — a real device.
- **Rishi reached `parity.rish` — tied off.** Comparison, assertion, lists, membership, records, `run`, `map`/`where`, and string interpolation all landed, and the parity gate now runs in Rishi (`../tools/parity.rish`), proven GREEN and RED — the child keeping watch over the parent.
- **The network's name — tied off.** Comlink.
- **Tally seed — tied off.** One bounded `Region`, bump allocate, clear whole, 13 asserted invariants, all green. The seed runs; Tally v1 awaits.

## Threads Still Open

- **Two parallel near threads** (plus close reading):
  - **Device wire** — sealed datagram over emulated `virtio-net` between two machines; Comlink's next rung.
  - **Caravan seed** — hosted supervision: one parent that never dies, one child, restart on fall, asserted.
  - **Close reading** — packet format, commit rule, relay protocols from `gratitude/` clones, before Comlink's format hardens.
- **Four strengthening passes** — the floor Mantra's seed needs: SHA3-256 (9994), mem diff primitives (9993), `std.fs` boundary assertions (9992), `Dir.iterate` (9991). Each through the gate trio.
- **River and Ghostty into `gratitude/`** — clone both display-layer references before Brushstroke's native backend hardens (`../active-designing/985`). Requires manual `git clone` into `gratitude/river` and `gratitude/ghostty`.
- **Rishi file I/O builtins** — `open`, `read`, `write`, `close` behind OS-boundary wrappers. Both Mantra and Brushstroke need file access from the shell.
- **Mantra seed** — the smallest weave: two buffers in, one always-succeeding merge out, content-named by SHA3-256. Depends on the four strengthening passes.
- **Brushstroke seed** — one native x86_64 window, one static frame, libghostty thin costume for the text area (`../active-designing/985`, `../active-designing/986`). Depends on River and Ghostty in `gratitude/`.
- **Pond GUI on x86_64 AMD** — the Horizon 2 milestone: a Rishi REPL + live Mantra version control of `~/veganreyklah2` in a native Brushstroke window (`../expanding-prompts/10009`, `../active-designing/986`).
- **Caravan kernel design — microkernel vs monolith** — open question: is a seL4/Redox-style microkernel design safer and worth the performance cost, or can a TAME monolith achieve the same safety at higher speed? (`../external-research/976`, forthcoming).
- **`pond.rish`, the enclosure as a value.** Records and interpolation now let a sandbox policy be written as a value; the enclosure it opens still awaits Caravan's isolation and Tally's bounds.
- **Aurora's deciding stage.** A relay stage that hands the next a value *it chose* — a real decision, not only a reading (`aurora/`, the roadmap).
- **The owner-key PKI.** Rotation, revocation, and recovery when a key is lost or stolen. The QR key-cards and master-key rotation in `SOURCE.md` are the first thread, not the whole answer.
- **Curation by structure, not by engine.** The smallest honest ranking for the social layer — chronology, explicit follows, a web of trust — that needs no hidden model (`984`).
- **Spam without a central filter.** A web of trust among keys plus Tally-bounded, perhaps Pond-enclosed relays. Untested.
- **The unbuilt modules — seeds first.** Silo and Mantra remain designs at full scale; Mantra seed is now explicit Horizon 1 work. Caravan seed is in progress alongside the device wire.
- **The verify-flag hot path.** `indexOfScalarPos` and other data-plane functions await postconditions compiled in only behind a `verify` flag (`../strengthening-compiler/9996`).

## The Through-Line

One value model, all the way down: a packet, a post, a Mantra line, a Silo build, a Rye value — the same kind of thing, signed, named, bounded, owned. The sealed datagram between two harts is that line made real: a value, sealed and named, arriving on the far side as the same value it left as. The Pond GUI goal holds the same line at a higher level: a Rishi command, a Mantra weave, a Brushstroke pixel — still the same value, still bounded, still proven at every edge. Each new step tightens the line; each clone tests it against how others actually did it. We keep it simple, we keep it kind, and we grow the whole from the smallest part that already works.

---

*May the threads stay visible while they are open, and be tied off honestly when they close. May we read what we cloned closely, build what we imagined slowly, and keep the network — like the values it carries — small enough to love.*
