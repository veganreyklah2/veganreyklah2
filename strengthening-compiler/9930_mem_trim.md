# Pass 9930 · mem.trim — both ends stay within the input

**Witnesses:** 73 programs (grew from 72)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260621.012812`

## What this pass covers

**`std.mem.trim`** — removes leading and trailing characters. Completes the trim witness family beside `trimStart` (9979) and `trimEnd` (9988); Rishi calls `trim` on every parsed line.

## Postconditions

- `begin <= end` and `end <= slice.len` (existing)
- `result.len <= slice.len`
- `result.len == end - begin`

## What the test asserts

- Both ends stripped, no-op, empty input
- Result length never exceeds input
- Leading-only and trailing-only cases
