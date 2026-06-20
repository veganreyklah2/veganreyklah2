# Pass 9964 · findLastNone — backward strspn search stays outside the set

**Corpus:** 39 programs (grew from 38)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.171512`

## What this pass covers

**`std.mem.findLastNone`** (`lastIndexOfNone`) — find the last scalar not in a set. Pairs with `findNonePos` (9965) and `findLastAny` (9966).

## Postcondition

On match:

```zig
assert(i < slice.len);
for (values) |v| assert(slice[i] != v);
```

## What the test asserts

- Last letter before trailing digits (upstream case)
- Last letter at end of digit prefix
- All-in-set returns null
- Last non-digit in mixed alphanumeric string
