# Amber — Seal Cold State

**Language:** EN
**Last updated:** 2026-07-03 (first ring — fixture export / verify / restore)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)

Amber seals bit-faithful snapshots as content-addressed **resins** and a signed manifest. The functional spec lives at [`context/specs/20260701-221512_amber-functional-spec.md`](../context/specs/20260701-221512_amber-functional-spec.md). Archive law: [`context/specs/20260703-191112_resins-and-hash-tiers.md`](../context/specs/20260703-191112_resins-and-hash-tiers.md).

## First ring (parity **144**)

| Piece | Path |
|-------|------|
| Manifest shape | [`ring1_manifest_shape.bron`](ring1_manifest_shape.bron) |
| Fixture tree | [`../tools/fixtures/amber_ring1_tree/`](../tools/fixtures/amber_ring1_tree/) |
| Export / verify / restore | [`../tools/fixtures/amber_ring1_export.sh`](../tools/fixtures/amber_ring1_export.sh) · verify · restore |
| Witness | [`../tools/amber_first_ring.rish`](../tools/amber_first_ring.rish) |

Ring one uses `openssl dgst -sha3-256` as the independent host oracle; export paths still say `stones/` until a hygiene ring; **resins** is the ratified unit word (`20260703.191312`). Kumara signing waits for a later ring.
