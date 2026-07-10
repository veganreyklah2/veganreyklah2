# Lantern — Local Inference in Pond

**Language:** EN
**Last updated:** 2026-07-10 (lap 3 temperature+seed `181653`; lap 2 `180747`; lap 1 `180111`)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–3 green (fixture · max_tokens · allow-list · temperature/seed)

---

Lantern serves bounded request/response inference inside Pond. Lap 0 pins a fixture completion; lap 1 enforces `max_tokens`; lap 2 allow-lists model hashes; lap 3 carries `temperature` and `seed` on the request (fixture-pinned for determinism). Weights-by-hash and Caravan supervision follow on later laps.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Request validation · model hash match · fixture response | parity **213** |
| **1** | `max_tokens` truncate · length stop · zero budget refused | `tools/lantern_lap1.rish` (`180111`) |
| **2** | Model allow-list gate · unknown hash refused | parity **252** · `tools/lantern_lap2.rish` (`180747`) |
| **3** | `temperature` + `seed` · range and pin checks | parity **258** · `tools/lantern_lap3.rish` (`181653`) |

## Layout

| Path | Role |
|------|------|
| [`lantern_core.rye`](lantern_core.rye) | Request/response types, fixture complete + budget + allow-list + seed |
| [`lantern.rye`](lantern.rye) | Selftest |
| [`fixtures/completion.bron`](fixtures/completion.bron) | Lap 0 pinned completion |
| [`fixtures/completion_length.bron`](fixtures/completion_length.bron) | Lap 1 long completion |
| [`fixtures/allowed_models.bron`](fixtures/allowed_models.bron) | Lap 2 model-hash allow-list |
| [`fixtures/completion_seed.bron`](fixtures/completion_seed.bron) | Lap 3 seed + temperature pin |

*May every completion honor its budget. May length stops stay honest. May only listed models speak. May seed pins keep the fixture path deterministic.*
