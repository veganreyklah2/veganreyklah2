# Pass 9922 · mem.bytesAsValue — byte buffer aliases at least one T

**Witnesses:** 81 programs (grew from 80)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260621.023612`

## What this pass covers

**`std.mem.bytesAsValue`** — reinterprets bytes as a pointer to `T`, preserving pointer attributes. Pairs with `asBytes` (9925), `toBytes` (9923), and `bytesToValue`.

## Postconditions

Slice inputs satisfy `bytes.len >= @sizeOf(T)`; one-item pointers satisfy `@sizeOf(child) >= @sizeOf(T)`.

## What the test asserts

- `u32` round-trip through `asBytes` → `bytesAsValue`
- Two-byte struct round-trip
