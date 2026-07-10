# Mandi

**Vessel market floor** — where harvests and amphorae change hands, weighed in daylight and priced in MALA.

**Status:** Seated — name + lap 1 vessel listing (`20260710.165634`); WOV settlement waits  
**Seating:** [`../context/specs/20260710-165634_mandi-name-seated.md`](../context/specs/20260710-165634_mandi-name-seated.md)  
**Study:** [`../external-research/20260703-200712_compute-commerce-on-the-network.md`](../external-research/20260703-200712_compute-commerce-on-the-network.md)

## What this room is

Mandi names the offer: a signed `vessel-listing-v1` binds `vessel_parent` + MALA price under Kumara (seed `0x67`). The receipt is a digest of the canonical body — no buyer, no seller. Amphora purchase delivery remains the carriage rite; Mandi is the floor.

**Not this room:** Granary (weave-sharing four doors). Mela and Haat stay parked as warm siblings.

## Lap 1

| Piece | Role |
|-------|------|
| `mandi_core.rye` | Sign / verify / receipt / parent bind |
| `mandi.rye` | Selftest binary |
| `tools/mandi_lap1.rish` | Witness → parity **238** |

```sh
rishi/bin/rishi run tools/mandi_lap1.rish
```

## Floor view (lap 2)

Citizen window on Skate — five lines: floor title, vessel parent prefix, price, receipt prefix, fold green. Lying listing refused.

```sh
rishi/bin/rishi run tools/mandi_floor_view.rish
```

Witness → parity **240** (`mandiviewtest`).

## Held

Live WOV settlement of a Mandi sale waits its own gate.

---

*May every vessel sold be bounded and every bound be honest.*
