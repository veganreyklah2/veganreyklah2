# The Rishi Language — Reference

**Language:** EN
**Last updated:** 2026-07-02
**Style:** Radiant (see `../../context/RADIANT_STYLE.md`)
**Version:** 0.1 — derived from the living witness corpus at parity **140** and the interpreter at `rishi/src/main.rye`
**Conformance:** *must* and *should* carry their plain conformance weight
**Pledge:** this reference documents only what runs; every example below is drawn from, or shaped exactly like, a witness that passes today

---

## 1. Invocation

The `rishi` binary answers four commands:

```
rishi version              print the version line
rishi repl                 open the interactive shell
rishi run <script> [args]  execute a .rish script with optional arguments
rishi help | --help        print usage
```

A script that completes exits `0`. A failed assertion or a runtime error ends the script immediately with a nonzero exit and a plain message on standard error.

## 2. Lexical Shape

A script is a sequence of statements, one per line. `#` opens a comment to end of line. Whitespace separates tokens. There are no semicolons and no line continuations; a statement *must* fit its line.

**Strings** are double-quoted and interpolate with `${name}` — bindings and record fields alike: `"${bin} metalsmoke 2>&1"`. **Lists** are square-bracketed and whitespace-separated, with no commas: `["a" "b" "c"]`. **Booleans** are `true` and `false`. Integers appear as values (exit codes, lengths) and compare with `==` and `!=`.

## 3. Bindings — `let`

```
let zig = "vendor/zig-toolchain/zig"
let witnesses = ["sha3_256_test" "version_test"]
let build = run ["sh" "tools/fixtures/pond_build_drawn_terminal.sh"]
```

`let` binds a name to a value. Bindings do not rebind; a new meaning takes a new name, in the accrete-never-break spirit. Name bindings for what they *are* rather than how they were computed.

## 4. Running Processes — `run`

`run LIST` executes the list as an argument vector and returns a **run record** with four fields:

| Field | Type | Meaning |
|-------|------|---------|
| `.ok` | boolean | the process exited zero |
| `.code` | integer | the exact exit code |
| `.out` | text | captured standard output |
| `.err` | text | captured standard error |

```
let smoke = run ["sh" "-c" "${bin} metalsmoke 2>&1"]
assert smoke.ok else "metalsmoke exited non-zero"
```

A pipeline *must* check `.ok` (or `.code`) before trusting `.out`. The `["sh" "-c" "…"]` form is the sanctioned **host seam** for environment variables, redirection, and globbing; scripts *should* keep each seam to one honest line, and orchestration in Rishi proper. By convention every script runs **from the repository root**; scripts *must not* assume any other working directory.

## 5. Gates — `assert … else`

```
assert build.ok else "drawn_terminal build failed for Ring 3 witness"
assert (oob.ok == false) else "out-of-range index must fail"
```

`assert EXPR else "message"` stops the script loudly when the expression does not hold, printing the message. Parentheses group comparisons. Assertions are the language's whole control discipline: place one after every `run`, before every effect. Negative space is asserted as deliberately as positive — a check that something *fails* is a first-class witness line.

## 6. Expressions

Equality `==` and inequality `!=` work on strings, integers, and booleans. `TEXT contains "needle"` tests substring presence. Records answer field access with `.name`; lists and strings answer `.len`; lists answer indexing `xs[i]`, and an out-of-range index ends the script with a friendly `out of range` error.

## 7. Comprehensions — `map`, `where`, `length`

```
let runs     = map witnesses as s: run ["env" "RYE_ZIG=${zig}" rye "run" "${dir}/${s}.rye"]
let codes    = map runs as r: r.code
let failures = where codes as c: c != 0
assert length failures == 0 else "a witness failed — the regression suite is RED"
```

`map LIST as x: EXPR` transforms every element; `where LIST as x: PRED` keeps the elements that satisfy the predicate; `length LIST` counts. These three carry the whole parity suite. There is no general loop and no conditional statement — bounded comprehension plus assertion is the deliberate shape (see §11).

## 8. Output — `say`

`say "…"` prints a line with interpolation; lists render inline. The convention across the corpus: a witness's final line begins `GREEN:` on success, and gates upstream test for it with `contains "GREEN"`.

## 9. Script Arguments — `args` and `flag`

Inside a script run as `rishi run script.rish a b c`:

```
assert (args.len == 3) else "expected args.len == 3"
assert (args[0] == "a") else "expected args[0] == a"
let path = flag args "--appimage"
```

`args` is the list of words after the script path. `flag LIST "--name"` scans for `--name value` and returns the value; a missing flag ends the script with `flag not found`, and a flag at list's end with `requires a value` — both *must* remain friendly, single-line messages.

## 10. The Interactive Shell

`rishi repl` reads lines, runs them, and keeps the last **50** inputs. Meta-commands begin with a colon: `:history` lists recent inputs; `:recall <n>` replays one; `:version` prints the version; `:quit` and `:q` leave. Everything else on a line is dispatched as a command. The drawn terminal mirrors exactly this session through `sessionLines`, so the shell's contract and the window's content are one value.

## 11. Named Gaps — the Growing Edge

Held openly, so the reference and the roadmap agree: Rishi keeps **no conditional** (`if`/`when`), **no environment builtin** (the `sh -c` seam serves), **no file-reading builtin**, and **no named exit-code vocabulary** yet. Each is a gated horizon in `work-in-progress/TASKS.md`; each enters this reference only on the day its witness runs green.

---

*May this page and the parity suite never disagree — and when the language grows, may the witness land first and the sentence follow.*
