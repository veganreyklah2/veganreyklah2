# Scribble — Markdown as Values

**Language:** EN
**Last updated:** 2026-07-10 (lap 3 headings + outline view `182118`; parity **261**/**262**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–3 green (parse · rye/rish snippets · headings)

---

Scribble turns human prose into block values — headings, paragraphs, and fenced code with `rye_fence` / `rish_fence` kinds for corpus work. Heading extract feeds the outline Skate view.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Headings · paragraphs · rye/rish fences · unwelcome unclosed fence | parity **212** |
| **1** | `extract_rye_snippets` from session fixture · overflow refused | parity **218** |
| **2** | `extract_rish_snippets` from session fixture · overflow refused | parity **253** · `tools/scribble_lap3.rish` |
| **3** | `extract_headings` · outline Skate view | parity **261**/**262** · `tools/scribble_lap4.rish` · `tools/inference_scribble_view.rish` (`182118`) |

## Layout

| Path | Role |
|------|------|
| [`scribble_core.rye`](scribble_core.rye) | Parse walk, snippet + heading extract |
| [`scribble.rye`](scribble.rye) | Selftest binary |
| [`fixtures/sample.md`](fixtures/sample.md) | Pinned sample |
| [`fixtures/session_snippets.md`](fixtures/session_snippets.md) | Rye training fences |
| [`fixtures/session_rish_snippets.md`](fixtures/session_rish_snippets.md) | Rish training fences |
| [`fixtures/outline.md`](fixtures/outline.md) | Heading outline for view |
| `pond/apps/scribble/scribble_core.rye` | Symlink for drawn-terminal import |

```bash
rishi/bin/rishi run tools/scribble_lap4.rish
rishi/bin/rishi run tools/inference_scribble_view.rish
```

*May what we write become values the stack can diff and render.*
