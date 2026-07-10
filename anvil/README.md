# Anvil — The Local Forge

**Language:** EN
**Last updated:** 2026-07-10 (corpus view `181653`; query lap 1 `134200`; parity **259**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — corpus catalog + query + Skate view green; LoRA/training horizon

---

Anvil names training and fine-tuning on our own corpus. Lap 0 catalogs `.rye` / `.rish` chunks from **our tree only** — no gratitude/vendor bytes. Query filters by kind and path prefix. Corpus view folds rye hits onto Skate.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0 (corpus)** | Chunk catalog · kind counts · unwelcome incomplete chunk | parity **214** |
| **1 (query)** | Optional `kind` + `path_prefix` filter · overflow refused | parity **216** |
| **view** | Rye query hits → six-line Skate frame | parity **259** · `tools/inference_anvil_corpus_view.rish` (`181653`) |

## Layout

| Path | Role |
|------|------|
| [`anvil_core.rye`](anvil_core.rye) | Corpus catalog parse + query |
| [`anvil.rye`](anvil.rye) | Selftest binary |
| [`fixtures/rye_corpus.bron`](fixtures/rye_corpus.bron) | Pinned chunk list |
| `pond/apps/anvil/anvil_core.rye` | Symlink for drawn-terminal import |

```bash
rishi/bin/rishi run tools/anvil_corpus_lap1.rish
rishi/bin/rishi run tools/inference_anvil_corpus_view.rish
```

*May the forge learn only from ground we own.*
