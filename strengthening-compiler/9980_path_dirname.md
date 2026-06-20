# Pass 9980 · path.dirname — parent path stays within the input

**Corpus:** 23 programs (grew from 22)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.152412`

## What this pass covers

**`std.fs.path.dirname`** — returns the parent directory of a path, or null for roots and bare filenames. The rye bridge calls it on every multi-file `@import("*.rye")` resolution to find sibling modules.

## Postcondition

At `dirnameInner` return:

```zig
assert(result.len <= path.len);
assert(mem.startsWith(u8, path, result));
```

When the function returns null, no postcondition applies — empty paths, roots, and filename-only paths legitimately have no parent.

## What the test asserts

- Nested relative path yields the expected parent
- Multi-component relative path (`a/b/c` → `a/b`)
- Absolute child (`/a` → `/`)
- Bare filename, empty string, and root return null
- Parity holds against baseline std

## Call graph note

`dirname` → `dirnamePosix` / `dirnameWindows` → `dirnameInner`. The invariant lands in `dirnameInner` so both platform paths share one stated contract.
