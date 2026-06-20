# Pass 9975 · findScalarLast — last match stays in-range at the sought value

**Corpus:** 28 programs (grew from 27)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.162712`

## What this pass covers

**`std.mem.findScalarLast`** (`lastIndexOfScalar`) — linear search for the last occurrence of a scalar in a slice. Backs `path.extension` and `path.stem`; pairs with `findScalar` (9996).

## Postcondition

On return when a match is found:

```zig
assert(result < slice.len);
assert(slice[result] == value);
```

## What the test asserts

- Last occurrence wins over earlier matches
- Repeated scalar returns the final index
- Missing scalar returns null
- Empty slice returns null
- Path-like string finds the last dot
