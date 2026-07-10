# Lexicon — Module Names and Their Meanings

**Language:** EN
**Last updated:** 2026-07-10 (Kitchen twin seated `173752`; Granary settle view `173353`; Amphora plainly; Season · Lap · Green · Metalsmoke)
**Style:** Radiant (see `RADIANT_STYLE.md`)

---

Living vocabulary for the Rye OS family. Each name teaches its function. Provenance for the three names given on 2026-06-30 lives in `specs/20260630-004512_module-name-provenance.md`. Module, aspect, and the graduation rule: [`specs/20260702-035018_graduation-rule.md`](specs/20260702-035018_graduation-rule.md).

## Cursor loop — gates and itinerary

| Term | One line |
|------|----------|
| **Gate** | A named precondition on the itinerary that only a ruling, a word, or a landed event opens — gates belong to Kaeden; [`specs/20260704-020800_one-word-one-gate.md`](specs/20260704-020800_one-word-one-gate.md) |
| **Witness** | A program that proves a claim on metal and answers green or red — the trio (`parity.rish`, `parity-selftest.rish`, `additive-gate.rish`) guards every push |
| **Claim** | A bounded, falsifiable proposition one witness binds — lap, seam, or invariant; [`external-research/20260704-024900_claim.md`](../external-research/20260704-024900_claim.md) |
| **Two rooms** | Every sentence is checkable or visionary, and says which at the door — [`TWO_ROOMS.md`](TWO_ROOMS.md) · seated `20260705.203144` |
| **Canonical** | The single authoritative place or form the tree cites — [`specs/20260705-203144_canonical-glosses.md`](specs/20260705-203144_canonical-glosses.md) |
| **Toll** | The price of shared order — facts touching the commons pay it; everything else is spared; [`active-designing/20260703-200712_what-needs-ordering.md`](../active-designing/20260703-200712_what-needs-ordering.md) |
| **Itinerary** | The **named list of stops** the autonomous loop may execute **this minute** — every precondition satisfied, owner tag Cursor, no ask/simulate/wait; never an off-route license — [`specs/20260704-030300_itinerary-retires-diet.md`](specs/20260704-030300_itinerary-retires-diet.md) · primer [`external-research/20260704-030600_itinerary-and-the-crossing-manifest.md`](../external-research/20260704-030600_itinerary-and-the-crossing-manifest.md) |
| **Open itinerary** | Synonym for the itinerary when every gate is cleared **now** — what older logs called *ungated diet* |
| **Stop** | One item on the itinerary — a witness, a wire, a doc season; replaces *menu item* in prompt prose |
| **Smallest-first** | Order within the itinerary — the nearest, smallest stop wins the next leg |
| **Witness-first, red-then-green** | Method within the itinerary — prove on metal before prose; fail loudly, then land green in the same sitting |
| **Journey's pause** | When the itinerary has **no further stops** — stop and summarize; a pause is a question for Kaeden, never permission to go off-route |
| **Off-route** | Work not on the itinerary — the agent names it and waits; replaces *foraging* |
| **Lap** | An SLC-sized whole at a named scope — the smallest loop that closes fully within its bounds; grows from the working seed beneath it — [`external-research/20260703-033602_first-lap-goes-green.md`](../external-research/20260703-033602_first-lap-goes-green.md) · plainly [`../external-research/20260710-002544_first-lap-goes-green-plainly.md`](../external-research/20260710-002544_first-lap-goes-green-plainly.md) |
| **Green** | A witness ran, assertions held, exit zero — machine fact on metal, not mood — plainly [`../external-research/20260710-002544_first-lap-goes-green-plainly.md`](../external-research/20260710-002544_first-lap-goes-green-plainly.md) |
| **Metalsmoke** | The thin edge's few honest integrated checks — world alone can answer, smallest slice, witnessed; happy zone stays in parity — [`active-designing/20260703-013412_metalsmoke.md`](../active-designing/20260703-013412_metalsmoke.md) · plainly [`../external-research/20260710-002017_metalsmoke-plainly.md`](../external-research/20260710-002017_metalsmoke-plainly.md) |
| **Season** | A bounded interval with a named opening, a stated budget, and a clean close that returns everything it held — Tally's discipline applied to time; Amber's unit of custody — [`active-designing/20260703-071212_amber-seasons.md`](../active-designing/20260703-071212_amber-seasons.md) · plainly [`../external-research/20260710-002422_amber-seasons-plainly.md`](../external-research/20260710-002422_amber-seasons-plainly.md) |
| **Bench** | Where claims become evidence — metal raised by recipe, a named sitter for a season, and the discipline that pins what the bench reports, never prediction — [`active-designing/20260703-140212_the-bench.md`](../active-designing/20260703-140212_the-bench.md) |
| **Kitchen twin** | A plain-speech companion (`*-plainly.md`) beside a hard canon — table voice for jargon, not a cooking metaphor; the shelf is those plainly notes the rose asserts — hearth [`../foundations/20260702-202612_a-conversation-with-serena.md`](../foundations/20260702-202612_a-conversation-with-serena.md) · example [`../external-research/20260710-171707_granary-mandi-commerce-plainly.md`](../external-research/20260710-171707_granary-mandi-commerce-plainly.md) |

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
| **Weave** | Bolt revision history as append-only accretion in `BoltCatalog` — sovereign snapshot slice is I2 `catalog/` export (Kaeden `030412`); **aspect** at `mantra/src/weave.rye` is diff-tool line history until graduation |
| **Mantra** | Version-control projection over Weave; grows the referential namespace — **recall** and **bolt** seated `20260706.032700` |
| **Comlink** | Transport of sealed facts over Weave |
| **Brushstroke** | The drawn surface — values to pixels, immediate-mode |
| **Skate** | Text grid → pixel buffer (aspect of Brushstroke today) |
| **Maitreya** | Media driver — **time** for audio and video: decode, sync, bounded buffers; Brushstroke owns space; Lotus authors above; Realidream and Linengrow play through one seam; codecs as royalty-free host seams |
| **Lotus** | Our digital audio workstation — hot-loop studio above Maitreya; horizon after SLC-2 |
| **Uddhava** | Spatial driver — real-time 3D, CAD, and scene graph (horizon; Unity-shaped role in our vocabulary) |
| **Pond** | The bounded enclosure for an agent — packaging's runtime target under policy; **customs** first policy lap landed `161125` (place / hold / refuse per Tilak) |
| **Granary** | **Sharing surface** — Mantra global namespace where signed weaves are named, shared, mirrored, and optionally sold (four doors: Identity · Namespace · Sharing · Exchange); name seated `20260710.163043`; four doors through Exchange listing `20260710.165348` (parity **232**–**237**); Sharing device wire `20260710.170132` (parity **239**); Exchange view `20260710.170838` (parity **241**); weave settle `20260710.172625` (parity **243**); settle view `20260710.173353` (parity **245**) — [`specs/20260710-163043_granary-name-seated.md`](specs/20260710-163043_granary-name-seated.md) · settle [`specs/20260710-172625_granary-weave-settle-seated.md`](specs/20260710-172625_granary-weave-settle-seated.md) · [`../granary/README.md`](../granary/README.md) · study [`../external-research/20260703-182612_the-granary-question.md`](../external-research/20260703-182612_the-granary-question.md) |
| **Rishi** | The shell — the faithful hand |
| **Rye** | The language and value model |
| **Brix** | What a system is made of — lawful composition; **bond overrides** carry the infuse pattern (Silo module name retired `174500`) |
| **Tablecloth** | Brix-facing application database and artifact store (horizon — not the namespace query) |
| **Bron** | Immutable values at seams (`.bron` facts, policies, receipts); Brix composes wholes that bind Bron values — affirmed `174500` per [`counsel/20260707-222500`](../counsel/20260707-222500_claude-counsel-bron-beside-brix-first-proposal.md) |
| **Amber** | **Cellar software** — preservation in place at home: signed, encrypted, bit-faithful **resins** on deep storage, append-only log, verified by folding; Mantra holds the living history, Amber seals the moment cold — [`amber/README.md`](../amber/README.md) · [`specs/20260701-221512_amber-functional-spec.md`](specs/20260701-221512_amber-functional-spec.md)

## Archive and digest *(ratified `20260703.191312`)*

| Term | One line |
|------|----------|
| **Resin** | One content-addressed unit Amber seals — the stored bytes at a SHA3 name; the manifest catalogs, the digest proves; [`specs/20260703-191112_resins-and-hash-tiers.md`](specs/20260703-191112_resins-and-hash-tiers.md) |
| **SHA3-512 tier** | Canonical forever-names — weave states, sealed content identity, promises that must mean one thing for the life of the work |
| **SHA3-256 tier** | Working-store names — resins, blob files, manifest entries where path size and external oracles matter |

## Referential namespace *(seated `20260706.032700`)*

| Term | One line |
|------|----------|
| **Recall** | The referentially-transparent read — a name resolves to the same bytes for all time, with honest not-yet / never / here outcomes; [`active-designing/20260706-023912_the-referential-namespace.md`](../active-designing/20260706-023912_the-referential-namespace.md) |
| **Bolt** | A coherent, independently-versioned unit of content with its own history and dependencies — the unit a name selects before a path within it |
| **Tablecloth query** | Optional-field filter over the bounded namespace catalog — every match in held order; parity **175**; hosted Comlink wire **219**; device virtio **246**; query device view **247**; unified view **248**; forge device/unified **249**/**250**; assist lap 2 **251**; Lantern allow-list **252**; Scribble rish **253**; assist sight **254**; forge query unified **255**; forge query device **256**; Lattice reshape **257**; Lantern temp/seed **258**; corpus view **259**; Lattice reduce **260**; Scribble headings **261**; scribble view **262**; assist rye/rish **263**; Lattice scale **264**; corpus prefix **265**; assist sight kinds **266**; exception view **267** (`182502`); not the Brix artifact store (counsel `20260707.005612`) |
| **Name grammar** | `peer / bolt / revision / path` — Kumara identity, bolt, revision (change, date, or label), path within the bolt |

**Retired forward-facing:** **stone** as the content-addressed unit word — use **resin** per [`specs/20260703-191112_resins-and-hash-tiers.md`](specs/20260703-191112_resins-and-hash-tiers.md); forward-doc hygiene landed `20260706.033200`. **Silo** as a Rye OS module name — retired `174500`; configuration composition lives in **Brix bonds**; lowercase **silo** names only the reading technique and astrology lane.

## Type-marks and crossing *(ratified `20260703.203712 UDT`)*

| Term | One line |
|------|----------|
| **Tilak** | The type-mark — the worn sign every value wears at a seam; content-addressed in Weave; two hardcoded roots (plain-bytes, manifest); [`active-designing/20260703-202312_the-marked-value.md`](../active-designing/20260703-202312_the-marked-value.md) |
| **Absorb** | A Tilak's duty — make a value of this type from another type, honestly |
| **Express** | A Tilak's duty — render this type as another (prose, text, lines) |
| **Tend** | A Tilak's duty — care for this type's history in its own grain (diff, patch, merge) |
| **Pottery** | The value-object tier — linear resources thrown while owned, fired when sealed; `.pott` the working extension; greenware · kiln · glaze name the aspect family; horizon until measured demand |
| **Amphora** | **Vessel software** — preservation in motion across a crossing: the sealed traveling container (manifest, stamp, parent mark, shoulder line); laps 1–3 seated `amphora/` (parse · pour/scrub · Comlink hosted + device fetch); forge view folds a live pour — [`amphora/README.md`](../amphora/README.md) · crossing plainly [`../external-research/20260710-145313_amphora-crossing-plainly.md`](../external-research/20260710-145313_amphora-crossing-plainly.md) · study [`../external-research/20260703-201612_the-amphora-and-the-crossing.md`](../external-research/20260703-201612_the-amphora-and-the-crossing.md) · silo [`active-designing/20260703-201612_the-sealed-crossing.md`](../active-designing/20260703-201612_the-sealed-crossing.md) · sealed crossing plainly [`../external-research/20260710-002952_sealed-crossing-plainly.md`](../external-research/20260710-002952_sealed-crossing-plainly.md) |

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
| **Greencandy** | Named (`2026-07-10`) — centralized books of record at `greencandy/`: chart, journal, fold, P&L/BS, exception queue, Skate books view; complements MALA — [`active-designing/20260710-125953_greencandy-hammock.md`](../active-designing/20260710-125953_greencandy-hammock.md) · [`../greencandy/README.md`](../greencandy/README.md) |
| **Lattice** | Named (`2026-07-10`) — f32 tensors in bounded gardens; matmul · add · reshape · reduce_sum · scale at `lattice/` (parity **211**/**217**/**257**/**260**/**264**) — [`../lattice/README.md`](../lattice/README.md) · [`../active-designing/20260710-133500_inference-stack-lap0-hammock.md`](../active-designing/20260710-133500_inference-stack-lap0-hammock.md) |
| **Scribble** | Named (`2026-07-10`) — markdown → block values; rye/rish extract + headings + outline view at `scribble/` (parity **218**/**253**/**261**/**262**) — [`../scribble/README.md`](../scribble/README.md) |
| **Lantern** | Named (`2026-07-10`) — bounded inference request/response; fixture · `max_tokens` · allow-list · temperature/seed at `lantern/` (parity **213**/**252**/**258**) — [`../lantern/README.md`](../lantern/README.md) |
| **Anvil** | Named (`2026-07-10`) — local forge; corpus catalog lap 0 at `anvil/`; LoRA horizon — [`../anvil/README.md`](../anvil/README.md) · horizon [`../external-research/20260710-133500_local-forge-minisforum-inference.md`](../external-research/20260710-133500_local-forge-minisforum-inference.md) |
| **WOV** | Named by Kaeden (`2026-07-02`) — the throughput lane: Rye overlay on pinned TigerBeetle (Apache-2.0, gitlink `59f2b99`, pin **203**, host seam A **204**, dual D1 **205**); each instance an L2 book anchored to MALA by monarch-signed root facts; one or two monarchs, never three (three is Mycelium's door at M4); exit honesty [`specs/20260709-200443_wov-exit-honesty.md`](specs/20260709-200443_wov-exit-honesty.md); lap 1 **201**; seam A [`specs/20260709-204026_wov-tb-client-seam.md`](specs/20260709-204026_wov-tb-client-seam.md); dual D1 [`specs/20260709-224531_wov-dual-monarch.md`](specs/20260709-224531_wov-dual-monarch.md) — [`external-research/20260702-211312_names-builds-and-the-ledger-map.md`](../external-research/20260702-211312_names-builds-and-the-ledger-map.md) |
| **Mycelium** | Named (`2026-07-02`) — Comlink's ordering aspect for the many-issuer horizon: leaderless agreement on a DAG of signed messages; gated at MALA M4, never before |
| **Puddle** | Named (`2026-07-02`) — VM exploration: sandboxed Rye OS containers with own Pond and Kumara; Amber state-as-snapshot; [`external-research/20260702-035018_puddle-sandboxed-rye-containers.md`](../external-research/20260702-035018_puddle-sandboxed-rye-containers.md) |
| **Mandi** | **Vessel market floor** — where harvests and amphorae change hands, priced in MALA; name seated `20260710.165634`; lap 1 vessel listing (parity **238**); floor view `20260710.170700` (parity **240**); listing settle `20260710.171202` (parity **242**); settle view `20260710.172955` (parity **244**); distinct from Granary — [`specs/20260710-165634_mandi-name-seated.md`](specs/20260710-165634_mandi-name-seated.md) · settle [`specs/20260710-171202_mandi-listing-settle-seated.md`](specs/20260710-171202_mandi-listing-settle-seated.md) · [`../mandi/README.md`](../mandi/README.md) · study [`../external-research/20260703-200712_compute-commerce-on-the-network.md`](../external-research/20260703-200712_compute-commerce-on-the-network.md) |
| **`.brush`** | Surface-description extension when Brushstroke earns a small language |

---

*May each name carry its idea. May the lexicon grow only when a name earns its place.*
