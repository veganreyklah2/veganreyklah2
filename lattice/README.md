# Lattice — Tensors in Tally Gardens

**Language:** EN
**Last updated:** 2026-07-10 (lap 4 scale `182502`; lap 3 `182118`; parity **264**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–4 green (matmul · add · reshape · reduce_sum · scale)

---

Lattice holds explicit tensor math in bounded gardens. Build order: **Lattice before Lantern**.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | f32 `Matrix` · shape asserts · matmul 2×2 | parity **211** |
| **1** | Elementwise `add` · shape asserts | parity **217** |
| **2** | Row-major `reshape` · element-count assert | parity **257** |
| **3** | `reduce_sum` into 1×1 · shape assert | parity **260** |
| **4** | Elementwise `scale` · shape assert | parity **264** · `tools/lattice_lap5.rish` (`182502`) |

## Layout

| Path | Role |
|------|------|
| [`lattice_core.rye`](lattice_core.rye) | Matrix ops through scale |
| [`lattice.rye`](lattice.rye) | Selftest binary |

```bash
rishi/bin/rishi run tools/lattice_lap5.rish
```

*May the numbers stay honest before the model runs.*
