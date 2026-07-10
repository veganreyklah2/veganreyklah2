# Lantern — Local Inference in Pond

**Language:** EN
**Last updated:** 2026-07-10 (lap 6 stop_sequence `190800`; parity **283**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–6 green (fixture · max_tokens · allow-list · temperature/seed · top_p · err_stop · stop_sequence)

---

Lantern serves bounded request/response inference inside Pond. Each lap deepens the contract: a pinned fixture completion, a `max_tokens` budget, a model-hash allow-list, `temperature` and `seed`, `top_p`, `err_stop`, then `stop_sequence` with fixture pins for a deterministic path. Weights named by hash and Caravan supervision follow on later laps.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Request validation · model hash match · fixture response | parity **213** |
| **1** | `max_tokens` truncate · length stop · zero budget refused | `tools/lantern_lap1.rish` |
| **2** | Model allow-list gate · unknown hash refused | parity **252** · `tools/lantern_lap2.rish` |
| **3** | `temperature` + `seed` · range and pin checks | parity **258** · `tools/lantern_lap3.rish` |
| **4** | `top_p` · range and pin checks | parity **275** · `tools/lantern_lap4.rish` |
| **5** | `err_stop` · fixture pin | parity **279** · `tools/lantern_lap5.rish` |
| **6** | `stop_sequence` · fixture pin | parity **283** · `tools/lantern_lap6.rish` (`190800`) |

## Layout

| Path | Role |
|------|------|
| [`lantern_core.rye`](lantern_core.rye) | Request/response types, fixture complete + budget + allow-list + seed + top_p + err_stop + stop_sequence |
| [`lantern.rye`](lantern.rye) | Selftest |
| [`fixtures/completion.bron`](fixtures/completion.bron) | Lap 0 pinned completion |
| [`fixtures/completion_length.bron`](fixtures/completion_length.bron) | Lap 1 long completion |
| [`fixtures/allowed_models.bron`](fixtures/allowed_models.bron) | Lap 2 model-hash allow-list |
| [`fixtures/completion_seed.bron`](fixtures/completion_seed.bron) | Lap 3 seed + temperature pin |
| [`fixtures/completion_top_p.bron`](fixtures/completion_top_p.bron) | Lap 4 top_p pin |
| [`fixtures/completion_err_stop.bron`](fixtures/completion_err_stop.bron) | Lap 5 err_stop pin |
| [`fixtures/completion_stop_sequence.bron`](fixtures/completion_stop_sequence.bron) | Lap 6 stop_sequence pin |

*May every completion honor its budget. May length stops stay honest. May only listed models speak. May seed, top_p, err_stop, and stop_sequence pins keep the fixture path deterministic.*
