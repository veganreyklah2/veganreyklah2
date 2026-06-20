# Pass 9969 · SplitIterator.peek — lookahead stays within the buffer

**Corpus:** 34 programs (grew from 33)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.165112`

## What this pass covers

**`SplitIterator.peek`** (via `splitScalar`, `splitAny`, `splitSequence`) — returns the next field without advancing. Rishi peeks while splitting lines and fields; `next()` was strengthened in 9993.

## Postcondition

```zig
assert(start <= end);
assert(end <= self.buffer.len);
```

Same contract as `next()`, stated at peek so lookahead cannot name bytes outside the buffer.

## What the test asserts

- first + peek + next agree on the same field
- Empty field between delimiters visible via peek
- Final peek is null when exhausted
