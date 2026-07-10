# Scribble — Markdown as Values

**Language:** EN
**Last updated:** 2026-07-10 (fence kinds view `190319`; parity **278**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–5 green (parse · rye/rish snippets · headings · paragraphs · fence kinds)

---

Scribble turns human prose into block values — headings, paragraphs, and fenced code with `rye_fence` / `rish_fence` kinds for corpus work. Heading extract feeds the outline Skate view; paragraph extract gathers prose bodies in source order; fence-kinds count folds rye/rish/plain tallies for the fence Skate view.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Headings · paragraphs · rye/rish fences · unwelcome unclosed fence | parity **212** |
| **1** | `extract_rye_snippets` from session fixture · overflow refused | parity **218** |
| **2** | `extract_rish_snippets` from session fixture · overflow refused | parity **253** · `tools/scribble_lap3.rish` |
| **3** | `extract_headings` · outline Skate view | parity **261**/**262** · `tools/scribble_lap4.rish` · `tools/inference_scribble_view.rish` |
| **4** | `extract_paragraphs` · overflow refused | parity **270** · `tools/scribble_lap5.rish` |
| **paragraphs view** | Prose bodies → five-line Skate frame | parity **273** · `tools/inference_scribble_para_view.rish` |
| **5** | `count_fence_kinds` · rye/rish/plain tallies | `tools/scribble_lap6.rish` |
| **fence kinds view** | rye/rish/plain counts → five-line Skate frame | parity **278** · `tools/inference_scribble_fence_view.rish` (`190319`) |

## Layout

| Path | Role |
|------|------|
| [`scribble_core.rye`](scribble_core.rye) | Parse walk, snippet + heading + paragraph extract, fence-kinds count |
| [`scribble.rye`](scribble.rye) | Selftest binary |
| [`fixtures/sample.md`](fixtures/sample.md) | Pinned sample |
| [`fixtures/session_snippets.md`](fixtures/session_snippets.md) | Rye training fences |
| [`fixtures/session_rish_snippets.md`](fixtures/session_rish_snippets.md) | Rish training fences |
| [`fixtures/outline.md`](fixtures/outline.md) | Heading + paragraph outline |
| [`fixtures/fence_kinds.md`](fixtures/fence_kinds.md) | One rye · one rish · one plain fence |
| `pond/apps/scribble/scribble_core.rye` | Symlink for drawn-terminal import |

```bash
rishi/bin/rishi run tools/scribble_lap5.rish
rishi/bin/rishi run tools/scribble_lap6.rish
rishi/bin/rishi run tools/inference_scribble_view.rish
rishi/bin/rishi run tools/inference_scribble_para_view.rish
rishi/bin/rishi run tools/inference_scribble_fence_view.rish
```

*May what we write become values the stack can diff and render.*
