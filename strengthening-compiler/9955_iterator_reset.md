# Pass 9955 · iterator reset — split and tokenize replay from initial cursor

**Corpus:** 48 programs (grew from 47)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.180712`

## What this pass covers

**`SplitIterator.reset`**, **`SplitBackwardsIterator.reset`**, and **`TokenIterator.reset`** — restore initial cursor position for replay.

## Postconditions

| Iterator | After reset |
|----------|-------------|
| Forward split / tokenize | `index == 0` |
| Backward split | `index == buffer.len` |

## What the test asserts

- Forward split `first()` after partial walk + reset
- Backward split `first()` after partial walk + reset
- Tokenize `next()` after partial walk + reset
