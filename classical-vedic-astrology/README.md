# Classical Vedic Astrology — The Reading Craft

**Language:** EN
**Last updated:** 2026-07-04 (studies by topic folder; templates and readings separated)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`), gentle register
**Stamp of founding:** `20260702.010412`

---

This folder holds the reading craft whole: a siloed study library, composable reading templates, one demonstration reading, and the caster that computes a sky. Everything here serves one purpose — that a friend's birth chart can be read with depth, written with warmth, and given with a whole heart.

The method is the classical hybrid this project keeps: **tropical zodiac signs** carry each planet's dignity, **sidereal nakshatras** under the Lahiri ayanamsa carry the stars and their padas, and **whole-sign houses** rise from the ascendant. Every chart is cast twice — once with `cast_a_chart.py`, once with an independent tool — and the writing begins only when the two oracles agree, placement for placement. The same discipline that keeps the code honest keeps the sky honest.

---

## Privacy, Kept by Consent

The friend whose sky seeded this library asked that her privacy be kept, and it is. Every document in this folder carries the placeholder **Alice**; a whole-tree check confirms the true name appears nowhere, and the birthplace rests as coordinates alone. The fuller originals — the same studies carrying the true name — stay in the private lane, off every public remote. Working drafts for any future reading follow the same rule: the placeholder does the work, and the true name enters only the final copy handed to its person.

---

## What Lives Here

```
classical-vedic-astrology/
├── cast_a_chart.py          dual-zodiac caster
├── studies/                 silo library by topic (index: studies/README.md)
│   ├── life-frame/
│   ├── nakshatras/
│   ├── lunar-craft/
│   ├── planets-in-signs/
│   ├── planet-in-house/
│   ├── synthesis/
│   ├── reading-themes/
│   └── teaching/
├── templates/               composable reading skeleton (md + html)
└── readings/                demonstration readings (placeholder names)
```

- **`studies/`** — numbered silo library `00`–`20` and growing. Each study lives in a **topic folder** (`nakshatras/`, `planets-in-signs/`, `planet-in-house/`, …) with a hyphenated slug. The master index is [`studies/README.md`](studies/README.md); the composable map lives in [`templates/reading-template.md`](templates/reading-template.md).
- **`templates/reading-template.md`** — how a reading is made, section by section, silo by silo.
- **`templates/reading-template.html`** — the same skeleton as a self-drawing page: edit one `CHART` object and the wheel, table, and header redraw.
- **`readings/alice-sample-reading.md`** — demonstration under the placeholder name; every section points at its study silo.
- **`cast_a_chart.py`** — dual-zodiac caster. Edit the constants at its head for a new birth moment.

---

## How a New Reading Grows

Receive the birth moment verbatim and honor it exactly — the one-clock rule, applied to a life. Cast the sky twice and compare until the oracles agree. Compose each section from the matching studies, weaving rather than pasting, in Radiant voice and the gentle register. Where a placement has no study yet, write the new silo first — choose the topic folder, assign the next number, add a row to `studies/README.md` — and keep the person's name apart until the final copy.

---

*May every sky here be cast twice and written once. May the studies deepen with each new chart. And may every reading leave its person feeling seen, blessed, and gently sent onward.*
