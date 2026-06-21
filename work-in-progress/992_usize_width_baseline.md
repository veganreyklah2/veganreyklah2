# 992 · Width Baseline — `usize` Inventory and Migration

**Stamp:** `20260621.055512`
**Policy:** `context/TAME_STYLE.md` (Rye supplement) · `gratitude/TIGER_STYLE.md` (Tiger source)
**Charter:** `expanding-prompts/10024_explicit_width_audit.md`
**Status:** Phase 1b in progress; Phase 4 seam audit complete (90 witnesses)

---

## The Rule

**`usize` is a boundary type, not a design type.** Use `u32` for bounded in-memory counts, indices, and lengths. Use `u64` for wire-persistent sizes and timestamps. Use `usize` only where Zig's slice system requires it — `buf.len`, `buf[i]`, inherited `std` signatures — and always pair the narrowing cast with an assert.

```zig
// invariant: buffer fits in u32
std.debug.assert(buf.len <= std.math.maxInt(u32));
const n: u32 = @intCast(buf.len);
```

---

## Current State

| Tier | What | `usize` count | Status |
|------|------|---------------|--------|
| **A — Authored** | Seeds, Rishi, Mantra, Caravan, Aurora, Brushstroke, Comlink | ~175 across 22 files | Phase 1b–3 in progress |
| **B — Witnesses** | `rye/tests/*` | ~15 (slice edges) | Acceptable at boundary |
| **C — Inherited std** | `rye/lib/std/**/*.zig` | thousands | Documented in Phase 4; changed in future fork |
| **D — Vendor** | `vendor/`, `gratitude/` | out of scope | Untouched |

### Authored files — done vs. remaining

| Done | File |
|------|------|
| [x] | `tally/seed.rye`, `tally/gardens.rye` |
| [x] | `caravan/seed.rye`, `caravan/bounded.rye`, `caravan/twin.rye` |
| [ ] | `caravan/chain.rye` (12 hits) |
| [ ] | `brushstroke/wayland_seed.rye` (9), `brushstroke/skate_grid.rye` (29) |
| [ ] | `rishi/src/main.rye` (37 — largest; Phase 3) |
| [ ] | `mantra/src/main.rye` (5), `mantra/src/diff.rye` (2) |
| [ ] | `comlink/hosted_wire.rye` (12) |
| [ ] | `aurora/src/deciding.rye` (11), `aurora/src/relay.rye` (8), `aurora/src/posted.rye` (11) |

---

## Phases

- [x] **Phase 0** — policy settled, baseline taken
- [x] **Phase 1a** — Tally seeds
- [ ] **Phase 1b** — Caravan chain, Brushstroke, remaining seeds
- [ ] **Phase 2** — Aurora + Comlink wire layouts (`u64` for wire widths)
- [ ] **Phase 3** — Rishi interpreter (37 hits, largest file)
- [x] **Phase 4** — Zig-ground `std` seam documented (90 witnesses, all GREEN)
- [ ] **Phase 5** — automated width gate in CI

---

## The Fork IS the Priority

The Rye language fork (`active-designing/970`, `external-research/967`) is not a future horizon — it is the primary track. Rye's own type system rejects `usize` in `.rye` source. The Zig bridge is a bootstrap shim, not a destination.

**Fork milestones:**

- [x] **F0 — Decide.** Literal ban in Rye types; research + siloed design (`051312`)
- [ ] **F1 — Compiler spike.** Reject `usize` in one witness compile
- [ ] **F2 — Authored corpus.** Zero `usize` in published `.rye`; width gate required
- [ ] **F3 — Rye-native std.** `rye/lib` surfaces rewritten with `u32`/`u64` signatures; witnesses re-based
- [ ] **F4 — Bridge sunset.** Self-hosted `rye run` without Zig for our tree
- [ ] **F5 — Guest Zig.** Interop lane documented for Rye OS

Phases 1–5 (the seam migration above) run in parallel with F1–F2. Phase 4 (seam audit) sunsets when F3 completes. The 90 witnesses ARE the specification the Rye-native std will satisfy.

---

## Known Issue: Enricher Grabbing Wrong Functions

The `tools/enrich_strengthening_docs.rye` script that added `## Rye std surface` sections to 86 pass documents has a **name-collision bug**: it matches function names naively across the entire Zig std tree and frequently grabs the wrong function (e.g., `Atomic.replace` instead of `mem.replace`, a linked-list `reverse` instead of `mem.reverse`). The API reference sections in the strengthening docs are **not trustworthy** until the enricher is fixed to match by module path, not by bare name.

**Action:** Fix the enricher to match `std.mem.replace` (full path), not `replace` (bare name). Re-run on all 86 docs. Until then, the witness tests remain the ground truth — they exercise the correct functions.

---

*May the inventory shrink one module at a time, with the gate green at every step, and may the fork arrive as the language that the seam migration was always growing toward.*
