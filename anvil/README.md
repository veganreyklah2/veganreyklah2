# Anvil — The Local Forge

**Language:** EN
**Last updated:** 2026-07-10 (corpus lap 0 `133500`; parity **214**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — corpus lap 0 green; LoRA/training horizon

---

Anvil names training and fine-tuning on our own corpus. Lap 0 catalogs `.rye` / `.rish` chunks from **our tree only** — no gratitude/vendor bytes.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0 (corpus)** | Chunk catalog · kind counts · unwelcome incomplete chunk | parity **214** |
| **1 (query)** | Optional `kind` + `path_prefix` filter · overflow refused | parity **216** |

## Layout

| Path | Role |
|------|------|
| [`anvil_core.rye`](anvil_core.rye) | Corpus catalog parse |
| [`anvil.rye`](anvil.rye) | Selftest binary |
| [`fixtures/rye_corpus.bron`](fixtures/rye_corpus.bron) | Pinned chunk list |

```bash
rishi/bin/rishi run tools/anvil_corpus_lap1.rish
```

*May the forge learn only from ground we own.*
