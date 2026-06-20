# Pass 9935 · SHA3 ShakeLike squeeze @memcpy — buffered slice bounds

**Witnesses:** 68 programs (grew from 67)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.204212`

## What this pass covers

**`ShakeLike.squeeze` in `sha3.zig`** — slice bounds on the rate-sized buffer between sponge squeezes. Sits above `keccak_p` (`9936`) on every SHAKE/XOF call.

## Postconditions

- `self.offset <= self.buf.len` on entry and via `defer` on every return path
- Before each `@memcpy`: copy length fits destination; partial drain keeps `self.offset + n <= self.buf.len`
- Tail copy: `out.len <= self.buf.len` before copying from the freshly squeezed block

## What the test asserts

- Split `update` + multi-call `squeeze` matches one-shot `Shake128.hash` for the first 100 bytes
