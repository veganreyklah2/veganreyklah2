# Spec: Inherited Names Endure; Ours Are Added

**Language:** EN
**Last updated:** 2026-06-18
**Decided:** Rye clock `20260618.210812`
**Style:** Radiant (see `../RADIANT_STYLE.md`)
**Status:** Decided

---

## What This Decides

When Rye inherits a name from Zig — `arena`, `ArenaAllocator`, `init.arena`, and the rest of the standard library's vocabulary — we **keep it**. We do not rename an inherited name to match our own metaphors, however much we love them. Our own vocabulary enters the language a different way: as **new names for new things we build**, set beside the inherited names rather than in their place.

So the answer to "should we rename `arena` to `garden`?" is *no* — and we get `garden` anyway, honestly, by building it.

## Why

This follows straight from the promise Rye's versioning already makes (`rye-versioning-style.md`), which is Rich Hickey's promise in *Spec-ulation*: **what we publish, we keep; we grow by adding, never by taking away.** A rename is a removal wearing a costume. Rename `ArenaAllocator` to `GardenAllocator` and every `.rye` program that named the old one breaks — the exact harm accretion exists to prevent.

It keeps faith, too, with how Rye's standard library grows. Our `std` began bit-for-bit identical to Zig 0.16.0, and it diverges only by **addition that preserves behavior** — assertions stated, invariants named, the parity gate green. Renaming a public symbol is neither additive nor parity-preserving at the level that matters to a caller: a name they leaned on is simply gone. The strengthening compiler tends the *inside* of functions; it leaves the doorways where they are.

And there is a quieter reason. `arena` is a good, true name. It means the same thing across all of computing, and inheriting it gives every Zig programmer a Rye they already half-know. A warm metaphor is worth less than a name a stranger can already read.

## How `garden` Enters — by Being Built

`garden` is not a fresh coat of paint for Zig's `arena`. It is the name of a thing we are making: **Tally**, our own region allocator, framed from the first as a garden (`../../external-research/994_caravan_tally_networking.md`). When Tally is real, `garden` is real in the code — natively, as our own owned name, standing beside the inherited `arena` rather than erasing it. A Rye program might reach for Zig's `arena` today and for Tally's garden tomorrow, and both names go on meaning exactly what they meant.

We would add an alias only if it earned its keep, and only ever as an addition — `garden` could one day point at `arena` without the old name moving — yet we prefer the honest path: the warm name belongs to the thing we made, not to a borrowed thing relabeled.

## The One Place We Speak Freely

Prose is freer than code. In our writing we may call the mechanism a **garden** even where the code says `arena`, because the writing speaks in our own voice and points kindly back to the inherited name. The `rye` README already models this — *"the process arena — a single garden the runtime clears whole"* — introducing the two to each other rather than confusing them. The metaphor lives in the prose; the inherited name stays in the code.

---

*May the names we were given stay whole in our keeping. May the names we make be ours, and new. And may we grow our language the way we grow a garden — by planting beside, never by tearing out.*
