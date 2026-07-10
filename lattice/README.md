# Lattice — Tensors in Tally Gardens

**Language:** EN
**Last updated:** 2026-07-10 (lap 25 tanh · gelu `215613`; parity **347**/**351**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 0–25 green (ops through tanh · gelu)

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
| **14** | Elementwise `clamp` · shape assert | parity **307** · `tools/lattice_lap15.rish` (`211930`) |
| **15** | `reduce_max` into 1×1 · shape assert | parity **311** · `tools/lattice_lap16.rish` (`211930`) |
| **16** | `reduce_min` into 1×1 · shape assert | parity **315** · `tools/lattice_lap17.rish` (`212715`) |
| **17** | Elementwise `sqrt` · negative refuse | parity **319** · `tools/lattice_lap18.rish` (`212715`) |
| **18** | Elementwise `exp` · shape assert | parity **323** · `tools/lattice_lap19.rish` (`213317`) |
| **19** | Elementwise `log` · non-positive refuse | parity **327** · `tools/lattice_lap20.rish` (`213317`) |
| **20** | Elementwise `pow` · negative refuse | parity **331** · `tools/lattice_lap21.rish` (`213738`) |
| **21** | Elementwise `relu` · shape assert | parity **335** · `tools/lattice_lap22.rish` (`213738`) |
| **22** | Elementwise `sigmoid` · shape assert | parity **339** · `tools/lattice_lap23.rish` (`214145`) |
| **23** | Row-wise `softmax` · shape assert | parity **343** · `tools/lattice_lap24.rish` (`214145`) |
| **24** | Elementwise `tanh` · shape assert | parity **347** · `tools/lattice_lap25.rish` (`215613`) |
| **25** | Elementwise `gelu` (tanh approx) · shape assert | parity **351** · `tools/lattice_lap26.rish` (`215613`) |

## Layout

| Path | Role |
|------|------|
| [`lattice_core.rye`](lattice_core.rye) | Matrix ops through tanh · gelu |
| [`lattice.rye`](lattice.rye) | Selftest binary |

```bash
rishi/bin/rishi run tools/lattice_lap25.rish
rishi/bin/rishi run tools/lattice_lap26.rish
```

*May the numbers stay honest before the model runs.*
