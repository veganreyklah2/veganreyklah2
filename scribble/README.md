# Scribble — Markdown as Values

**Language:** EN
**Last updated:** 2026-07-10 (lap 1 snippet extract `134800`; parity **218**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — lap 0 green (CommonMark subset)

---

Scribble turns human prose into block values — headings, paragraphs, and fenced code with `rye_fence` / `rish_fence` kinds for corpus work.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | Headings · paragraphs · rye/rish fences · unwelcome unclosed fence | parity **212** |
| **1** | `extract_rye_snippets` from session fixture · overflow refused | parity **218** |

## Layout

| Path | Role |
|------|------|
| [`scribble_core.rye`](scribble_core.rye) | Parse walk, inline block storage |
| [`scribble.rye`](scribble.rye) | Selftest binary |
| [`fixtures/sample.md`](fixtures/sample.md) | Pinned sample |

```bash
rishi/bin/rishi run tools/scribble_lap1.rish
```

*May what we write become values the stack can diff and render.*
