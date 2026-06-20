# Pass 9981 · process.run — the process boundary Rishi orchestrates through

**Corpus:** 22 programs (grew from 21)
**Gate:** GREEN — parity confirmed
**Stamp:** `20260620.151812`

## What this pass covers

**`std.process.run`** — spawns a child, collects stdout and stderr, waits for exit. Rishi's `run` builtin, `tools/parity.rish`, and `hosted_wire demo` all depend on it.

## Postconditions

**Entry** (`process.zig`):

```zig
assert(options.argv.len > 0);
```

**Return** — after streams are owned:

```zig
if (options.stdout_limit.toInt()) |limit| {
    assert(stdout_slice.len <= limit);
}
if (options.stderr_limit.toInt()) |limit| {
    assert(stderr_slice.len <= limit);
}
```

## What the test asserts

- `true` exits 0 with empty stdout and stderr
- `echo` captures stdout and returns exit code 0
- `.limited(32)` on stdout holds for a short echo (`bounded.stdout.len <= 32`)

## Call graph note

`process.run` → `spawn` + `MultiReader` + `wait`. Invariants land at the cold wrapper; the fill loop already enforces limits during collection — the return assertions document what success means.
