# Anvil — Local Forge Corpus

**Language:** EN
**Last updated:** 2026-07-10 (corpus greencandy prefix view `193358`; parity **297**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — corpus catalog + query + Skate views green; LoRA and training remain horizon

---

Anvil names training and fine-tuning on our own corpus. Lap 0 catalogs `.rye` / `.rish` chunks from **our tree** — gratitude and vendor stay in their reading rooms. Query filters by kind and path prefix. Corpus views fold those hits onto Skate.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0 (corpus)** | Chunk catalog · kind counts · unwelcome incomplete chunk | parity **214** |
| **1 (query)** | Kind + path_prefix filter · overflow refused | parity **216** · `tools/anvil_corpus_lap1.rish` |
| **view** | Rye query hits → six-line Skate frame | parity **259** · `tools/inference_anvil_corpus_view.rish` |
| **prefix view** | `path_prefix pond/` → five-line Skate frame | parity **265** · `tools/inference_anvil_corpus_prefix_view.rish` |
| **rish view** | `kind rish` → five-line Skate frame | parity **269** · `tools/inference_anvil_corpus_rish_view.rish` |
| **rye prefix view** | `kind rye` + `path_prefix pond/` → five-line Skate frame | parity **281** · `tools/inference_anvil_corpus_rye_prefix_view.rish` (`190800`) |
| **tools prefix view** | `path_prefix tools/` → five-line Skate frame | parity **293** · `tools/inference_anvil_corpus_tools_prefix_view.rish` (`192749`) |
| **greencandy prefix view** | `path_prefix greencandy/` → five-line Skate frame | parity **297** · `tools/inference_anvil_corpus_greencandy_prefix_view.rish` (`193358`) |

## Layout

| Path | Role |
|------|------|
| [`anvil_core.rye`](anvil_core.rye) | Catalog parse + query |
| [`anvil.rye`](anvil.rye) | Selftest |
| [`fixtures/rye_corpus.bron`](fixtures/rye_corpus.bron) | Pinned chunk list |

```bash
rishi/bin/rishi run tools/anvil_corpus_lap1.rish
rishi/bin/rishi run tools/inference_anvil_corpus_view.rish
rishi/bin/rishi run tools/inference_anvil_corpus_prefix_view.rish
rishi/bin/rishi run tools/inference_anvil_corpus_rish_view.rish
rishi/bin/rishi run tools/inference_anvil_corpus_rye_prefix_view.rish
rishi/bin/rishi run tools/inference_anvil_corpus_tools_prefix_view.rish
rishi/bin/rishi run tools/inference_anvil_corpus_greencandy_prefix_view.rish
```

*May the forge train only on what we wrote.*
