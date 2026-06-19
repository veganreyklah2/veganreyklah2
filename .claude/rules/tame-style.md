# TAME Style — Code

Full guide: `context/specs/tame-style.md`. Apply when writing or reviewing Rye source (`.rye`), Brix descriptors (`.brix`), and Rishi scripts (`.rish`).

## When this rule is active

- Writing or editing any `.rye` source file
- Writing or editing any `.brix` descriptor
- Writing or editing any `.rish` script
- Reviewing, suggesting changes to, or explaining any of the above

## Core moves (root — all family languages)

- State invariants **before** implementing: write `assert` calls at construction, mutation, and postcondition, each preceded by a `// invariant:` comment.
- Bounds on everything: every allocation, collection, and pipeline names a maximum. Name the budget at construction; enforce at the edge.
- Say why: every assertion, every named constant, every surprising design choice earns a comment that names the reason.
- Accrete, never break: a name once given is a promise. Add beside it; do not replace it silently.
- One value model: string, integer, bool, list, record — composed side by side, never tangled.

## Supplement cheatsheet

| Language | Key discipline |
|----------|----------------|
| **Rye** | Explicitly sized types (`u8`, `u32`, `usize`). `std.debug.assert` at every invariant. Named errors, propagated with `try`. Short functions named with a verb. Constants named with type and comment. |
| **Brix** | Declarative only — no commands, no conditions. One field per line. Comments name what the brick *is*. Plain key-value; readable by hand. |
| **Rishi** | `run` always returns `{ status, out, err }`. Check `status` before trusting `out`. `assert` as a pipeline gate at every stage boundary. Effects come last and are visible. Named `let` bindings. |

## The priority order

Safety first — structural, not by convention. Performance second — measure before optimizing. Joy third — clarity, named things, the habit of saying why.

When these pull against each other, safety wins. When safety and performance are equal, joy earns the vote.
