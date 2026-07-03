# Lexicon — Module Names and Their Meanings

**Language:** EN
**Last updated:** 2026-07-03 (bench · resin · hash tiers ratified `191312`)
**Style:** Radiant (see `RADIANT_STYLE.md`)

---

Living vocabulary for the Rye OS family. Each name teaches its function. Provenance for the three names given on 2026-06-30 lives in `specs/20260630-004512_module-name-provenance.md`. Module, aspect, and the graduation rule: [`specs/20260702-035018_graduation-rule.md`](specs/20260702-035018_graduation-rule.md).

## Cursor loop — gates and diet

| Term | One line |
|------|----------|
| **Gate** | A precondition owned by someone else or an unlanded event — `(Kaeden …)` tags, a door ruling, a paste, counsel not yet confirmed, a prior rung's green |
| **Ungated diet** | The **named menu** of tasks the autonomous loop may eat **this minute** — every precondition satisfied, owner tag Cursor, no ask/simulate/wait; **not** a foraging license |
| **Smallest-first** | Order within the diet — smallest witness or doc wins the next round |
| **Witness-first, red-then-green** | Method within the diet — witness or gate before prose; fail loudly, then land green in the same sitting |
| **Empty plate** | When the ungated diet runs out — **stop and summarize**; an empty plate is a question for Kaeden, never a license to forage |
| **Ring** | An SLC-sized whole at a named scope — the smallest loop that closes fully within its bounds; grows from the working seed beneath it — [`external-research/20260703-033602_first-ring-goes-green.md`](../external-research/20260703-033602_first-ring-goes-green.md) |
| **Green** | A witness ran, assertions held, exit zero — machine fact on metal, not mood |
| **Season** | A bounded interval with a named opening, a stated budget, and a clean close that returns everything it held — Tally's discipline applied to time; Amber's unit of custody — [`active-designing/20260703-071212_amber-seasons.md`](../active-designing/20260703-071212_amber-seasons.md) |
| **Bench** | Where claims become evidence — metal raised by recipe, a named sitter for a season, and the discipline that pins what the bench reports, never prediction — [`active-designing/20260703-140212_the-bench.md`](../active-designing/20260703-140212_the-bench.md) |

**Examples (gated):** Edit 5 wire (Door 3) · Amber rungs (Doors 1–3) · studies 19–20 (Kaeden paste) · RW-1 implementation (SLC-2b metal).

**Examples (ungated, when on the menu):** Rishi builtin ladder one-per-round · semver sweep · manual reference pages (witnessed behavior only) · tutorial rooms · RW-2 contract on paper · bare-print as-you-touch.

Full loop bounds: [`work-in-progress/20260702-ready-to-ask-claude.md`](../work-in-progress/20260702-ready-to-ask-claude.md).

## Pattern — module and aspect

| Term | One line |
|------|----------|
| **Module** | A named home — its own directory, invariants, budgets, witnesses |
| **Aspect** | A named capability inside a module's boundary, sharing the host's budget, owning no directory of its own |
| **Graduation** | An aspect becomes a module when its **second consumer** arrives from outside its host |

## Core stack

| Name | One line |
|------|----------|
| **Aurora** | The boot — dawn on open hardware |
| **Tally** | Memory in bounded gardens |
| **Caravan** | Supervision and capabilities |
| **Weave** | The append-only DAG of immutable signed facts — substrate beneath Mantra and Comlink; **aspect of Mantra** today at `mantra/src/weave.rye` |
| **Mantra** | Version-control projection over Weave |
| **Comlink** | Transport of sealed facts over Weave |
| **Brushstroke** | The drawn surface — values to pixels, immediate-mode |
| **Skate** | Text grid → pixel buffer (aspect of Brushstroke today) |
| **Maitreya** | Media driver — **time** for audio and video: decode, sync, bounded buffers; Brushstroke owns space; Lotus authors above; Realidream and Linengrow play through one seam; codecs as royalty-free host seams |
| **Lotus** | Our digital audio workstation — hot-loop studio above Maitreya; horizon after SLC-2 |
| **Uddhava** | Spatial driver — real-time 3D, CAD, and scene graph (horizon; Unity-shaped role in our vocabulary) |
| **Pond** | The bounded enclosure for an agent — packaging's runtime target under policy |
| **Rishi** | The shell — the faithful hand |
| **Rye** | The language and value model |
| **Brix** | What a system is made of — lawful composition |
| **Tablecloth** | Application data store (horizon — role still shaping) |
| **Bron** | Data notation between modules (`.bron`) |
| **Amber** | Preservation — signed, encrypted, bit-faithful archives on deep storage, recorded in an append-only log and verified by folding; Mantra holds the living history, Amber seals the moment cold |

## Archive and digest *(ratified `20260703.191312`)*

| Term | One line |
|------|----------|
| **Resin** | One content-addressed unit Amber seals — the stored bytes at a SHA3 name; the manifest catalogs, the digest proves; [`specs/20260703-191112_resins-and-hash-tiers.md`](specs/20260703-191112_resins-and-hash-tiers.md) |
| **SHA3-512 tier** | Canonical forever-names — weave states, sealed content identity, promises that must mean one thing for the life of the work |
| **SHA3-256 tier** | Working-store names — resins, blob files, manifest entries where path size and external oracles matter |

## Named tonight (`2026-06-30`)

| Name | One line | Provenance gloss |
|------|----------|------------------|
| **Dexter** | Input — keyboard and pointer events into the fold, on both display backends | Dexterity, the skillful acting hand; an echo of one who texts; family memory after a grandfather's enterprise (Zendex, Robert Sealy Livermore) |
| **Kumara** | Identity — the keypair that signs a fact before it enters Weave | The eternal, ever-pure sage-children of the Bhagavata, Sanat-kumara among them |
| **Bookie** | The borrow discipline — who may change a value and who may only witness it | A turf accountant keeping the ledger straight; watches ownership, not value shape |

## Open (named, not yet shaped)

| Name | Status |
|------|--------|
| **MALA** | Named (`2026-07-02`) — mailable money: issuer-signed token facts on the log, balance as a fold; ladder M0–M4 in [`active-designing/20260702-031312_modules-aspects-and-mailable-money.md`](../active-designing/20260702-031312_modules-aspects-and-mailable-money.md); first ring after Edit 5 and Amber |
| **WOV** | Named by Kaeden (`2026-07-02`) — the throughput lane: Rye overlay on pinned TigerBeetle (Apache-2.0, whole in gratitude at `59f2b99`); each instance an L2 book anchored to MALA by monarch-signed root facts; one or two monarchs, never three (three is Mycelium's door at M4); exit honesty before any ring; first ring after MALA M2 only — [`external-research/20260702-211312_names-builds-and-the-ledger-map.md`](../external-research/20260702-211312_names-builds-and-the-ledger-map.md) |
| **Mycelium** | Named (`2026-07-02`) — Comlink's ordering aspect for the many-issuer horizon: leaderless agreement on a DAG of signed messages; gated at MALA M4, never before |
| **Puddle** | Named (`2026-07-02`) — VM exploration: sandboxed Rye OS containers with own Pond and Kumara; Amber state-as-snapshot; [`external-research/20260702-035018_puddle-sandboxed-rye-containers.md`](../external-research/20260702-035018_puddle-sandboxed-rye-containers.md) |
| **Bron** | Proposed — composing companion beside Brix; role open for Kaeden |
| **Tablecloth** | Named — layout or structured-view layer; horizon |
| **`.brush`** | Surface-description extension when Brushstroke earns a small language |

---

*May each name carry its idea. May the lexicon grow only when a name earns its place.*
