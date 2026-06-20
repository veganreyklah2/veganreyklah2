# Pass 9939 · startsWith — prefix verdict agrees with eql

**Witnesses:** 64 programs (grew from 63)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.200012`

## What this pass covers

**`std.mem.startsWith`** — prefix test on slices. The `rye` CLI and Mantra weave logic depend on it; builds on the `maybe` documentation from 9993 with return-path postconditions pairing `eql` (9941).

## Postconditions

- `false` when `needle.len > haystack.len` ⇒ length ordering stated
- `true` ⇒ `needle.len <= haystack.len`
- `false` otherwise ⇒ empty needle or prefix `eql` fails

## What the test asserts

- Normal prefix match and mismatch
- Empty needle (always true)
- Needle longer than haystack
- Equal-length exact match
