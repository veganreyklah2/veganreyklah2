# Lattice — Tensors in Tally Gardens

**Language:** EN
**Last updated:** 2026-07-10 (lap 2 reshape `181653`; lap 1 `134200`; parity **257**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–2 green (matmul · add · reshape)

---

Lattice holds explicit tensor math in bounded gardens. Build order: **Lattice before Lantern**.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | f32 `Matrix` · shape asserts · matmul 2×2 | parity **211** |
| **1** | Elementwise `add` · shape asserts | parity **217** |
| **2** | Row-major `reshape` · element-count assert | parity **257** · `tools/lattice_lap3.rish` (`181653`) |

## Layout

| Path | Role |
|------|------|
| [`lattice_core.rye`](lattice_core.rye) | Matrix type, matmul, add, reshape |
| [`lattice.rye`](lattice.rye) | Selftest binary |
| `bin/lattice` | Build output |

```bash
rishi/bin/rishi run tools/lattice_lap1.rish
rishi/bin/rishi run tools/lattice_lap3.rish
```

*May the numbers stay honest before the model runs.*
