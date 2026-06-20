# Pass 9940 · allEqual — every element matches the scalar

**Witnesses:** 63 programs (grew from 62)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.195612`

## What this pass covers

**`std.mem.allEqual`** — tests whether every element in a slice equals a scalar. Complements `eql` (9941) and `count` (9951).

## Postconditions

- `false` ⇒ found element differs from scalar
- `true` ⇒ every element equals scalar (vacuous when empty)

## What the test asserts

- Uniform run, mixed run, empty slice
- Single-element match and mismatch
- Whitespace uniformity
