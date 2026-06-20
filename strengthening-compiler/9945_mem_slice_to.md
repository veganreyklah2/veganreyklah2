# Pass 9945 · sliceTo — sentinel slice length agrees with terminator search

**Witnesses:** 58 programs (grew from 57)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.193612`

## What this pass covers

**`std.mem.sliceTo`** and **`lenSliceTo`** (slice branch) — slice sentinel-terminated pointers and buffers up to a terminator. Pairs with `findSentinel` (9952) and `orderZ` (9952).

## Postconditions

**sliceTo** — returned slice length matches `lenSliceTo`.

**lenSliceTo** (slice inputs) — when a terminator is found inside the slice, the index is in bounds and points at `end`.

## What the test asserts

- NUL-terminated string literals and embedded NUL
- Scalar delimiter before sentinel
- `[*:0]const u8` C string via `sliceTo` and `len`
- Optional null pointer returns null
