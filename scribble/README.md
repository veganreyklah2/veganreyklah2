# Scribble — Markdown as Values

**Language:** EN
**Last updated:** 2026-07-10 (lap 2 rish extract `180747`; lap 1 `134800`; parity **253**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–2 green (parse · rye snippets · rish snippets)

---

Scribble turns human prose into block values — headings, paragraphs, and fenced code with `rye_fence` / `rish_fence` kinds for corpus work.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Headings · paragraphs · rye/rish fences · unwelcome unclosed fence | parity **212** |
| **1** | `extract_rye_snippets` from session fixture · overflow refused | parity **218** |
| **2** | `extract_rish_snippets` from session fixture · overflow refused | parity **253** · `tools/scribble_lap3.rish` (`180747`) |

## Layout

| Path | Role |
|------|------|
| [`scribble_core.rye`](scribble_core.rye) | Parse walk, inline block storage, kind-scoped snippet extract |
| [`scribble.rye`](scribble.rye) | Selftest binary |
| [`fixtures/sample.md`](fixtures/sample.md) | Pinned sample |
| [`fixtures/session_snippets.md`](fixtures/session_snippets.md) | Rye training fences |
| [`fixtures/session_rish_snippets.md`](fixtures/session_rish_snippets.md) | Rish training fences |

```bash
rishi/bin/rishi run tools/scribble_lap1.rish
rishi/bin/rishi run tools/scribble_lap3.rish
```

*May what we write become values the stack can diff and render.*
