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

## Future: Language Fork

The long-horizon path (`active-designing/970`, `external-research/967`): Rye's own type system rejects `usize` in `.rye` source. This is F1–F5 in the fork roadmap — decided yet not started. Phase 4 sunsets when F3 (Rye-native std) completes.

---

*May the inventory shrink one module at a time, with the gate green at every step.*
