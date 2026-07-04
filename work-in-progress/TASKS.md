# Tasks — The Granular Plan

**Language:** EN
**Last updated:** 2026-07-04 (parity **152** pinned Cursor · not-advice · TASKS hygiene)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Voice:** Rio 3
**Lens:** TAME — safety, performance, joy; SLC; Gall's Law

*This is the living, granular plan — the bench where the current laps are shaped. `ROADMAP.md` holds the why and the order; this file holds the what-now. It is **edited in place**: a task is checked when it lands, and the record of how it landed accretes in `../session-logs/`. Checked items are swept to a session log and pruned here when a section grows heavy. What is next lives here; what happened lives there.*

**Legend:** `[ ]` to do · `[~]` in flight · `[x]` done, pending sweep to a session log.

**Tracks:** **Rye OS** grows the system. **Linengrow** grows the first whole built on it. **Ground** is the shared discipline beneath both.

**Landed through 2026-06-30** (detail in `../session-logs/`): SLC-2a Laps 1–2 (`5b3a5a4`); yonder pass nine; Caravan path + Comlink hosted wire (`dc26396`→`8d720c6`); Tally/Brushstroke foundation seeds in parity (**138**); prior: SLC-1; TAME hardening.

---

## Now — The Three Doors, Then the Ladder

### The three doors (Kaeden, in order)
- [x] **Door 1 — Pond clause**: affirmed verbatim in [`pond/README.md`](../pond/README.md) (`20260703.012031`, commit `3320bed`).
- [x] **Door 2 — Lap 3 metal close** (Kaeden, on GNOME Wayland):
  - [x] `rishi/bin/rishi run tools/fixtures/pond_metal_close_preflight.rish` — build + headless witness GREEN (`20260702.195626`; fresh `20260703.012336`; jail `20260703.031212`)
  - [x] `rishi/bin/rishi run tools/slc2a_ring3_metal.rish` — the thin edge answers (`20260702.195626`; fresh `20260703.012336`; jail `20260703.031312`)
  - [x] Live `pond/bin/drawn-terminal`, five confirmations — host GNOME (`20260703.032412`)
  - [x] Lap 3 metal-closed on GNOME, `20260703.032412 UDT` — Kaeden's stamp verbatim
- [x] **Door 3 — Edit 5 ruling**: ***for*** — at most one functional spec in flight until first lap green; witness wired parity **143** (`20260703.032812`).

### The ladder (after the doors, in order — owner tagged)
1. [x] **(Cursor) Fixture twins verified** — both `.rish` fixtures green on host; `.sh` elders retired to [`tools/fixtures/yonder/`](../tools/fixtures/yonder/); [`pond/README.md`](../pond/README.md) points at twins (`20260702.180812`).
2. [x] **(Cursor) Wire Edit 5 → parity 143.** One commit, message `Wire Edit 5 designed-not-built witness — parity 143` (`20260703.032812`):
   - [x] Append the standard quartet at the tail of [`tools/parity.rish`](../tools/parity.rish), after the width-check block: `say` banner → `run ["rishi/bin/rishi" "run" "tools/designed_not_built_witness.rish"]` → `assert .ok else` → `say "GREEN: …"`
   - [x] Full suite green on metal; ROADMAP gate-trio line and this ladder's parity numbers refreshed in the same commit.
3. [x] **(Claude + Kaeden) Amber first lap — the season sitting** — brief: [`20260702-190000_amber-first-lap-claude-brief.md`](20260702-190000_amber-first-lap-claude-brief.md); spec: [`context/specs/20260701-221512_amber-functional-spec.md`](../context/specs/20260701-221512_amber-functional-spec.md). **Landed `20260703.051812` — five rungs, parity **144**:**
   - [x] **(1) Module home:** `amber/` at top level
   - [x] **(2) Fixture tree:** `tools/fixtures/amber_ring1_tree/`
   - [x] **(3) Oracle:** `openssl dgst -sha3-256`; golden `97e0d0cd…d96f` in [`tools/fixtures/amber_ring1_golden.txt`](../tools/fixtures/amber_ring1_golden.txt)
   - [x] **(4) Witness:** [`tools/amber_first_ring.rish`](../tools/amber_first_ring.rish) — welcome + tampered stone fails
   - [x] **(5) Parity 144** wired in same season
4. [x] **(Kaeden) SLC-2b nod → (Cursor) Dexter bench** — prompt: [`20260702-030112_cursor-slc-2b-keyboard-from-window.md`](../expanding-prompts/20260702-030112_cursor-slc-2b-keyboard-from-window.md). **Landed `20260703.132112` — parity **145**:**
   - [x] **Nod (Kaeden):** **`pond/apps/` extension** — counsel's recommended placement (`20260703.131812`); keyboard input grows from Lap 3's poll loop in [`pond/apps/drawn_terminal.rye`](../pond/apps/drawn_terminal.rye); Skate stays in `brushstroke/`.
   - [x] **Dexter graduation trigger (recorded):** the **Dexter** name applies to keyboard-from-window as an aspect inside the drawn terminal until a **second external consumer** arrives — a Pond app beyond the terminal, a TAME editor surface, or the sovereign framebuffer backend's input path; then `dexter/` earns its own module home per [`context/specs/20260702-035018_graduation-rule.md`](../context/specs/20260702-035018_graduation-rule.md).
   - [x] **(Cursor) DoD:** Wayland seat + xkbcommon in [`brushstroke/wayland_seed.rye`](../brushstroke/wayland_seed.rye); line editor in [`pond/apps/window_input.rye`](../pond/apps/window_input.rye); live loop + `keyboardtest` witness; [`tools/slc2b_keyboard.rish`](../tools/slc2b_keyboard.rish) in parity **145**
5. [x] **(Cursor) RW-1 mirrored pair** — the Rishi↔Mantra history seam, per the audit ([`20260702-180812_testing-audit-first-pass.md`](20260702-180812_testing-audit-first-pass.md)); contract on paper at [`20260702-200109_rw1-mirrored-pair-contract.md`](20260702-200109_rw1-mirrored-pair-contract.md) (`20260702.200109`); lands while the seam is warm from SLC-2b. Two witnesses, two commits, parity **+2**:
   - [x] `tools/rw1_shell_collab.rish` — the asker's side: the shell against a stub history store; right questions at `:version`/`:history`/`:recall`; every allowed answer handled, one unwelcome answer survived
   - [x] `tools/rw1_history_contract.rish` — the answerer's side: the `.mantra` store honors exactly those questions; every prepared answer demonstrated, welcome and unwelcome mirrored line for line
   - [x] **Landed `20260703.182612 UDT` — parity **147** (`20260703.182612`)
6. [x] **(Cursor) RW-2 mirrored pair** — app↔Brushstroke `setFrame` seam per [`20260702-205630_rw2-mirrored-pair-contract.md`](20260702-205630_rw2-mirrored-pair-contract.md); **landed `20260703.235512 UDT` — parity 150**:**
   - [x] `tools/rw2_app_collab.rish` — drawn-terminal `rw2collabtest`: sessionLines → contentSignature
   - [x] `tools/rw2_surface_contract.rish` — `redrawtest` + `boundstest` on wayland_seed

### Linengrow
- [x] **SLC-L1 scope note** — the hammock spec, one page, these boxes its skeleton ([`../active-designing/20260702-195426_slcl1-verifiable-receipt.md`](../active-designing/20260702-195426_slcl1-verifiable-receipt.md), `20260702.195426`):
  - [x] The **transaction fact**'s fields, exactly (parties by Kumara key, amount, memo, stamp) — a `.bron` value
  - [x] **Sign** with the ed25519 path parity already witnesses; **append** to a plain log file; **receipt = a pure fold** over that log; **verify** = recompute + signature check
  - [x] The **edge of complete**, named: in — one signer, one log, one verifiable receipt; out — settlement, the market, currency, multi-party
  - [x] Witness sketch named (`tools/slcl1_receipt.rish`) so the lap lands proven; Open Asks room stays gated behind this note
- [x] **SLC-L1 build + witness** — `linengrow/receipt.rye` + `tools/slcl1_receipt.rish`; parity **152** (`20260704.021800`):
  - [x] Sign → append (hex log line) → fold balance → verify on metal
  - [x] Unwelcome path: tampered log byte rejected at verify
  - [x] Fixture fact pinned at `tools/fixtures/slcl1_fact.bron`; deterministic Ed25519 seed `0x42`

### Ground
- [ ] **Kernel-direction memo** — graduate the microkernel leaning in `expanding-prompts/20260628-120912_*` into its own direction memo beside `20260628-043542`, when it feels fully settled. Same pattern as thin-frontend: deliberate, then record.
- [ ] **Egress budget (recorded, design)** — the front-door VPS transfer cap named as a constant, metered at the tunnel's mouth, witness at the edge; **household headroom** as a standing courtesy fraction the tunnel never crosses. Ground: [`external-research/20260703-015512_bandwidth-and-moderation.md`](../external-research/20260703-015512_bandwidth-and-moderation.md) (`20260703.015512`).
- [ ] **Deep-archive hardware (horizon)** — rack, powered dock, bare enterprise drives, front-door tunnel; researched in [`external-research/20260701-213412_deep-archive-and-sovereign-host-blueprint.md`](../external-research/20260701-213412_deep-archive-and-sovereign-host-blueprint.md); procurement waits on the dedicated machine; complete priced guide (new + used, three tiers, tinybox and apex-tower appendices): [`external-research/20260703-013412_home-server-purchase-guide.md`](../external-research/20260703-013412_home-server-purchase-guide.md).
- [x] **Designed-not-built spec bound (Edit 5)** — at most one functional spec in flight until its first lap runs green; witness [`tools/designed_not_built_witness.rish`](../tools/designed_not_built_witness.rish) wired in parity **143** (`20260703.032812`).

**Recorded rulings (`20260701-221512` docs round):** **Amber invocation** — explicit shell command with manual sandbox-key unlock; the docked bare drive is precondition, never trigger; the shell may notice and offer, never act; scrub runs cold, key warm only for the seconds of seal. **Amber key custody** — master `0646 2132 D3E6 3B83 4F97 6E03 A81D 720B 9235 FA7A` cold and certifying; sandbox `DBF8 5343 7A93 7B4E 36B9 3611 D949 807A C26B 2B99` signing and revocable; drive passphrase on paper in the firebox and offsite; any other fingerprint is an error on sight.

**Recorded rulings (`20260703.203712 UDT`) — crossing names, all *for*:** **Tilak** — the type-mark word; every value at a seam wears a mark in Weave. **Triad** — **absorb / express / tend** affirmed as the three duties of every Tilak. **Pottery** — value-object tier name; `.pott` working extension; greenware · kiln · glaze aspect family. **Amphora** — crossing-vessel vocabulary for agent handoffs. Law: [`active-designing/20260703-202312_the-marked-value.md`](../active-designing/20260703-202312_the-marked-value.md) · [`external-research/20260703-201612_the-amphora-and-the-crossing.md`](../external-research/20260703-201612_the-amphora-and-the-crossing.md).

**Recorded rulings (`20260703.191312 UDT`) — five ratifications, all *for*:** **Archive verdict** — Amber seals content-addressed **resins** (SHA3-256 working tier; SHA3-512 canonical forever-names); law at [`context/specs/20260703-191112_resins-and-hash-tiers.md`](../context/specs/20260703-191112_resins-and-hash-tiers.md). **Versioning rule** — authored surfaces chronological stamps only; semver a named backend seam; chrono sweep may wire. **Standing audit rule** — mirrored collaboration/contract pair per seam; integrated checks on thin edge only; one pair per season; RW-1 landed (**147**), RW-2 landed (**150**). **Maitreya owns time** — one clock for audio and video; Brushstroke owns space. **Demand map** — eight-category → module-ensemble table held as requirements; interop-first, consent-before-counting, reward-points-at-the-good; **proxy column** on the movement memo table per circulation survey Q1.

---

---

### WOV, the builds, and the harvest (`20260702.211312`)

Ground: [`external-research/20260702-211312_names-builds-and-the-ledger-map.md`](../external-research/20260702-211312_names-builds-and-the-ledger-map.md).

- [ ] **WOV gate (Kaeden affirms)** — throughput lane over pinned TigerBeetle (pin, never fork, until a Rye-shaped change demands); one or two monarchs, never three (three is Mycelium's door at M4); **exit-honesty spec written before any lap** (root facts + balance proofs sufficient for holder exit); first lap after MALA M2 only.
- [x] **Hardware fit (recorded)** — the sovereign-host blueprint covers MALA M0–M2 and WOV's first lap through the two-monarch season with headroom; two deltas named: a dedicated power-loss-protected M.2 NVMe for the WOV data file beside the settlement U.2, and ECC as the value-bearing-monarch threshold with the blueprint's apex tower as its pre-written answer; the x1 gentle-slot rule extends to every ledger tenant. Ground: [`external-research/20260702-215212_wov-mala-hardware-fit.md`](../external-research/20260702-215212_wov-mala-hardware-fit.md) (`20260702.215212`).
- [x] **Build verdict (recorded)** — no new module: the build system grows as `rye`'s verbs (`rye test` runner is the first witness-gated horizon, a watcher later), declared by Brix, typed by Bron's mark triad, versioned where Mantra already stands; watcher name-candidates parked in RTAC for Kaeden (`20260702.211312`).
- [ ] **Living build counsel (recorded, design-only)** — builder as projection over Weave/Mantra, never a second state holder; Brix declared graph + resins-law SHA3-256 content keys; three SLC laps (watch loop · Brix-keyed cache with no-work witness · Salsa-shaped sub-file queries on proven need); lap two waits for measured red. Ground: [`external-research/20260703-193012_the-bench-as-a-block-and-the-living-build.md`](../external-research/20260703-193012_the-bench-as-a-block-and-the-living-build.md) (`20260703.193012`).
- [ ] **Bench-as-block extractions (Kaeden word)** — three siloed active-designing cuts named in counsel: *the bench is a block* · *the build as a projection* · *the message seam*; each stripped of outside names on a fresh anchor.

### Crossing suite — Pottery, Amphora, type-marks (`20260703.200712`–`202312`)

Ground: [`external-research/20260703-201612_the-amphora-and-the-crossing.md`](../external-research/20260703-201612_the-amphora-and-the-crossing.md) · [`active-designing/20260703-202312_the-marked-value.md`](../active-designing/20260703-202312_the-marked-value.md) · [`session-logs/20260703-202312_the-marked-value-round.md`](../session-logs/20260703-202312_the-marked-value-round.md).

- [x] **Pottery seat (Kaeden)** — value-object tier; `.pott` working extension; greenware · kiln · glaze aspect family (`20260703.203712 UDT`, *for*).
- [x] **Amphora seat (Kaeden)** — crossing-vessel vocabulary; companion silo [`active-designing/20260703-201612_the-sealed-crossing.md`](../active-designing/20260703-201612_the-sealed-crossing.md) (`20260703.203712 UDT`, *for*).
- [x] **Type-mark word (Kaeden)** — **Tilak** seated; **absorb / express / tend** triad affirmed (`20260703.203712 UDT`, *for*).
- [x] **Crossing manifest seed (witness)** — [`work-in-progress/20260703-202312_crossing_manifest_seed.rye`](20260703-202312_crossing_manifest_seed.rye) parses `<mark> <sha3-256-hex> <name>`; `tools/crossing_manifest_seed.rish` at parity **151** (`20260704.020800`); module home still on Kaeden word.
- [x] **Bron mark triad (concept adopted)** — every notation type carries its conversions in, out, and its operations; arm names **absorb / express / tend** seated as Tilak duties (`20260702.211312`; affirmed `20260703.203712 UDT`).
- [x] **Comlink address triple (concept adopted)** — named data resolves by *Kumara identity / lane / stamp*; design note when the naming lap opens (`20260702.211312`).

**Stops, pre-staged for the doors** (answers the loop's question six): when **Door 3 = *for*** → Edit 5 wire (**143**), then Amber rungs (a)–(e) per the confirmed counsel, and the chronological sweep wires in the same arithmetic; when the **SLC-2b nod** lands after Door 2 → the four DoD greens, then RW-1's pair (**+2**); after the **Amber season** → the toolset lap one and `rye test` enter the itinerary; the Aurora manual page enters on that surface's next touch, as-you-touch.

## Next — Horizons and Optional

### The lane and the hearth (`20260702.202612`)

- [x] **Studies 19–20** — [`19_GOVERNMENT_AS_PLANETARY_SPECTRUM.md`](../classical-vedic-astrology/studies/19_GOVERNMENT_AS_PLANETARY_SPECTRUM.md) and [`20_LIBERAL_AND_CONSERVATIVE_PLANETS.md`](../classical-vedic-astrology/studies/20_LIBERAL_AND_CONSERVATIVE_PLANETS.md); distilled from Vic DiCara with gratitude; raw transcripts not committed (`20260702.202612`).
- [x] **The Serena episode** — [`foundations/20260702-202612_a-conversation-with-serena.md`](../foundations/20260702-202612_a-conversation-with-serena.md): the hearth-talk imagined fuller, in the register of the earliest foundations writings (`20260702.202612`).

### The movement's open asks (`20260702.192712`)

Ground: [`external-research/20260702-192712_the-movements-open-asks.md`](../external-research/20260702-192712_the-movements-open-asks.md).

- [x] **Demand map (Kaeden affirms)** — the eight-category → module-ensemble table; interop-first, consent-before-counting, and reward-points-at-the-good held as requirements; **proxy column** (public-market proxy present or absent) on the movement memo table per circulation survey Q1 (`20260703.191312 UDT`, *for*).
- [ ] **Open Asks room (design candidate)** — requests, applications, acceptances, completion receipts, and reputation-as-fold as Linengrow's first application beside the receipt lap; enters only after SLC-L1's scope note draws its edge.
- [ ] **Sanctuary care log (flagship candidate)** — signed care facts per resident, schedules as projections, CIVIC dignity-floor accountability; design-only until its season.
- [ ] **Moderation-fact shape (recorded, design-only)** — label · limit · mute as small signed facts referencing a stated community rule; moderation as fold-choice with receipts; chosen, composable label sources; reputation stays a fold over signed receipts under consent-before-counting. Enters the ladder beside the Open Asks room, after SLC-L1 draws its edge. Ground: [`external-research/20260703-015512_bandwidth-and-moderation.md`](../external-research/20260703-015512_bandwidth-and-moderation.md) (`20260703.015512`).
- [ ] **Resin-refusal fact (recorded)** — media never lives in the log, only digests; each store is sovereign to purge and decline a resin, and a signed refusal fact gives the no its receipt without describing the refused (`20260703.015512`; unit word ratified `20260703.191312`).
- [ ] **Linengrow agent writing (intake awaiting paste)** — the shared links resist the bench's fetch (client-rendered artifact; robots-walled share); on arrival it lands whole in external-research and siloed in foundations, exactly as asked.
- [x] **Issuer's ledger silo + circulation portfolio survey (`20260703.043912`)** — [`external-research/20260703-043912_the-issuers-ledger.md`](../external-research/20260703-043912_the-issuers-ledger.md) (MMT lecture on our spine; MALA deferred) · [`external-research/20260703-043912_circulation-portfolio-survey.md`](../external-research/20260703-043912_circulation-portfolio-survey.md) (July 2026 ground re-verified on Cursor metal; thin-chapter → Linengrow rails); research for understanding only; treasury untouched.

### The audit, the manual, and the userland (`20260702.180812`)

Ground: [`20260702-180812_testing-audit-first-pass.md`](20260702-180812_testing-audit-first-pass.md) · [`20260702-184312_versioning-audit.md`](20260702-184312_versioning-audit.md) · [`active-designing/20260702-184312_the-grain-and-the-crossing.md`](../active-designing/20260702-184312_the-grain-and-the-crossing.md) · [`manual/reference/rishi-language.md`](../manual/reference/rishi-language.md) · [`external-research/20260702-180812_userland-lineages.md`](../external-research/20260702-180812_userland-lineages.md) · [`active-designing/20260702-180812_the-small-sharp-toolset.md`](../active-designing/20260702-180812_the-small-sharp-toolset.md).

- [x] **RW-3 run-record witness** — `tools/run_record_witness.rish` pins `.ok`, `.code`, `.out`, `.err` for success and failure; wired in parity **141** (`20260702.190000`).
- [x] **RW-4 SLC failure-path witness** — `tools/rw4_slc_failure_paths.rish` pins unknown meta-command, bad `:recall`, doomed `run`, and unknown CLI; wired in parity **142** (`20260702.183500`).
- [x] **Standing audit rule (Kaeden ratifies)** — every new seam ships its mirrored collaboration/contract pair; integrated checks live only on the thin edge; one pair per season, RW-1 (**147**), RW-2 (**150**) landed (`20260703.191312 UDT`, *for*).
- [x] **Versioning rule (Kaeden ratifies)** — authored surfaces carry chronological stamps only; the backend's semver and the inherited parser stay named seams ([`20260702-184312_versioning-audit.md`](20260702-184312_versioning-audit.md)); **chrono sweep** wired in parity **148** (`20260703.203212 UDT`, Cursor metal) (`20260703.191312 UDT`, *for*).
- [x] **Rishi framework growth (witness-first, in need order)** — **conditional** `tools/rish_conditional_witness.rish` (`20260702.205630`); **env** `tools/rish_env_witness.rish` (`20260702.210201`); **file I/O** `tools/rish_file_io_witness.rish` (`20260702.210435`); **exit vocabulary** `tools/rish_exit_codes_witness.rish` (`20260702.210650`); all unwired from parity — Edit 5 landed at **143** (`20260703.032812`).
- [x] **Manual next rooms — Rishi tutorial one** — [`manual/tutorials/first-witness.md`](../manual/tutorials/first-witness.md); reference at chronological stamp `20260702.184312`, parity **142** (`20260702.184312` grain round).
- [x] **Manual tutorial two — run record and failures** — [`manual/tutorials/run-record-and-failures.md`](../manual/tutorials/run-record-and-failures.md); RW-3 and RW-4 deep dive at parity **142** (`20260702.205630`).
- [x] **RW-2 contract on paper** — [`20260702-205630_rw2-mirrored-pair-contract.md`](20260702-205630_rw2-mirrored-pair-contract.md); app↔Brushstroke mirrored pair spec; **landed parity 150** (`20260703.235512 UDT`, Cursor metal).
- [ ] **Manual horizons** — Aurora / Tally / Caravan interface reference pages as each surface stabilizes. **Partial (`20260702.205630`):** [`manual/reference/caravan-capabilities.md`](../manual/reference/caravan-capabilities.md) · [`manual/reference/tally-gardens.md`](../manual/reference/tally-gardens.md) — witnessed behavior only; Aurora waits.
- [ ] **Man-as-value first lap** — one utility carries a `.bron` man record; `:man <name>` renders it; the manual renders the same record. After the toolset's first lap.
- [ ] **Small-sharp-toolset ladder (gated after Amber season)** — lap one: an `echo`-sized utility with opening lines, `.bron` man record, `.brix` declaration, witness green; lap two: readiness-as-fact for one Caravan child; the override combinator earns its lap when two real configurations exist to differ.

### Rio's first round — searched ground and the happy zone (`20260702.165412`)

Ground: [`external-research/20260702-035018_puddle-sandboxed-rye-containers.md`](../external-research/20260702-035018_puddle-sandboxed-rye-containers.md) (second pass) · [`foundations/20260702-165412_the-happy-zone-and-the-thin-edge.md`](../foundations/20260702-165412_the-happy-zone-and-the-thin-edge.md).

- [x] **Archive verdict (Kaeden affirms)** — Amber's seal = Kumara-signed `.bron` manifest naming SHA3-256 **resins** cut at content-defined boundaries; each resin is the stored bytes, the manifest catalogs; SHA3-512 for canonical forever-names per [`context/specs/20260703-191112_resins-and-hash-tiers.md`](../context/specs/20260703-191112_resins-and-hash-tiers.md); chunk-store host seam today; mountable index = bootable-clone shape; tar transport wrapper only (`20260703.191312 UDT`, *for*).
- [ ] **Puddle continuity invariant (recorded)** — one live instance per Kumara identity, enforced by a signed continuity fact; the double-boot hazard ruled out by construction.
- [x] **Maitreya owns time (Kaeden affirms)** — one clock for audio and video: decode, sync, bounded buffers; Brushstroke owns space; codecs stay royalty-free host seams (the lossless, low-delay, general, and hybrid families, with their video kin); Lotus authors above; Realidream plays through the same seam (`20260703.191312 UDT`, *for*).
- [ ] **Happy-zone pairing (TAME horizon)** — as module seams stabilize, each earns mirrored collaboration and contract witnesses; metalsmoke stays the thin edge's few honest integrated checks; enters TAME guidance on Kaeden's ruling.

### Modules, money, and the manual — horizons (`2026-07-02`)

Ground: [`active-designing/20260702-031312_modules-aspects-and-mailable-money.md`](../active-designing/20260702-031312_modules-aspects-and-mailable-money.md) · named companion: [`external-research/20260702-031312_settlement-consensus-and-many-roads.md`](../external-research/20260702-031312_settlement-consensus-and-many-roads.md).

- [x] **Module/aspect vocabulary** — definitions and graduation rule in [`context/specs/20260702-035018_graduation-rule.md`](../context/specs/20260702-035018_graduation-rule.md).
- [ ] **Weave graduation trigger (recorded)** — the day Comlink serves named data straight from Weave, `mantra/src/weave.rye` graduates to `weave/` and Mantra imports it like everyone else.
- [ ] **MALA M0 (design lap)** — token-fact shapes and witnesses on paper; opens after the Edit 5 ruling and Amber's first lap, in that order; ladder M0–M4 in the memo.
- [ ] **Digital land = M3 (design only)** — plots as name-claim facts with extent in Realidream's graph, deeds bound to Kumara holders, traded in MALA; ordinary internet and dock-wire alike.
- [ ] **Mycelium gate (recorded)** — the ordering aspect opens at M4's many-issuer season, never before.
- [ ] **Road-keeper (exploration → first lap)** — Comlink's multipath aspect: per-road bounded queues and scorecards; first lap = one session surviving across two UDP paths under QEMU.
- [ ] **Amber-compatibility contract (design)** — export / verify / restore for every log-bearing module (Mantra, Tablecloth, Linengrow, Realidream, MALA); first lap = a Mantra log slice sealed and restored, riding Amber's first lap.
- [ ] **Brix packaging (first lap visible)** — one content-addressed, Kumara-signed package: descriptor read, stones fetched by digest over Comlink, verified on two paths, placed, run in Pond; `.bron` as the resolved-record carrier awaits Kaeden's affirmation.
- [x] **Opening lines (canonized)** — three-line head in TAME guidance; **`tools/opening_lines_witness.rish`** in parity **140** (sixteen hosted files, including `pond/apps/drawn_terminal.rye`).
- [ ] **Manual program (horizon)** — four rooms founded at [`manual/README.md`](../manual/README.md); first reference [`manual/reference/rishi-language.md`](../manual/reference/rishi-language.md) open; tutorials and module reference pages in season.
- [x] **Pond clause (Kaeden completes)** — affirmed in [`pond/README.md`](../pond/README.md) (`20260703.012031`, `3320bed`).
- [ ] **Puddle exploration (horizon)** — sandboxed Rye containers; [`external-research/20260702-035018_puddle-sandboxed-rye-containers.md`](../external-research/20260702-035018_puddle-sandboxed-rye-containers.md); first lap = one guest snapshot export/verify/restore.
- [ ] **Maitreya / Uddhava naming (recorded)** — Maitreya owns time (audio + video); Uddhava spatial/CAD horizon; counsel affirmed `20260702.165412`; archive verdict and Maitreya owns-time **ratified** `20260703.191312 UDT`.

### Comlink and the long run — horizons (`2026-07-02`)

Ground: [`external-research/20260702-014112_comlink-beyond-dns-and-sockets.md`](../external-research/20260702-014112_comlink-beyond-dns-and-sockets.md) · counsel: [`20260702-014112_horizons-and-blind-spots.md`](20260702-014112_horizons-and-blind-spots.md).

- [x] **Wire hardening (precedes any real peer)** — hosted wire: witness fixture key seeds (replacing `0xA1`/`0xB0`), unique nonce per seal via monotonic counter + SHA3 mix; parity **138** green. Production CSPRNG nonces remain horizon.
- [ ] **Algorithm tags (accretion)** — every signed record carries its algorithm field, so eras verify side by side on one log forever.
- [ ] **Hybrid key agreement (horizon)** — X25519 joined with ML-KEM-768 on the wire; harvest-now-decrypt-later answered.
- [ ] **Dual signatures for the long dark (horizon)** — Amber adds SLH-DSA beside Ed25519 through the OpenPGP seam as its tooling settles.
- [ ] **The stream lane (exploration → first lap)** — bounded, drop-late encrypted datagrams beside the fact lane; WebTransport at the browser seam; relay shape at the front door; codecs stay host seams.
- [ ] **Names without DNS (design only)** — name-claim fact shape, petnames above, Linengrow settlement as the market; no code before Kumara signs.
- [ ] **Setu ruling (Kaeden)** — the USB-C dock-wire lane's name; candidate proposed for the lexicon's open table; first lap = one Comlink datagram over CDC-NCM, host to QEMU guest.
- [ ] **Mantrapod module map (Kaeden affirms)** — the pod's module-by-module plan as tabled in the counsel memo.
- [ ] **Two-oracle sky gate (optional)** — a `.rish` witness around `cast_a_chart.py` asserting agreement against a hand-pinned golden chart.
- [ ] **Intakes awaiting Kaeden's hand** — the mathematics writings (silo together, then weigh against TAME's goals); the Cerebras and wafer-memory silos (held for the inference season).
- [ ] **Recovery rehearsal (after Amber's first lap)** — restore a directory from a cold drive and recover from a revoked sandbox key, so recovery is a witnessed fact.

### TAME hardening — complete (`2026-06-29`)


- [ ] **Width migration Phase 1b (as-you-touch)** — `mantra/*` next per the living baseline [`20260620-212126_usize-width-baseline.md`](20260620-212126_usize-width-baseline.md); decoupled from any compiler fork; re-anchored here so the oldest live thread stays on the granular plan (`20260703.013412`).

Record: `session-logs/20260629-204910_th7-width-gate-yonder-convention.md` and prior TH/RS logs. Hosted `width-check` blocks in parity (**138** witnesses).

**Horizon and optional (still open):**

- [ ] **Aurora invariant notes (optional)** — say-why rationales beside `catch unreachable` in `aurora/src/seed.rye`; freestanding only; no width or assert lint.

- [ ] **Mantra CRDT weave (horizon)** — merge-always-succeeds-and-converges semantics from `external-research/yonder/20260617-195312_mantra.md`; SLC-1 seed uses LCS line weave only today.

- [ ] **TAME hygiene (as-you-touch)** — assertion-density backlog, `// invariant:` prefix, and bare `print(...)` via `const print = std.debug.print` in older hosted `.rye`; address when each file is touched, not as a sweep.

- [ ] **Content-centric Rishi messenger (horizon)** — smallest IRC-meets-Dojo CLI over sealed, content-named datagrams; from `expanding-prompts/yonder/20260618-212012_content-centric-messaging.md`; Aurora/Comlink carry the networking seeds today.

- [ ] **Shape-casting for RISC-V bytecode (horizon)** — prove raw bytes match a declared type before trust; draw the shape-vs-execution seam plainly; from the same consumed prompt.

- [ ] **Ownerboot sovereignty (horizon)** — owner-key-sealed boot chain inverting trust at the reset vector; from `external-research/yonder/20260617-195612_ownerboot-riscv-caravan.md`; Caravan is live, the firmware path is horizon.

- [ ] **Unified identity and fractal address space (horizon)** — one seed deriving SSH, GPG, Sui, and Nostr keys; fractal address space shaped by Vedic whole-sign astrology (galaxy / star / planet); ties to Linengrow portable identity; from `expanding-prompts/yonder/20260618-215512_unified-keys-and-address-space.md`; Comlink carries the networking half today.

---

## Soon — Medium Term

### Rye OS
- [ ] **SLC-2 — Pond GUI** — the Rishi+Mantra loop in a Brushstroke/Skate window on x86_64. Simple, lovable, complete at a small scope.
- [ ] **Comlink device wire** — sealed datagram over virtio-net between two QEMU guests. **Hosted wire** in parity; **Caravan seeds** (`seed`→`chain`) in parity at **137**; **Track A** virtio-net bring-up remains.
- [ ] **Comlink v1** — typed, content-named, sealed delivery between identities.
- [ ] **Brix v1** — a `.brix` course evaluating into a closure of content-addressed bricks in Tablecloth, per [`active-designing/20260702-185912_brix-the-composer.md`](../active-designing/20260702-185912_brix-the-composer.md).
- [ ] **Unified keys** — one owner seed deriving all keys.
- [ ] **Revitalization pass** — refresh the oldest active-designing briefs to the current direction; affirmed canonical files get the four-in-one touch (de-number, re-date, affirm, light freshen) rather than rename; see `ORGANIZING.md`.

### Linengrow
- [x] **SLC-L1 build** — verifiable receipts from keypair + Mantra log + projection; landed `20260704.021800` — see ladder above · parity **152**
- [ ] **SLC-L2** — a signed receipt delivered identity to identity over Comlink, sealed.

### Ground
- [ ] **Tablecloth v1** — the content-addressed store the package picture rests on.
- [ ] **TAME lints, AST tier** — begin only when a Zig parser is at hand or the need is proven: 70-line function limit ratcheted, bitwise/arithmetic precedence, defer-blank-line, dead declarations. Do not clone `tidy.zig` ahead of the need.

---

## Later — Horizons (decided in direction, grown by degrees)

### Rye OS
- [ ] **Caravan v1** — a supervision tree with a capability table; the microkernel taking shape from the hosted seed.
- [ ] **Pond v1** — Caravan isolation composed with Tally bounds, policy as a value.
- [ ] **The Forge** — Mantra served, Brushstroke drawn, Comlink replicated.
- [ ] **The TAME Editor**, **Comlink remoting** — select-then-act in Skate; value-based state sync over UDP.
- [ ] **Aurora toward verified boot** — the freestanding RISC-V seed grown toward a verified boot.
- [ ] **The kernel, built** — Caravan grown into a real microkernel on RISC-V (architecture decided; build last).
- [ ] **Language fork** — self-hosted compiler, Rye-native `std`, revisited from a mature whole if RISC-V-first genuinely demands it.
- [ ] **Inference stack** — Lantern, Lattice, Anvil, held furthest, after the living desktop composes.

### Linengrow
- [ ] **SLC-L3 — settlement** — a transaction settled on Sui with USDsui; the receipt verifiable on the ledger.
- [ ] **The platform horizons** — the computational data market, premium tiers, state-currency circulation, infrastructure licensing — grown from the business model in `../linengrow/`.
- [ ] **The civic horizons** — PBC formation, investor outreach, the first transparency campaign as proof of concept.

---

## Open Questions

- **Tablecloth horizon** — datastore + layout cluster now in `external-research/yonder/` and `expanding-prompts/yonder/`; shape when SLC bench allows.
- **sixos/s6 infrastructure horizon** — study in `external-research/yonder/20260619-225212_s6-sixos-nix-infuse.md`; Caravan inherits supervision discipline when we reach for it.
- **Bron** — proposed; role beside Brix still open. Brix describes *what a system is made of*; the `.bron` notation brief exists — what does Bron describe alongside it? *(Open ruling for Kaeden.)*
- **Tablecloth** — proposed layout or structured-view layer; named, not yet shaped.
- **`.brush`** — surface-description extension for the day Brushstroke becomes a small language; horizon only.
- **Dexter / Kumara as modules** — **Dexter:** keyboard-from-window aspect in `pond/apps/drawn_terminal.rye` until second external consumer; graduation trigger in [`context/specs/20260702-035018_graduation-rule.md`](../context/specs/20260702-035018_graduation-rule.md) (`20260703.131812`). **Kumara:** name and doctrine; module home still open.
- **Two-backend seam** — Wayland SHM to Mutter now (hosted); framebuffer-to-QEMU sovereign sibling named, not built. *(Pending Kaeden nod.)*
- **Weave** — aspect of Mantra today (`mantra/src/weave.rye`); graduation trigger recorded in [`20260702-031312`](../active-designing/20260702-031312_modules-aspects-and-mailable-money.md).
- **Research essays (authored, living)** — [`external-research/20260630-030312_the-interface-as-a-fold.md`](../external-research/20260630-030312_the-interface-as-a-fold.md); [`external-research/20260630-030312_after-victor-immediate-contact.md`](../external-research/20260630-030312_after-victor-immediate-contact.md); [`external-research/20260630-030312_the-hot-loop-as-the-forge.md`](../external-research/20260630-030312_the-hot-loop-as-the-forge.md).
- **Lotus** — DAW direction adopted in `active-designing/20260630-014012_lotus-the-daw.md`; REAPER docs and AP Mastering design in `gratitude/`; bench waits for SLC-2a.
- **Kernel-direction brief held** — `expanding-prompts/20260628-120912_kernel-direction-brix-and-foundations.md` stays one level deep pending the kernel-direction memo (live Now task).
- **Linengrow's home** — does Linengrow stay a folder in this repo, or graduate to its own repo (`xwb122m/linengrow-*`) once its first lap runs?
- **SLC-L1 and Sui** — **affirmed in scope note** [`20260702-195426_slcl1-verifiable-receipt.md`](../active-designing/20260702-195426_slcl1-verifiable-receipt.md): first lap uses pure foundations (keypair + log + projection); no Sui; settlement deferred to SLC-L3.
- **Brix and Silo** — `infuse.nix` once seeded a "Silo" configuration language; Brix is now the composer. Is Silo retired into Brix, or a distinct config layer? Worth one clear line.
- **TASKS naming** — keep `TASKS.md`, or rename to the warmer `WORKBENCH.md`?
- **OCuLink companion memo** — blueprint [`20260701-213412`](../external-research/20260701-213412_deep-archive-and-sovereign-host-blueprint.md) awaits the server-workstation research memo; bridge into `external-research/` when Kaeden supplies it.
- **Birth-chart craft** — siloed library, templates, sample reading, and caster at [`classical-vedic-astrology/`](../classical-vedic-astrology/README.md) (`studies/`, `20260701-232912_*`, `cast_a_chart.py`).

---

*May the next lap stay clear at the top of this list. May each task be small enough to finish and worth the finishing. May what we complete accrete as honest history, and what remains stay light in the hand.*
