# Lattice — Tensors in Tally Gardens

**Language:** EN
**Last updated:** 2026-07-10 (lap 0 `133500`; parity **211**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — lap 0 green (f32 matmul)

---

Lattice holds explicit tensor math in bounded gardens. Build order: **Lattice before Lantern**.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | f32 `Matrix` · shape asserts · matmul 2×2 | parity **211** |
| **1** | Elementwise `add` · shape asserts | parity **217** |

## Layout

| Path | Role |
|------|------|
| [`lattice_core.rye`](lattice_core.rye) | Matrix type, matmul |
| [`lattice.rye`](lattice.rye) | Selftest binary |
| `bin/lattice` | Build output |

```bash
rishi/bin/rishi run tools/lattice_lap1.rish
```

*May the numbers stay honest before the model runs.*
