# Pass 9921 · mem.reverse — reversed order matches snapshot

**Witnesses:** 82 programs (grew from 81)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260621.024012`

## What this pass covers

**`std.mem.reverse`** — in-place order reversal of a slice. Pairs with `reverseIterator` and the mem mutation arc.

## Postconditions

When `items.len <= 64`, after reversal each element's bytes match the mirrored original (`eql(u8, asBytes(...))` — works for any `T` with defined layout, including structs used by `mem.sort`).

## What the test asserts

- `u8` five-element reversal
- `i32` three-element ends swap
