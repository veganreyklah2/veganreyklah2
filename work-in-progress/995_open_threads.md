# 995 · Open Threads — After the First Sealed Wire

*A fresh snapshot, taken after the cryptographic foundation became a sealed datagram crossing between two harts, and after the shell grew comparison, assertion, lists, and membership. It carries forward the still-open threads of the networking-and-social turn it grew from, and ties off the ones that now run.*

**Language:** EN
**Version:** `20260619.084412` (Rye chronological stamp)
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

## Threads Now Closed

- **The encrypted-datagram seed — tied off.** "Two harts, two owner keys, one authenticated, content-named datagram, verified in place" was the open thread; it now runs (`posted.rye`). The seed is done; what remains is its next size — a real device.
- **Rishi reached `parity.rish` — tied off.** Comparison, assertion, lists, membership, records, `run`, `map`/`where`, and string interpolation all landed, and the parity gate now runs in Rishi (`../tools/parity.rish`), proven GREEN and RED — the child keeping watch over the parent.
- **The network's name — tied off.** Comlink.

## Threads Still Open

- **Three parallel near threads** (counsel `084412`, `../active-designing/987`, `../expanding-prompts/10007`):
  - **Device wire** — sealed datagram over emulated `virtio-net` between two machines; Comlink's next rung.
  - **Caravan seed** — hosted supervision: one parent that never dies, one child, restart on fall, asserted.
  - **Tally seed** — one bounded region with asserted edges, bump allocate, clear whole, tested.
  - **Close reading** — packet format, commit rule, relay protocols from `gratitude/` clones, before Comlink's format hardens.
- **`pond.rish`, the enclosure as a value.** Records and interpolation now let a sandbox policy be written as a value (`../rishi/examples/pond.rish`); the enclosure it opens still awaits Caravan's isolation and Tally's bounds — the seeds above are the first floor.
- **Aurora's deciding stage.** A relay stage that hands the next a value *it chose* — a real decision, not only a reading (`aurora/`, the roadmap).
- **The owner-key PKI.** Rotation, revocation, and recovery when a key is lost or stolen. The QR key-cards and master-key rotation in `SOURCE.md` are the first thread, not the whole answer.
- **Curation by structure, not by engine.** The smallest honest ranking for the social layer — chronology, explicit follows, a web of trust — that needs no hidden model (`984`).
- **Spam without a central filter.** A web of trust among keys plus Tally-bounded, perhaps Pond-enclosed relays. Untested.
- **Critical reading — promoted to near work.** Close read of cloned sources (Ames packet shape, Mysticeti commit rule, Nostr relay NIPs, supervision in s6/skalibs) — actionable notes for Comlink and Caravan, not bibliography alone (`10007`).
- **The unbuilt modules — seeds first.** Tally, Caravan, Silo, Mantra, and Pond remain designs at full scale; **Caravan seed** and **Tally seed** are now explicit Horizon 1 work so building does not slip behind again.
- **The verify-flag hot path.** `indexOfScalarPos` and other data-plane functions await postconditions compiled in only behind a `verify` flag (`../strengthening-compiler/9996`).

## The Through-Line

One value model, all the way down: a packet (`985`), a post (`984`), a Mantra line, a Silo build, a Rye value — the same kind of thing, signed, named, bounded, owned. The sealed datagram between two harts is that line made real: a value, sealed and named, arriving on the far side as the same value it left as. Each new step tightens the line; each clone tests it against how others actually did it. We keep it simple, we keep it kind, and we grow the whole from the smallest part that already works.

---

*May the threads stay visible while they are open, and be tied off honestly when they close. May we read what we cloned closely, build what we imagined slowly, and keep the network — like the values it carries — small enough to love.*
