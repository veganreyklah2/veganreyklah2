# Lattice — Tensors in Tally Gardens

**Language:** EN
**Last updated:** 2026-07-10 (lap 13 abs `200819`; parity **303**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–13 green (matmul · add · reshape · reduce_sum · scale · transpose · mul · fill · copy · sub · neg · div · reduce_mean · abs)

---

Lattice holds explicit tensor math in bounded gardens. Build order places **Lattice before Lantern**, so every matmul that serves a model has already met the parity gate.

| Lap | Claim | Witness |
|-----|--------|---------|
| **0** | f32 `Matrix` · shape asserts · matmul 2×2 | parity **211** |
| **1** | Elementwise `add` · shape asserts | parity **217** |
| **2** | Row-major `reshape` · element-count assert | parity **257** |
| **3** | `reduce_sum` into 1×1 · shape assert | parity **260** |
| **4** | Elementwise `scale` · shape assert | parity **264** · `tools/lattice_lap5.rish` |
| **5** | `transpose` · shape assert | parity **268** · `tools/lattice_lap6.rish` |
| **6** | Elementwise `mul` · shape assert | parity **272** · `tools/lattice_lap7.rish` |
| **7** | `fill` with constant · shape assert | parity **276** · `tools/lattice_lap8.rish` |
| **8** | `copy` · shape assert | parity **280** · `tools/lattice_lap9.rish` |
| **9** | Elementwise `sub` · shape assert | parity **284** · `tools/lattice_lap10.rish` (`191112`) |
| **10** | Elementwise `neg` · shape assert | parity **291** · `tools/lattice_lap11.rish` (`192749`) |
| **11** | Elementwise `div` · shape assert · zero refuse | parity **295** · `tools/lattice_lap12.rish` (`193358`) |
| **12** | `reduce_mean` into 1×1 · shape assert | parity **299** · `tools/lattice_lap13.rish` (`200203`) |
| **13** | Elementwise `abs` · shape assert | parity **303** · `tools/lattice_lap14.rish` (`200819`) |

## Layout

| Path | Role |
|------|------|
| [`lattice_core.rye`](lattice_core.rye) | Matrix ops through abs |
| [`lattice.rye`](lattice.rye) | Selftest binary |

```bash
rishi/bin/rishi run tools/lattice_lap14.rish
```

*May the numbers stay honest before the model runs.*
