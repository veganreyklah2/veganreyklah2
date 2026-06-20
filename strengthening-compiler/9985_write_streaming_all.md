# Pass 9985 · writeStreamingAll — every byte consumed

**Corpus:** 19 programs (grew from 18)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.143912`

## What this pass covers

**`std.Io.File.writeStreamingAll`** — loops `writeStreaming` until the full slice is sent. Rishi's `say`, Brushstroke stdout lines, and Rishi value printing all call it on every output.

Postcondition after the loop:

```zig
assert(index == bytes.len);
```

## What the test asserts

- Non-empty write round-trips through a temp file via `readFile`
- Empty write completes without error (index stays 0)
- Parity holds against baseline std

## Call graph note

`writeStreamingAll` → `writeStreaming` (hot path). The invariant lands at the cold wrapper so the streaming syscall loop stays lean.
