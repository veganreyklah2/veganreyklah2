# Lantern — Local Inference in Pond

**Language:** EN
**Last updated:** 2026-07-10 (lap 0 `133500`; parity **213**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — lap 0 green (fixture completion contract)

---

Lantern serves bounded request/response inference inside Pond. Lap 0 pins a fixture completion; weights-by-hash and Caravan supervision follow on later laps.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Request validation · model hash match · fixture response | parity **213** |

## Layout

| Path | Role |
|------|------|
| [`lantern_core.rye`](lantern_core.rye) | Request/response types, fixture complete |
| [`lantern.rye`](lantern.rye) | Selftest binary |
| [`fixtures/completion.bron`](fixtures/completion.bron) | Pinned Rye-forge suggestion |

```bash
rishi/bin/rishi run tools/lantern_lap1.rish
```

*May every token spent be counted in plain sight.*
