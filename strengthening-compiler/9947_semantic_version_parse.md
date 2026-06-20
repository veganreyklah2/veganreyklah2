# Pass 9947 · SemanticVersion.parse — parsed fields stay within input text

**Witnesses:** 56 programs (grew from 55)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.192712`

## What this pass covers

**`std.SemanticVersion.parse`** and **`parseNum`** — semver 2.0 parsing. Pairs with `order` (9948); feeds capability table and future **RyeVersion** accretion.

## Postconditions

**parse** — on success:

- Release-only versions have no `pre` or `build`
- `pre` and `build` slices are found within the input `text`

**parseNum**:

```zig
assert(text.len > 0);
```

## What the test asserts

- Plain release, pre-release, build metadata, and combined forms
- Major/minor/patch and metadata substring equality
