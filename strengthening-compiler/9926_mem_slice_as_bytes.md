# Pass 9926 · mem.sliceAsBytes — byte view length matches element width

**Witnesses:** 77 programs (grew from 76)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260621.015612`

## What this pass covers

**`std.mem.sliceAsBytes`** — reinterprets a typed slice as `[]u8` preserving pointer attributes. Pairs with `asBytes` on single items and the copy/compare mem arc.

## Postconditions

Returned byte slice length is `slice.len * @sizeOf(Elem)` on the main path; zero-bit elements and empty non-sentinel slices return `len == 0`.

## What the test asserts

- `u16` array yields four bytes with correct endian layout
- Empty sentinel `u8` string yields zero bytes
- Zero-bit element slice yields zero bytes
