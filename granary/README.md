# Granary — weave-sharing surface

**Language:** EN
**Stamp:** `20260710.164944`
**Status:** Landed — laps 1–4 + Skate weave view; Exchange waits
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)

**Granary** is the place where signed weaves are named, shared, mirrored, and optionally sold — every artist a node. Four doors on one log: Identity · Namespace · Sharing · Exchange.

| Lap | What |
|-----|------|
| **1 (landed)** | Signed name-fact registry; resolve `person/weave`; clone by folding resins; Scribble front page → drawn frame; lying signature refused |
| **Weave view (landed)** | Same fold onto Skate via `granaryviewtest` — seven-line citizen's window |
| **2 (landed)** | Write gate — durable `publish` + reload; prior immutable; exact replay and lying publish refused |
| **3 (landed)** | Sharing door (in-process) — host `serve_resin`; guest `mirror_weave`; mirrors equal |
| **4 (landed)** | Sharing over Comlink — Amphora fetch-by-digest wire reused; ports **38496**/**38497**; guest mirrors host |

**Not this room:** Amphora vessel market floor parks as **Mandi**. Exchange (MALA / WOV payments) waits. Device wire and name-fact federation wait.

**Ground:** seating [`context/specs/20260710-163043_granary-name-seated.md`](../context/specs/20260710-163043_granary-name-seated.md) · study [`external-research/20260703-182612_the-granary-question.md`](../external-research/20260703-182612_the-granary-question.md)

**Witnesses:** lap1 **232** · weave view **233** · lap2 **234** · lap3 **235** · resin wire **236** (`tools/granary_resin_wire.rish`)

```bash
rishi/bin/rishi run tools/granary_lap1.rish
rishi/bin/rishi run tools/granary_weave_view.rish
rishi/bin/rishi run tools/granary_lap2.rish
rishi/bin/rishi run tools/granary_lap3.rish
rishi/bin/rishi run tools/granary_resin_wire.rish
```

*May the namespace never forget a name. May every mirror be equal.*
