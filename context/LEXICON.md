# Lexicon — Module Names and Their Meanings

**Language:** EN
**Last updated:** 2026-07-04 (preservation pair — cellar · vessel)
**Style:** Radiant (see `RADIANT_STYLE.md`)

---

Living vocabulary for the Rye OS family. Each name teaches its function. Provenance for the three names given on 2026-06-30 lives in `specs/20260630-004512_module-name-provenance.md`. Module, aspect, and the graduation rule: [`specs/20260702-035018_graduation-rule.md`](specs/20260702-035018_graduation-rule.md).

## Cursor loop — gates and itinerary

| Term | One line |
|------|----------|
| **Gate** | A named precondition on the itinerary that only a ruling, a word, or a landed event opens — gates belong to Kaeden; [`specs/20260704-020800_one-word-one-gate.md`](specs/20260704-020800_one-word-one-gate.md) |
| **Witness** | A program that proves a claim on metal and answers green or red — the trio (`parity.rish`, `parity-selftest.rish`, `additive-gate.rish`) guards every push |
| **Claim** | A bounded, falsifiable proposition one witness binds — lap, seam, or invariant; [`external-research/20260704-024900_claim.md`](../external-research/20260704-024900_claim.md) |
| **Toll** | The price of shared order — facts touching the commons pay it; everything else is spared; [`active-designing/20260703-200712_what-needs-ordering.md`](../active-designing/20260703-200712_what-needs-ordering.md) |
| **Itinerary** | The **named list of stops** the autonomous loop may execute **this minute** — every precondition satisfied, owner tag Cursor, no ask/simulate/wait; never an off-route license — [`specs/20260704-030300_itinerary-retires-diet.md`](specs/20260704-030300_itinerary-retires-diet.md) · primer [`external-research/20260704-030600_itinerary-and-the-crossing-manifest.md`](../external-research/20260704-030600_itinerary-and-the-crossing-manifest.md) |
| **Open itinerary** | Synonym for the itinerary when every gate is cleared **now** — what older logs called *ungated diet* |
| **Stop** | One item on the itinerary — a witness, a wire, a doc season; replaces *menu item* in prompt prose |
| **Smallest-first** | Order within the itinerary — the nearest, smallest stop wins the next leg |
| **Witness-first, red-then-green** | Method within the itinerary — prove on metal before prose; fail loudly, then land green in the same sitting |
| **Journey's pause** | When the itinerary has **no further stops** — stop and summarize; a pause is a question for Kaeden, never permission to go off-route |
| **Off-route** | Work not on the itinerary — the agent names it and waits; replaces *foraging* |
| **Lap** | An SLC-sized whole at a named scope — the smallest loop that closes fully within its bounds; grows from the working seed beneath it — [`external-research/20260703-033602_first-lap-goes-green.md`](../external-research/20260703-033602_first-lap-goes-green.md) |
| **Green** | A witness ran, assertions held, exit zero — machine fact on metal, not mood |
| **Season** | A bounded interval with a named opening, a stated budget, and a clean close that returns everything it held — Tally's discipline applied to time; Amber's unit of custody — [`active-designing/20260703-071212_amber-seasons.md`](../active-designing/20260703-071212_amber-seasons.md) |
| **Bench** | Where claims become evidence — metal raised by recipe, a named sitter for a season, and the discipline that pins what the bench reports, never prediction — [`active-designing/20260703-140212_the-bench.md`](../active-designing/20260703-140212_the-bench.md) |

**Retired forward-facing (accrete-never-break in old logs):** *diet*, *menu*, *empty plate*, *ungated diet*, *ring*, *thin ring*, *appetite* (ordering sense) — still readable in session history and frozen witness basenames; new prose uses **itinerary** · **stops** · **journey's pause** · **lap** · **thin edge** · **toll**.

**Examples (gated):** Edit 5 wire (Door 3) · Amber rungs (Doors 1–3) · studies 19–20 (Kaeden paste) · RW-1 implementation (SLC-2b metal).

**Examples (on the open itinerary):** Rishi builtin ladder one-per-round · semver sweep · manual reference pages (witnessed behavior only) · tutorial rooms · RW-2 contract on paper · bare-print as-you-touch.

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
| **Bron** | Data notation between modules (`.bron`); a Tilak in the proposed Bron-as-mark design |
| **Amber** | **Cellar software** — preservation in place at home: signed, encrypted, bit-faithful **resins** on deep storage, append-only log, verified by folding; Mantra holds the living history, Amber seals the moment cold — [`amber/README.md`](../amber/README.md) · [`specs/20260701-221512_amber-functional-spec.md`](specs/20260701-221512_amber-functional-spec.md)

## Archive and digest *(ratified `20260703.191312`)*

| Term | One line |
|------|----------|
| **Resin** | One content-addressed unit Amber seals — the stored bytes at a SHA3 name; the manifest catalogs, the digest proves; [`specs/20260703-191112_resins-and-hash-tiers.md`](specs/20260703-191112_resins-and-hash-tiers.md) |
| **SHA3-512 tier** | Canonical forever-names — weave states, sealed content identity, promises that must mean one thing for the life of the work |
| **SHA3-256 tier** | Working-store names — resins, blob files, manifest entries where path size and external oracles matter |

## Type-marks and crossing *(ratified `20260703.203712 UDT`)*

| Term | One line |
|------|----------|
| **Tilak** | The type-mark — the worn sign every value wears at a seam; content-addressed in Weave; two hardcoded roots (plain-bytes, manifest); [`active-designing/20260703-202312_the-marked-value.md`](../active-designing/20260703-202312_the-marked-value.md) |
| **Absorb** | A Tilak's duty — make a value of this type from another type, honestly |
| **Express** | A Tilak's duty — render this type as another (prose, text, lines) |
| **Tend** | A Tilak's duty — care for this type's history in its own grain (diff, patch, merge) |
| **Pottery** | The value-object tier — linear resources thrown while owned, fired when sealed; `.pott` the working extension; greenware · kiln · glaze name the aspect family; horizon until measured demand |
| **Amphora** | **Vessel software** — preservation in motion across a crossing: the sealed traveling container (manifest, stamp, parent mark, shoulder line); the cellar's sibling — [`external-research/20260703-201612_the-amphora-and-the-crossing.md`](../external-research/20260703-201612_the-amphora-and-the-crossing.md) · silo [`active-designing/20260703-201612_the-sealed-crossing.md`](../active-designing/20260703-201612_the-sealed-crossing.md)

## Preservation pair — cellar and vessel

| Term | One line |
|------|----------|
| **Cellar software** | Amber's duty — seal **resins** in place at home; the archive that stays on the dock |
| **Vessel software** | Amphora's duty — carry many sealed things across wire, dock, or pocket; leaves the cellar, returns to it |
| **The pair** | One preserves in place, the other preserves in motion; same resins law, same Kumara stamp; Comlink is the sea between docks |

## Named tonight (`2026-06-30`)

| Name | One line | Provenance gloss |
|------|----------|------------------|
| **Dexter** | Input — keyboard and pointer events into the fold, on both display backends | Dexterity, the skillful acting hand; an echo of one who texts; family memory after a grandfather's enterprise (Zendex, Robert Sealy Livermore) |
| **Kumara** | Identity — the keypair that signs a fact before it enters Weave | The eternal, ever-pure sage-children of the Bhagavata, Sanat-kumara among them |
| **Bookie** | The borrow discipline — who may change a value and who may only witness it | A turf accountant keeping the ledger straight; watches ownership, not value shape |

## Open (named, not yet shaped)

| Name | Status |
|------|--------|
| **MALA** | Named (`2026-07-02`) — mailable money: issuer-signed token facts on the log, balance as a fold; ladder M0–M4 in [`active-designing/20260702-031312_modules-aspects-and-mailable-money.md`](../active-designing/20260702-031312_modules-aspects-and-mailable-money.md); first lap after Edit 5 and Amber |
| **WOV** | Named by Kaeden (`2026-07-02`) — the throughput lane: Rye overlay on pinned TigerBeetle (Apache-2.0, whole in gratitude at `59f2b99`); each instance an L2 book anchored to MALA by monarch-signed root facts; one or two monarchs, never three (three is Mycelium's door at M4); exit honesty before any lap; first lap after MALA M2 only — [`external-research/20260702-211312_names-builds-and-the-ledger-map.md`](../external-research/20260702-211312_names-builds-and-the-ledger-map.md) |
| **Mycelium** | Named (`2026-07-02`) — Comlink's ordering aspect for the many-issuer horizon: leaderless agreement on a DAG of signed messages; gated at MALA M4, never before |
| **Puddle** | Named (`2026-07-02`) — VM exploration: sandboxed Rye OS containers with own Pond and Kumara; Amber state-as-snapshot; [`external-research/20260702-035018_puddle-sandboxed-rye-containers.md`](../external-research/20260702-035018_puddle-sandboxed-rye-containers.md) |
| **Tablecloth** | Named — layout or structured-view layer; horizon |
| **`.brush`** | Surface-description extension when Brushstroke earns a small language |

---

*May each name carry its idea. May the lexicon grow only when a name earns its place.*
