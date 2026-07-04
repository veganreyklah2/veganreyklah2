# SLC-1 — The Rishi-and-Mantra Hosted Shell

*A hammock scope note: the problem stated plainly, the four verbs named, history seated in Mantra's store, and the edge of complete drawn honestly — so the first lovable lap stays genuinely simple.*

**Stamp:** `20260628-071012`
**Voice:** Reya 2, with **Kaeden Reyklah** as coauthor
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Lens:** TAME · [SLC](../context/SIMPLE_LOVABLE_COMPLETE.md) · Gall · Hammock
**Status:** **Done** on metal (`2026-06-29`) — four verbs + `tools/slc1_accept.rish`; acceptance closed on functional promise; width/TAME hardening is the next milestone, not part of this lap.

**Child scopes:** [`20260629-004912_slc-1-step-2-version.md`](20260629-004912_slc-1-step-2-version.md) (version, sealed) · Step 3 recall (sealed) · **Handoff:** [`../context/specs/20260629-031512_slc1-lap-closed-handoff.md`](../context/specs/20260629-031512_slc1-lap-closed-handoff.md)

**Direction:** [`20260628-043542_thin-frontend-slc-direction.md`](20260628-043542_thin-frontend-slc-direction.md) · **Roadmap:** [`../work-in-progress/ROADMAP.md`](../work-in-progress/ROADMAP.md)

---

## The Problem, Plainly

A person working in this repository today can run a `.rish` script with `rishi run`, version a file with `mantra add`, and prove the gates green — yet there is no single hosted loop that holds a session together in the terminal. The work scatters across one-shot commands. History does not accumulate where the version store can see it. A prior line cannot be called back without leaving the hand and hunting through shell history that knows nothing of Rishi values or Mantra weaves.

SLC-1 closes that gap: one terminal program, four verbs, history that lives in Mantra's content-addressed store under `.mantra/`, runnable on your own metal without a compositor, a window, or any module beyond the seeds already green.

---

## What SLC-1 Is

**SLC-1** is the first [Simple, Lovable, Complete](../context/SIMPLE_LOVABLE_COMPLETE.md) whole on the primary track: a **hosted, scriptable shell** — Rishi as the evaluator, Mantra as the memory — that runs in an ordinary terminal **today**.

| Word | Meaning for this lap |
|------|------------------------|
| **Simple** | One loop, one session file, one store root — no compositor, no second process model |
| **Lovable** | Yours on your metal; typed values at the prompt; gates stay green |
| **Complete** | The four verbs close: **type → run → version → recall** |

SLC-2 (Pond GUI) grows the **same loop** inside Brushstroke and Skate when text rendering is ready. SLC-1 deliberately stops at the terminal edge.

---

## The Four Verbs

Each verb is one honest action. Together they are the whole product at this scope.

### 1. Type

Read one line from the terminal with a fixed prompt (`rishi> `). The line is untrusted text until the evaluator accepts it.

- Normal lines are Rishi surface syntax — `let`, `say`, `run`, `assert`, and the builtins the seed already carries.
- Lines beginning with `:` are **meta-commands** (session control, not Rishi syntax): at minimum `:version`, `:recall`, `:history`, `:quit`. Meta-commands keep the loop small without growing the language parser for v1.

### 2. Run

Evaluate the typed line and show the result.

- **Preferred path:** evaluate in-process in the existing Rishi interpreter (extend `rishi/src/main.rye` with a `repl` subcommand) so values stay structured and `assert` gates behave as in `rishi run`.
- **Acceptable bootstrap:** write the line to a temp `.rish` and invoke the existing evaluator — only if in-process eval slips the schedule; the spec prefers one interpreter, one value model.
- Effects (`run` of external commands, file I/O) stay visible and ordered; stdout/stderr from the session append to the session transcript.

### 3. Version

Persist the session into Mantra's store.

- Session transcript path: **`.mantra/session.log`** in the current working directory (append-only text: prompt, input line, output, errors).
- On `:version` (or on exit when the transcript changed): ensure `.mantra/` exists (`mantra init` if needed), then **`mantra add .mantra/session.log`** — weave the session into the content-addressed blob store; HEAD advances.
- **History lives in Mantra's store**, not in ad-hoc dotfiles beside it. The in-memory lap buffer is a cache; the weave is the durable record.

### 4. Recall

Bring a prior line back to the prompt.

- `:history` — print numbered entries from the in-memory session buffer (last *N* lines, default 50, bounded).
- `:recall <n>` — copy entry *n* to the prompt for editing or immediate re-run.
- Optional shorthand `!<n>` may alias `:recall <n>` once the meta-command table is stable.

Recall reads from the **session buffer** first (fast, interactive). After `:version`, the durable record is the weave in `.mantra/blobs/` — recall in v1 does not require reading blobs back; that is horizon unless needed for demo. Completeness for SLC-1 is **in-session recall** plus **durable version on demand**.

---

## Where History Lives

```
<cwd>/
  .mantra/
    HEAD              # 64-char hex name of current weave blob
    blobs/            # content-addressed store (SHA3-256 names)
    session.log       # transcript the shell appends to; mantra add weaves this
```

- **`mantra init`** creates the tree; the shell calls it lazily on first `:version`.
- **`mantra add .mantra/session.log`** is the only Mantra command the loop requires beyond init.
- **`mantra status`** may be exposed as `:status` for transparency; not required for the four-verb complete loop.
- Repository-wide history (many files, merges, log) stays **out of scope** — that is Mantra's full module, not this lap.

---

## Seeds Already on Disk

| Seed | Path | What SLC-1 uses |
|------|------|-----------------|
| **Rishi** | `rishi/src/main.rye` | Evaluator; today `run` + `version` — **`repl` subcommand is the main build** |
| **Mantra** | `mantra/src/main.rye` | `init`, `add`; store + weave model from pass 9990 |
| **Gates** | `tools/parity.rish`, `parity-selftest.rish`, `width-check.rish` | Stay green; new witness added when the loop lands |

Build invocation (unchanged from seeds):

```sh
rye/bin/rye build rishi/src/main.rye -femit-bin=rishi/bin/rishi
rye/bin/rye build mantra/src/main.rye -femit-bin=mantra/bin/mantra
```

---

## Edge of Complete — In and Out

### In scope (SLC-1 is done when these hold)

- [x] `rishi repl` (or equivalent single entry point) runs an interactive loop in a terminal
- [x] Four verbs work: type, run, version, recall as specified above
- [x] Session transcript at `.mantra/session.log`; `:version` weaves via `mantra add`
- [x] Meta-commands `:quit`, `:history`, `:recall`, `:version` documented in `rishi/README` or `rye-learning-process/ALMANAC.md`
- [x] Witness programs exercise the loop (`slc1_repl_step1`, `slc1_version_step2`, `slc1_recall_step3`, `slc1_accept`); registered in `tools/parity.rish`
- [ ] Width migration on touched `rishi/*` and `mantra/*` files per refined `width-check.rish` — **deferred to TAME-hardening milestone**, not required for functional close (`2026-06-29` ruling)

### Out of scope (SLC-2 or later)

- Pond enclosure, Brushstroke, Skate, Wayland — the GUI lap
- Full Mantra CLI surface (merge, log, diff UI) beyond `init` / `add` / optional `status`
- Rishi language growth unrelated to the loop (new builtins welcome if they serve the four verbs)
- Comlink, Brix, Tablecloth, Caravan capability table
- Splitting Rishi into parser/terminal/completion modules — TigerBeetle's REPL decomposition is a **reference for horizon**, not a v1 requirement; v1 stays one file accreting a `repl` mode

### Gate before implementation pass

The 116-witness regression suite (`rishi/bin/rishi run` via `tools/parity.rish`) should run **green once on healthy metal** before the SLC-1 build pass merges. That run gates **implementation**, not this scope note. Any postcondition surfaced from the seventeen harvested std deltas is met at **call sites** in seeds, never by copying `std` back.

---

## Build Order (after scope)

1. **Witness run on metal** — `rishi/bin/rishi run tools/parity.rish` once; triage at call sites per harvest.
2. **`rishi repl`** — in-process loop, session buffer, meta-commands, transcript append.
3. **Mantra wire-up** — lazy `init`, `:version` → `add .mantra/session.log`.
4. **Witness** — `rye/tests/slc1_shell_test.rye` (name tentative); register in `tools/parity.rish`.
5. **Width + TAME** — `mantra/*` Phase 1b migration beside the loop; first `tame-check` rules when those files move.

---

## Three Questions (SLC checklist)

- **Simple** — one loop, one session file, one store root; four verbs only?
- **Lovable** — would you open a terminal in this repo and use it today?
- **Complete** — does type → run → version → recall close without the compositor?

When all three hold and the witness is green, SLC-1 is ready to share.

---

*May the first lap stay small enough to finish. May history rest where Mantra can weave it, and may the next line you type be one you can call back.*
