# Puddle — Sandboxed Rye OS Environments (Exploration)

*A research note on a possible VM layer: many isolated Rye wholes — each with its own Pond, Kumara keys, and module graph — running as state-as-snapshot containers, sealed for Amber the way our archive contract demands rather than as opaque tarballs.*

**Stamp:** `20260702.035018`
**Language:** EN
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Status:** Exploration — external research only; no implementation
**Companions:** [`context/specs/20260701-221512_amber-functional-spec.md`](../context/specs/20260701-221512_amber-functional-spec.md) · [`active-designing/20260702-031312_modules-aspects-and-mailable-money.md`](../active-designing/20260702-031312_modules-aspects-and-mailable-money.md)

*Named by Kaeden (`2026-07-02`). Puddle is a small word for many bounded worlds — each whole, each shallow from the host's view, each deep to the agent inside.*

---

## The shape we are exploring

**Puddle** would be our own VM orchestration layer for **Rye OS sandbox containers**:

- Each container carries a **full Rye environment** — Caravan supervision discipline, a **sandboxed Pond** with policy-as-value, and a **Kumara keypair** scoped to that world.
- **State is a snapshot** — the whole machine image plus the append-only logs that fold into it — exportable, verifiable, and restorable through Amber's three verbs (export / verify / restore).
- The host runs many Puddles side by side without sharing memory or identity across the waterline.

This is not Pond itself. Pond is the enclosure aspect inside a running whole. **Puddle** is the layer that *hosts* many Ponds — the way a host runs many QEMU guests, yet each guest believes it owns the machine.

---

## Three gratitude lineages (concepts only)

| Source | What we study | What we borrow into our vocabulary |
|--------|---------------|-------------------------------------|
| **Urbit** — pier / ship / desk | A pier is a persistent identity world; Clay desks version code; `%sandbox` desk is an isolated workspace merged from `%base` ([Urbit filesystem docs](https://docs.urbit.org/user-manual/os/filesystem)) | One **identity per container**, revision-controlled interior, explicit merge from a golden base — not the Urbit stack itself |
| **Urbit Fleet** ([github.com/urbit/fleet](https://github.com/urbit/fleet)) | Scripts to spawn and federate many testnet ships | **Fleet orchestration** — start N isolated worlds, wire them for test — adapted as Caravan-supervised child processes or VMs, not Nock |
| **KVM / QEMU** | Hardware virtualisation; snapshot, restore, live migration | **Snapshot semantics** — pause, seal state, resume — the mechanical floor under Amber-compatible export |
| **rust-vvm** (research) | Rust-native virtual machine tooling in the ecosystem | A **Rust seam candidate** for the hypervisor host path — identity-bearing frontier work stays Rust until Rye proves the ring; study only, no link |

Clean-room rule holds: we read public docs and study design; Puddle's implementation enters through `active-designing/` in our words only.

---

## Amber-compatible snapshots (not tar and zip)

Amber asks for **bit-faithful, signed, verifiable** archives — not convenience bundles that hide corruption.

Explored families (external names for gratitude only):

| Approach | Strength | Fit for Puddle + Amber |
|----------|----------|-------------------------|
| **Content-addressed sealed records** (our Amber contract) | Export / verify / restore on two paths; Kumara-signed | **Primary** — same shape as Mantra log slices and package bodies |
| **Zstandard framed streams** | Fast, checksum-friendly, streamable | Compression **inside** the sealed record, not as the trust boundary |
| **Filesystem send/receive** (e.g. btrfs) | Block-level incremental snapshots | Host seam for **live** snapshot; still wrapped in Amber verify on export |
| **Restic / casync-style** | Dedup, incremental | Study for **incremental** export; must still fold to content-named stones in Tablecloth |
| **tar / zip** | Universal | **Not** the trust boundary — opaque bags; at most a transport wrapper around an already-verified seal |

The TAME-guided archive is: **fold state → seal with Kumara → content-name in Tablecloth → verify on two paths → restore as log replay**. Puddle snapshots should export that shape, not a opaque blob alone.

---

## Module map (exploration)

| Piece | Role in Puddle |
|-------|----------------|
| **Caravan** | Supervises Puddle host and child lifetimes |
| **Pond** | Enclosure inside each container — policy bounds what runs |
| **Kumara** | One keypair per container; no cross-Puddle signing |
| **Tally** | Memory budgets per container |
| **Amber** | Export whole-container snapshot cold; verify without warm keys |
| **Comlink** | Fact lane between host and guest Puddles when networking ring opens |

First ring (horizon): one QEMU (or equivalent) guest running one hosted seed, export snapshot, verify digest, restore — witnessed once.

---

## Open questions

- Hypervisor: KVM/QEMU first vs userspace container with virtio devices only?
- Identity: Kumara per Puddle generated at spawn, or derived from owner seed with namespace salt?
- Fleet size: how Caravan restart policy applies when a Puddle falls?
- Relationship to **Mantrapod** export door — same Amber record shape?

---

*May each Puddle hold its own sky. May snapshots seal honestly. May the host carry many worlds without confusing their keys.*
