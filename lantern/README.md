# Lantern — Local Inference in Pond

**Language:** EN
**Last updated:** 2026-07-10 (lap 1 `180111`; lap 0 `133500`)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — lap 0 + lap 1 green (fixture completion + max_tokens)

---

Lantern serves bounded request/response inference inside Pond. Lap 0 pins a fixture completion; lap 1 enforces `max_tokens` with truncate to `stopped_reason length`. Weights-by-hash and Caravan supervision follow on later laps.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Request validation · model hash match · fixture response | parity **213** |
| **1** | `max_tokens` truncate · length stop · zero budget refused | `tools/lantern_lap1.rish` (`180111`) |

## Layout

| Path | Role |
|------|------|
| [`lantern_core.rye`](lantern_core.rye) | Request/response types, fixture complete + budget |
| [`lantern.rye`](lantern.rye) | Selftest |
| [`fixtures/completion.bron`](fixtures/completion.bron) | Lap 0 pinned completion |
| [`fixtures/completion_length.bron`](fixtures/completion_length.bron) | Lap 1 long completion |

*May every completion honor its budget. May length stops stay honest.*
