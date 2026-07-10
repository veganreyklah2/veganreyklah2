# Greencandy — Centralized Books of Record

**Language:** EN
**Last updated:** 2026-07-10 (exception view `182502`; lap 3 sight `132548`; parity **267**)
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Checkable-room module — laps 1–3 green; sight view unifies carriage + books

---

Greencandy is Linengrow's **centralized books**: one steward's chart of accounts, journal entries as facts, balances as a pure fold, reports as projections, and a Skate view so the books can be *seen*. It complements **MALA** (mailable money) rather than replacing it.

| Lap | Claim | Witness |
|-----|--------|---------|
| **1** | Chart · journal · trial-balance fold · unwelcome paths · Skate books view | parity **207** / **208** |
| **2** | Income statement · balance sheet · exception queue | parity **209** |
| **3** | Sight view — books P&L/BS on Skate + unified carriage+books frame | parity **210** |
| **exception view** | Refused drafts → five-line Skate frame | parity **267** · `tools/greencandy_exception_view.rish` (`182502`) |

## Layout

| Path | Role |
|------|------|
| [`greencandy_core.rye`](greencandy_core.rye) | Chart, parse, fold, reports, exceptions |
| [`greencandy.rye`](greencandy.rye) | Selftest binary |
| [`fixtures/journal.bron`](fixtures/journal.bron) | Pinned welcome journal |
| `bin/greencandy` | Build output |

```bash
rishi/bin/rishi run tools/greencandy_lap1.rish
rishi/bin/rishi run tools/greencandy_lap2.rish
rishi/bin/rishi run tools/greencandy_books_view.rish
rishi/bin/rishi run tools/greencandy_sight_view.rish
```

**Design:** hammock [`../active-designing/20260710-125953_greencandy-hammock.md`](../active-designing/20260710-125953_greencandy-hammock.md) · lap 2 [`../active-designing/20260710-131212_greencandy-lap2-reports.md`](../active-designing/20260710-131212_greencandy-lap2-reports.md) · lap 3 sight [`../active-designing/20260710-132548_greencandy-lap3-sight-view.md`](../active-designing/20260710-132548_greencandy-lap3-sight-view.md) · horizon [`../external-research/20260710-131956_seen-books-living-desktop-horizon.md`](../external-research/20260710-131956_seen-books-living-desktop-horizon.md)

---

*May the books stay foldable. May green mean the trial balance closed.*
