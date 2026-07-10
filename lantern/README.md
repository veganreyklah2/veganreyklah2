# Lantern — Local Inference in Pond

**Language:** EN
**Last updated:** 2026-07-10 (lap 19 require_model · dual-model `213738`; parity **334**/**338**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–19 green (through dual-model allow · require_model pin)

---

Lantern serves bounded request/response inference inside Pond. Each lap deepens the contract: a pinned fixture completion, a `max_tokens` budget, a model-hash allow-list, `temperature` and `seed`, `top_p`, `err_stop`, `stop_sequence` on the response, a request-side `stop_sequence` pin, a request-side `prompt` pin, a request-side `max_tokens` pin, a response `text_pin`, a dedicated `TemperatureMismatch` pin, a seed-only pin fixture, `TopPMismatch` distinct from range `BadTopP`, an `err_stop` request pin, a `length_stop` request pin, empty allow-list refuse, an `allow_count` pin, dual-model allow welcome, then a `require_model` pin. Weights named by hash and Caravan supervision follow on later laps.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Request validation · model hash match · fixture response | parity **213** |
| **1** | `max_tokens` truncate · length stop · zero budget refused | `tools/lantern_lap1.rish` |
| **2** | Model allow-list gate · unknown hash refused | parity **252** · `tools/lantern_lap2.rish` |
| **3** | `temperature` + `seed` · range and pin checks | parity **258** · `tools/lantern_lap3.rish` |
| **4** | `top_p` · range and pin checks | parity **275** · `tools/lantern_lap4.rish` |
| **5** | `err_stop` · fixture pin | parity **279** · `tools/lantern_lap5.rish` |
| **6** | `stop_sequence` · response fixture pin | parity **283** · `tools/lantern_lap6.rish` |
| **7** | `stop_sequence` · request pin + mismatch refuse | parity **287** · `tools/lantern_lap7.rish` (`191112`) |
| **8** | `prompt` · request pin + mismatch refuse | parity **294** · `tools/lantern_lap8.rish` (`192749`) |
| **9** | `max_tokens` · request pin + mismatch refuse | parity **298** · `tools/lantern_lap9.rish` (`193358`) |
| **10** | `text_pin` · response pin + mismatch refuse | parity **302** · `tools/lantern_lap10.rish` (`200203`) |
| **11** | `temperature` · request pin + `TemperatureMismatch` | parity **306** · `tools/lantern_lap11.rish` (`200819`) |
| **12** | `seed` · request pin fixture + mismatch refuse | parity **310** · `tools/lantern_lap12.rish` (`211930`) |
| **13** | `top_p` · `TopPMismatch` distinct from `BadTopP` | parity **314** · `tools/lantern_lap13.rish` (`211930`) |
| **14** | `err_stop` · request pin + `ErrStopMismatch` | parity **318** · `tools/lantern_lap14.rish` (`212715`) |
| **15** | `length_stop` · request pin + `LengthStopMismatch` | parity **322** · `tools/lantern_lap15.rish` (`212715`) |
| **16** | Empty allow-list · `EmptyAllowList` | parity **326** · `tools/lantern_lap16.rish` (`213317`) |
| **17** | `allow_count` · pin + `AllowCountMismatch` | parity **330** · `tools/lantern_lap17.rish` (`213317`) |
| **18** | Dual-model allow · assist hash welcome | parity **334** · `tools/lantern_lap18.rish` (`213738`) |
| **19** | `require_model` · pin + `RequireModelMissing` | parity **338** · `tools/lantern_lap19.rish` (`213738`) |

## Layout

| Path | Role |
|------|------|
| [`lantern_core.rye`](lantern_core.rye) | Request/response types, fixture complete + pins through TopPMismatch |
| [`lantern.rye`](lantern.rye) | Selftest |
| [`fixtures/completion.bron`](fixtures/completion.bron) | Lap 0 pinned completion |
| [`fixtures/completion_length.bron`](fixtures/completion_length.bron) | Lap 1 long completion |
| [`fixtures/allowed_models.bron`](fixtures/allowed_models.bron) | Lap 2 model-hash allow-list |
| [`fixtures/completion_seed.bron`](fixtures/completion_seed.bron) | Lap 3 seed + temperature pin |
| [`fixtures/completion_top_p.bron`](fixtures/completion_top_p.bron) | Lap 4 top_p pin |
| [`fixtures/completion_err_stop.bron`](fixtures/completion_err_stop.bron) | Lap 5 err_stop pin |
| [`fixtures/completion_stop_sequence.bron`](fixtures/completion_stop_sequence.bron) | Lap 6–7 stop_sequence pin |
| [`fixtures/completion_prompt.bron`](fixtures/completion_prompt.bron) | Lap 8 prompt pin |
| [`fixtures/completion_max_tokens.bron`](fixtures/completion_max_tokens.bron) | Lap 9 max_tokens pin |
| [`fixtures/completion_text.bron`](fixtures/completion_text.bron) | Lap 10 text pin |
| [`fixtures/completion_temperature.bron`](fixtures/completion_temperature.bron) | Lap 11 temperature pin |
| [`fixtures/completion_seed_pin.bron`](fixtures/completion_seed_pin.bron) | Lap 12 seed pin |
| [`fixtures/completion_err_stop_pin.bron`](fixtures/completion_err_stop_pin.bron) | Lap 14 err_stop pin |
| [`fixtures/completion_length_stop_pin.bron`](fixtures/completion_length_stop_pin.bron) | Lap 15 length_stop pin |
| [`fixtures/allowed_models_empty.bron`](fixtures/allowed_models_empty.bron) | Lap 16 empty allow-list |
| [`fixtures/completion_allow_count.bron`](fixtures/completion_allow_count.bron) | Lap 17 allow_count pin |
| [`fixtures/allowed_models_one.bron`](fixtures/allowed_models_one.bron) | Lap 17 single-model mismatch |
| [`fixtures/completion_assist.bron`](fixtures/completion_assist.bron) | Lap 18 assist-model completion |
| [`fixtures/completion_require_model.bron`](fixtures/completion_require_model.bron) | Lap 19 require_model pin |

*May every completion honor its budget. May length stops stay honest. May only listed models speak. May seed, top_p, err_stop, stop_sequence, prompt, max_tokens, text, temperature, TopPMismatch, err_stop, and length_stop pins keep the fixture path deterministic.*
