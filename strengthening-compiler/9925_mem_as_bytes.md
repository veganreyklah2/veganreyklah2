# Pass 9925 · mem.asBytes — byte view length matches value size

**Witnesses:** 78 programs (grew from 77)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260621.021112`

## What this pass covers

**`std.mem.asBytes`** — reinterprets a pointer to one value as its underlying bytes. Pairs with `sliceAsBytes` (9926).

## Postconditions

Returned byte slice length equals `@sizeOf(@TypeOf(ptr.*))` (zero for zero-sized types).

## What the test asserts

- `u32` yields four bytes; zeroing bytes clears the word
- Zero-sized type yields zero bytes
- Packed two-byte struct yields two bytes
