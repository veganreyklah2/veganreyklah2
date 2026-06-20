# Pass 9932 · mem tokenize factories — cursor starts at buffer front

**Witnesses:** 71 programs (grew from 70)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.210412`

## What this pass covers

**`tokenizeScalar`, `tokenizeAny`, `tokenizeSequence`** — factory postconditions beside strengthened `TokenIterator` (`9956`–`9957`) and split factories (`9934`).

## Postconditions

On return from each factory:

- `index == 0`
- `index <= buffer.len`

Unlike split factories, `rest()` skips leading delimiters — not asserted at creation.

## What the test asserts

- Scalar, any, and sequence delimiters: `peek` on first token, `rest` from first token start
- Empty buffer and delimiter-only buffer yield null `peek`
