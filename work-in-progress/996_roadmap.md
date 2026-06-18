# 996 · The Roadmap — Growing the Whole from What Already Works

*A living plan for the work ahead, shaped by one law we hold close: a complex system that works grows from a simpler system that worked. So this roadmap never points straight at the finished, intricate whole. It lays out horizons — what runs now, what comes next, what composes from those, and the ambitious ends — and for each larger system it names the smaller working ones it is made of. We build by growing, and we ship something simple that runs at every step.*

**Language:** EN
**Version:** `20260618.184912` (Rye chronological stamp)
**Last updated:** 2026-06-18
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Voice:** Reya 2
**Lens:** TAME — safety, performance, the joy of the craft; and Gall's Law, that working wholes grow from working parts
**Status:** Living roadmap

---

## The Shape of This Plan

This plan draws its discipline from the active-designing stack: simplicity as single-stranded parts composed (`995`), the method of growing a language from proven ground (`996`), the gates that prove each step (`998`), the architecture the parts compose into (`997`), and the decision that Rye is its own language (`../context/specs/rye-as-its-own-language.md`). Above all it keeps Gall's Law: we reach for the smallest version that works, and let it become the larger one by degrees. No milestone here is built whole from scratch; each grows from the working systems beneath it.

---

## Horizon 0 — What Already Works (the ground we stand on)

These are the simple systems that run today. Everything ahead grows from them.

- **Rye runs** — a Zig-0.16 derivative with its own standard library, its own chronological versioning, the `rye` CLI bridging `.rye` source to the toolchain.
- **The gate trio runs** — `parity.sh` (behavior identical to baseline), `parity-selftest.sh` (the gate turns red on a real divergence), `additive-gate.sh` (a pass changed only assertions and words). Strengthening is now safe by construction.
- **Rishi runs** — a minimal shell interpreter in Rye: comments, `let` of strings and integers, `say` with `${name}` interpolation.

---

## Horizon 1 — Short-Term (the next simple systems, each small and proven)

Each is a thing that runs on its own, added by degrees, behind the gates.

- [ ] **Grow Rishi toward `parity.rish`** — one feature at a time, each shipped working: list values → records → a `run` that returns a structured process result → `map`/`where` → `==` → `assert` as a gate.
- [ ] **Vendor execline** into `gratitude/` (with skalibs) — the near-term, surprise-free orchestration bridge, and a reference to study.
- [ ] **Resume strengthening passes** on the foundational `std` surface we depend on, each through the gate trio, recorded in the strengthening-compiler stack.
- [ ] **A minimal Mantra weave** — overlay, always-succeeding merge, line-provenance — so the strengthening process gains durable memory and survives baseline drift.

---

## Horizon 2 — Medium-Term (compose the simples into larger working systems)

Each milestone here is *made of* the working systems above.

- [ ] **`parity.rish` runs** — made of: Rishi (grown to lists/records/run/assert) + the existing parity logic. The gate, rewritten in our own shell.
- [ ] **Silo v1** — made of: a content-addressed store (grown from the smallest working build of one thing) + a single lawful compose combinator. Describes a simple system reproducibly.
- [ ] **Tally v1** — made of: the process-garden pattern Rye already uses, grown into a named, bounded region allocator with asserted edges.
- [ ] **Caravan v1** — made of: the simplest working supervision (one parent that never dies, one child, restart on fall), grown toward a small tree and chain-loaded startup.
- [ ] **Pond v1** — made of: Caravan v1's isolation **composed with** Tally v1's bounds — one allow-listed path, one resource bound, opened from a policy that is a value (`pond.rish`).

---

## Horizon 3 — Ambitious Milestones (the complex wholes, each grown from the working parts)

The far ends. Each is named with the simpler working systems it is composed of, so the path to it is always a growing, never a leap.

- [ ] **Rye, a genuinely separate language** — made of: the strengthened `std` (Horizon 1) + a growing divergence in syntax and semantics, compiling to RISC-V as a first-class target. Grown from the Zig-derivative, never rewritten from scratch.
- [ ] **The full family, composing through one value model** — made of: Rye + Silo + Rishi + the orchestration language + Mantra, each grown from its v1, sharing one value model so values flow seam-free.
- [ ] **Aurora — the boot on RISC-V** — made of: a minimal working privilege relay, grown stage by stage into a verified, named-value boot from an immutable root.
- [ ] **Pond — a trustworthy daily enclosure** — made of: Pond v1, hardened pass by pass over Caravan's isolation and Tally's gardens, until it is the room our agents work inside.
- [ ] **A self-hosted, RISC-V-cohesive Rye system** — made of: Aurora (boot) + Caravan (kernel) + Tally (memory) + Silo (configuration) + Mantra (memory of the system) + Rishi (the hand) + Pond (the enclosure) — the whole machine, grown from every working part beneath it, belonging wholly to the one who runs it.

---

## The Discipline This Plan Obeys

- **Ship something simple that runs at every step.** A thing that runs, however humble, teaches more than a grand design that does not.
- **Grow; never design the whole from scratch.** Each milestone evolves from the working system before it. When something cannot be grown, we begin again from a simpler thing that works, rather than patching a thing that never lived.
- **Prove each step through the gates.** Behavior preserved, shape additive, divergence caught — green before we compose the next layer.
- **Keep it loose and single-stranded.** Each part about one thing, composed side by side, so any one can be grown or replaced without unweaving the rest.
- **Stay in close touch with what each system is truly for.** We measure by whether the thing actually works for its purpose, not by how finished it looks.

---

## The Immediate Next Step

From Horizon 1, the smallest move that grows the most: **add list values to Rishi**, so `say` can speak a list — the first step of the climb toward `parity.rish`. It is small, it will run, and `parity.rish` is made of it.

---

*May we grow the whole from what already works, and trust each small running thing as it carries the next. May every horizon arrive by degrees, never by a leap. And may the system we are building stay simple enough, at every stage, to be loved, understood, and grown a little further tomorrow.*
