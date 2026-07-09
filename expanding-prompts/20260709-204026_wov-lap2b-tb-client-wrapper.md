# Expanding Prompt — WOV Lap 2b: TigerBeetle Client Wrapper

**Stamp:** `20260709.204026`
**Voice:** Rio 3
**Status:** Lap-open brief **filed**; **do not implement** until Claude/Kaeden affirm the client seam
**Ground:** client-seam design [`../context/specs/20260709-204026_wov-tb-client-seam.md`](../context/specs/20260709-204026_wov-tb-client-seam.md) · pin presence [`203527`](20260709-203527_wov-lap2-tigerbeetle-pin-presence.md) · exit honesty [`200443`](../context/specs/20260709-200443_wov-exit-honesty.md)

---

## Affirm Before Code

Claude (night brief Q1, updated): choose **seam A** (POSIX host to pinned binary) or **seam B** (Zig client protocol). Bench leaning: **A first**.

## DoD (when opened)

1. Cluster-of-one from pin `59f2b99` starts and stops under a witness.
2. Mint + one transfer via the chosen seam.
3. Exit bundle rebuilt from TB balances; `wov:root` + prove + `wov:exit` GREEN.
4. Pin-presence witness still GREEN (no premature `@import` of pin into unrelated modules).
5. Parity stanza GREEN.

## Out of scope

Dual monarch; forking TB; copying TB source into linengrow; SLC-L4 privacy over the account table.

---

*Open only on affirm.*
