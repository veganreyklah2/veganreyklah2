# Lattice — Tensors in Tally Gardens

**Language:** EN
**Last updated:** 2026-07-10 (lap 3 reduce_sum `182118`; lap 2 `181653`; parity **260**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–3 green (matmul · add · reshape · reduce_sum)

---

Lattice holds explicit tensor math in bounded gardens. Build order: **Lattice before Lantern**.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | f32 `Matrix` · shape asserts · matmul 2×2 | parity **211** |
| **1** | Elementwise `add` · shape asserts | parity **217** |
| **2** | Row-major `reshape` · element-count assert | parity **257** · `tools/lattice_lap3.rish` |
| **3** | `reduce_sum` into 1×1 · shape assert | parity **260** · `tools/lattice_lap4.rish` (`182118`) |

## Layout

| Path | Role |
|------|------|
| [`lattice_core.rye`](lattice_core.rye) | Matrix type, matmul, add, reshape, reduce_sum |
| [`lattice.rye`](lattice.rye) | Selftest binary |
| `bin/lattice` | Build output |

```bash
rishi/bin/rishi run tools/lattice_lap4.rish
```

*May the numbers stay honest before the model runs.*
