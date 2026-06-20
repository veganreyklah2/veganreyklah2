# Pass 9965 · findNonePos and findNone — strspn search stays outside the set

**Corpus:** 38 programs (grew from 37)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.171112`

## What this pass covers

**`std.mem.findNonePos`** and **`std.mem.findNone`** — find the first scalar not in a set (`strspn`-like). Pairs with `findAnyPos` (9967).

## Postconditions

**findNonePos** on match:

```zig
assert(i < slice.len);
assert(i >= start_index);
for (values) |v| assert(slice[i] != v);
```

**findNone** cold wrapper:

```zig
assert(i < slice.len);
for (values) |value| assert(slice[i] != value);
```

## What the test asserts

- First non-digit in mixed string
- Skip leading digits
- All-in-set returns null
- Absent set returns null
- Positional search past tail returns null
- Positional search from offset finds first outside set
