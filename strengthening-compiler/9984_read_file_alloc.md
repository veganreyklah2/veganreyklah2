# Pass 9984 · readFileAlloc — result respects the stated limit

**Corpus:** 20 programs (grew from 19)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.144112`

## What this pass covers

**`std.Io.Dir.readFileAllocOptions`** (and therefore `readFileAlloc`) — allocates the full file contents. The rye multi-file bridge and Rishi `read-file` lean on this path.

Postcondition at the cold wrapper:

```zig
const max = @intFromEnum(limit);
if (max != std.math.maxInt(usize)) assert(result.len <= max);
return result;
```

`.unlimited` skips the check; every finite limit is enforced at return.

## What the test asserts

- Round-trip read with `.unlimited` matches written content
- Read with `.limited(n)` where `n` exceeds file size still returns full content
- Empty file read with `.unlimited` returns zero-length slice
- Parity holds against baseline std

## Pair with 9985

9985 strengthened `writeStreamingAll` (stdout/file write path); 9984 strengthens the symmetric read-alloc path our bridge and shell use.
