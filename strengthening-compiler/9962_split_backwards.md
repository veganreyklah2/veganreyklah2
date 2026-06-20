# Pass 9962 · SplitBackwardsIterator — backward split fields stay in-range

**Corpus:** 41 programs (grew from 40)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.172612`

## What this pass covers

**`SplitBackwardsIterator`** (`splitBackwardsScalar`, `splitBackwardsAny`, `splitBackwardsSequence`) — `next`, `first`, and `rest`. Mirrors forward `SplitIterator` strengthening (9993, 9963, 9968).

## Postconditions

**next** on every yielded field:

```zig
assert(start <= end);
assert(end <= self.buffer.len);
```

**first** after `next()`:

```zig
assert(field.len <= self.buffer.len);
assert(end <= self.buffer.len);
```

**rest**:

```zig
assert(end <= self.buffer.len);
```

Index-based only — comptime-safe like forward `first` (9963).

## What the test asserts

- Scalar backward walk with empty field (`||`)
- `rest()` tracks unprocessed prefix
- Any and sequence delimiters
- Single field with no delimiter
