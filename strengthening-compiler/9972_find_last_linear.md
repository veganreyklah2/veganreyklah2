# Pass 9972 · findLastLinear — backward needle search stays in-range

**Corpus:** 31 programs (grew from 30)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.164012`

## What this pass covers

**`std.mem.findLastLinear`** (`lastIndexOfLinear`) — linear backward sub-slice search. `findLast` delegates here on small inputs; pairs with `findPosLinear` (9973).

## Postcondition

On match:

```zig
assert(i + needle.len <= haystack.len);
```

## What the test asserts

- Last occurrence wins on repeated needle
- Single-char last match
- Multi-byte last match
- Missing needle returns null
