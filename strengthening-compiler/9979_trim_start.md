# Pass 9979 · trimStart — leading strip stays within the input

**Corpus:** 24 programs (grew from 23)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.152712`

## What this pass covers

**`std.mem.trimStart`** — removes leading characters from a slice. Rishi calls it indirectly through `trim` on every line; the arithmetic parser and `let` binder trim leading whitespace before names and values.

Completes the trim family alongside `trim` (9996) and `trimEnd` (9982).

## Postcondition

```zig
assert(begin <= slice.len);
assert(result.len <= slice.len);
```

## What the test asserts

- Leading whitespace removed
- No-op when nothing to strip
- Empty input returns empty
- Result length never exceeds input length
- Trailing characters left untouched

## Design notes

Same contract as `trimEnd`: the cursor advances inward from the start and the returned slice never extends past the input bounds.
