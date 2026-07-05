# A Birth-Chart Reading — The Composable Template

*One skeleton for every new reading. Fill the brackets, verify the sky twice, compose each section from the study silos, and close with a blessing. The person's true name lives only in the copy you hand them; the working copies carry a placeholder, so the craft stays portable and the person stays private.*

**Stamp:** `20260701.232912`
**Style:** Radiant (see `RADIANT_STYLE.md`), gentle register throughout
**Companions:** [`../cast_a_chart.rish`](../cast_a_chart.rish) (the computation), the numbered study silos in [`studies/`](../studies/) (`00`–`20` and those yet to come; index at [`studies/README.md`](../studies/README.md)), [`../../context/SILO_TECHNIQUE.md`](../../context/SILO_TECHNIQUE.md)

*Written together by Kaeden and Reya 2; shaped into a template with the outside reading (Fable 5) at Kaeden's direction.*

---

## How a Reading Is Made

**First, receive the birth moment verbatim.** Date, clock time, time zone, and birthplace come from the person and are honored exactly as given — the one-clock rule of the whole project, applied to a life.

**Second, cast the sky twice.** Edit the constants at the head of [`../cast_a_chart.py`](../cast_a_chart.py) and run [`../cast_a_chart.rish`](../cast_a_chart.rish) from the repository root: tropical signs for dignity, sidereal Lahiri longitudes for nakshatra and pada, whole-sign houses rising from the ascendant. Then cast the same moment with one independent tool and compare, placement by placement. Two oracles that agree make a chart worth writing about; the writing begins only when they do.

**Third, compose from the silos.** Each placement points at one or more numbered studies. The silo carries the depth; the reading carries the person. Weave, rather than paste — the studies are understanding to draw on, never text to copy.

**Fourth, keep the name apart.** Working drafts carry a placeholder such as Alice. The true name enters only the final copy given to the person, and gratitude to teachers lives in its own honored space rather than inside the reading.

---

## The Skeleton

# [NAME]'s Sky — A Friendly Reading of Your Birth Chart

**For:** [NAME] — with love
**Born:** [DAY MONTH YEAR] · [TIME] · [PLACE] ([LAT], [LON], [TZ])
**System:** Classical hybrid — tropical zodiac signs · sidereal nakshatras (Lahiri) · whole-sign houses
**Lens:** [the devotional or guiding lens chosen for this reading]
**Stamped:** [YYYYMMDD.HHMMSS] UDT

### Your chart, exactly as the sky drew it

| Light | Tropical sign | Degree | Nakshatra | Pada | House |
|-------|---------------|--------|-----------|------|-------|
| Ascendant | [sign] | [d°mm'] | [star] | [1–4] | 1 |
| Sun | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Moon | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Mercury | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Venus | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Mars | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Jupiter | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Saturn | [sign] | [d°mm'] | [star] | [1–4] | [n] |
| Rahu | [sign] ℞ | [d°mm'] | [star] | [1–4] | [n] |
| Ketu | [sign] ℞ | [d°mm'] | [star] | [1–4] | [n] |

### Before we begin — a little map of the map
*One gentle paragraph naming the three lenses — sign, star, house — so the reader always knows which light is speaking.*

### The first lens — [rising sign], in the star [nakshatra][, with any 1st-house guest]
*Composed from the ascendant silos and the star's own study.*

### The second lens — your Moon, the steady heart
*Composed from the Moon-sign silo, the birth-star silo, and the lunar-day weave.*

### The third lens — four aims, four seasons, and where you stand
*Composed from [`studies/life-frame/four-asramas-and-goals-of-life.md`](../studies/life-frame/four-asramas-and-goals-of-life.md), mapped onto this chart's houses.*

### The rest of your sky — the other lights, one at a time
*One warm paragraph per remaining placement, each drawing its depth from the matching silo. Where a silo has yet to be written, name the placement plainly and add the study to the library before the final copy ships.*

### A few words, gently gathered
*The whole sky in one held breath — what the strongest placements agree on.*

### A blessing to carry
*Three clauses, affirmative, breath-paused, opening outward.*

---

## The Silo Map, Growing

| Placement pattern | Study silo |
|-------------------|-----------|
| Life-stage frame, four aims | `studies/life-frame/four-asramas-and-goals-of-life.md` |
| Nakshatra guardians (Ashvini, Bharani) | `studies/nakshatras/nakshatra-gods-asvins-and-yama.md` |
| Ashvini | `studies/nakshatras/asvini.md` |
| Bharani | `studies/nakshatras/bharani.md` |
| Lunar day and birth star together | `studies/lunar-craft/lunar-day-and-birth-star.md` |
| Moon exalted in Taurus | `studies/planets-in-signs/moon-in-taurus-exalted.md` |
| Venus in Gemini | `studies/planets-in-signs/venus-in-gemini.md` |
| Venus in the 8th | `studies/planet-in-house/venus-in-eighth-house.md` |
| Purva Phalguni | `studies/nakshatras/purva-phalguni.md` |
| Mercury in Virgo in the 11th | `studies/planet-in-house/mercury-in-virgo-in-the-11th.md` |
| Jupiter in Virgo in the 11th | `studies/planet-in-house/jupiter-in-virgo-in-the-11th.md` |
| Mercury with Jupiter | `studies/synthesis/mercury-and-jupiter-together.md` |
| Devotion, patience, partnership themes | `studies/reading-themes/devotion-patience-and-partnership.md` |
| Sun in Leo | `studies/planets-in-signs/sun-in-leo.md` |
| Ashlesha | `studies/nakshatras/ashlesha.md` |
| Sun in the 10th | `studies/planet-in-house/sun-in-the-10th-house.md` |
| Mars in Leo | `studies/planets-in-signs/mars-in-leo.md` |
| Saturn in Cancer | `studies/planets-in-signs/saturn-in-cancer.md` |
| Saturn in the 9th | `studies/planet-in-house/saturn-in-the-9th-house.md` |
| Government as planetary spectrum (teaching) | `studies/teaching/government-as-planetary-spectrum.md` |
| Liberal and conservative planets (teaching) | `studies/teaching/liberal-and-conservative-planets.md` |

### Brooke reading — chapter silos (`20260705.020812`)

| Chapter | Silo |
|---------|------|
| Season and three paths | `readings/20260705-020812_brooke-season-and-three-paths.md` |
| Placements table | `readings/20260705-020812_brooke-placements.md` |
| Foundation (dharma, D9) | `readings/20260705-020812_brooke-foundation.md` |
| Ascendant | `readings/20260705-020812_brooke-ascendant.md` |
| Sun | `readings/20260705-020812_brooke-sun.md` |
| Moon | `readings/20260705-020812_brooke-moon.md` |
| Venus | `readings/20260705-020812_brooke-venus.md` |
| Mercury | `readings/20260705-020812_brooke-mercury.md` |
| Jupiter | `readings/20260705-020812_brooke-jupiter.md` |
| Saturn | `readings/20260705-020812_brooke-saturn.md` |
| Rahu and Ketu | `readings/20260705-020812_brooke-nodes.md` |
| Yogas | `readings/20260705-020812_brooke-yogas.md` |
| Stars | `readings/20260705-020812_brooke-stars.md` |
| Almanac day | `readings/20260705-020812_brooke-almanac-day.md` |
| Three paths braid | `readings/20260705-020812_brooke-three-paths.md` |
| Full reading (composed) | `readings/20260705-020812_brooke-reading.md` |
| Two-wheel HTML template | `templates/20260705-020812_reading-template.html` |

New placements earn the next number, a topic folder, a hyphenated filename, and a row here — see [`studies/README.md`](../studies/README.md).

---

*May every chart be cast twice and written once. May the silos deepen with each new sky. And may every reading leave its person feeling seen, blessed, and gently sent onward.*
