# 969 · Brix as Notation — Token-Efficient Values for the System and Its Agents

*A siloed design brief for Brix as the notation that carries values between modules, between forges, and between agents — human-readable, machine-parseable, token-efficient by construction. Brix is not JSON wearing a new name; it is the format that the one-value model wears when it travels as text.*

**Language:** EN
**Version:** `20260621.063112` (Rye chronological stamp)
**Last updated:** 2026-06-21
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Voice:** Reya 2
**Lens:** TAME — safety, performance, joy
**Status:** Active Design (siloed)

---

## Our Own Ground

This is a clean room. The notation names only our own modules: **Brix** (the format), **Rishi** (the shell that reads it), **Tablecloth** (the store that holds what Brix describes), **Mantra** (the history that records it), **Comlink** (the wire that carries it), and **Pond** (the enclosure that bounds it). The insight that minimal syntax reduces token cost enters as a principle from our research; the format is ours.

---

## The Format

Brix is plain key-value. One field per line. Space separates key from value. `#` begins a comment. Blank lines are ignored.

```brix
# project descriptor
name veganreyklah2
version 20260621.063112

# tracked bricks
file rye/src/main.rye
file rishi/src/main.rye
file caravan/seed.rye
```

**No quotes.** A value is the text after the first space, trimmed. If the value contains spaces, it is still one value — the whole rest of the line.

**No braces.** Structure is conveyed by the key names, not by nesting syntax.

**No type annotations.** A value is a string. The reader knows whether to parse it as a number, a path, or a boolean by the key's meaning — the same way a person reads it.

---

## Why This Shape Is Right

### Token efficiency

Every character in a format is a token (or part of one). Quotes, braces, brackets, commas, and colons carry no information — they are syntactic overhead. Brix carries none of them. The same data in Brix uses roughly half the tokens of JSON.

This matters when:
- An LLM reads project configuration on every turn (prompt caching helps; fewer tokens help more)
- A forge displays repository metadata for thousands of projects
- A Comlink message carries a policy or a descriptor across the wire

### Human readability

A person can read a `.brix` file in a terminal, in a text editor, in a diff view, or printed on paper. No formatter needed. No syntax highlighter needed. The structure is visible in the indentation and the key names.

### Machine parseability

A parser for Brix is:
```
for each line:
    trim whitespace
    if empty or starts with '#': skip
    find first space: key = before, value = after
```

This fits in Rishi's `read-file` + `lines` + `starts-with` vocabulary. No grammar, no recursive descent, no state machine. The parser is smaller than the format specification.

---

## Growth Path — When Brix Needs More

The seed format is flat key-value. The design documents (`982`, `997`) describe a Brix that grows toward:

1. **Repeated keys.** Already present — `file` appears multiple times. The reader collects them into a list.
2. **Sections.** A `[section]` header groups related keys. Still one field per line; the section name is context, not syntax.
3. **Tabular encoding.** For arrays of records (e.g., a list of services with name, path, and policy), a header row names the fields and data rows carry the values — the same efficiency that reduces token count for repeated structures.

Each growth step adds the minimum syntax the use case requires. Brix never gains braces, brackets, or quoted keys.

---

## Brix and the Value Model

A Brix file is a value. When Rishi reads a `.brix` file, it produces a record — the same record type that flows through every module. The record's fields are the keys; the values are the strings (or lists, for repeated keys).

This means Brix is not a serialization format applied to values — it IS how values look when written down. A Pond policy, a Mantra commit, a Comlink message header, a Forge project descriptor — each is a value, and each can be a `.brix` file.

---

## Brix and Prompt Caching

When an LLM agent works inside our system, the project context it receives — CLAUDE.md, rules, design documents — is stable across turns. Structuring this context in Brix (or Brix-shaped key-value) rather than JSON reduces the token count, and placing it early in the prompt maximizes cache hits.

The practical discipline:
- **Stable context first** — TAME rules, identity, style guide
- **Session context second** — recent state, current task
- **User message last** — the dynamic part that changes every turn
- **Brix format where possible** — fewer tokens, same information

---

*May the notation we carry stay as plain as the values it holds — no heavier than the meaning, no lighter than the truth. May every token earn its place, and may the format a person reads be the same format the machine parses, with nothing between them.*
