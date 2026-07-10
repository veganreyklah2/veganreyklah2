# Comlink View Filter — Not GraphQL

*A hammock scope note: the GraphQL-shaped need — typed reads for Realidream frontends across Rye OS clients — lands as a **thin filter over Comlink's fact lane**, reusing Tablecloth query, carrying Bron-shaped request and response, never a schema language or JSON HTTP gateway.*

**Stamp:** `20260710.140500`
**Voice:** Rio 3
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Lens:** TAME · [SLC](../context/SIMPLE_LOVABLE_COMPLETE.md) · Gall · Hammock
**Status:** Design + wire + query view + device wire — checkable-room hammock; hosted Tablecloth query wire GREEN; Realidream query-view Skate fold GREEN; device virtio GREEN; parity **246**

**Ground:** counsel [`005612`](../counsel/20260707-005612_claude-counsel-tablecloth-query.md) · Hyperfiddle gratitude [`../gratitude/hyperfiddle.md`](../gratitude/hyperfiddle.md) · Weave essay [`../foundations/20260629-063512_the-graph-beneath-the-surface.md`](../foundations/20260629-063512_the-graph-beneath-the-surface.md) · NS brief [`20260706-023912_the-referential-namespace.md`](20260706-023912_the-referential-namespace.md) · Realidream thin-view exception [`../context/specs/20260709-225343_thin-view-dexter-exception.md`](../context/specs/20260709-225343_thin-view-dexter-exception.md)

**Direction:** [`../work-in-progress/ROADMAP.md`](../work-in-progress/ROADMAP.md) · [`../work-in-progress/TASKS.md`](../work-in-progress/TASKS.md)

---

## The Ask, Plainly

Other Rye OS clients need to **ask a host** for the facts a Realidream surface will fold — the same job GraphQL often fills on the web: a typed read, a bounded answer, a frontend that does not own the whole store.

Our grain already answered the shape of that read **in-process**: Tablecloth query is an optional-field filter over the bounded namespace catalog — every match in held order, never a query language, plan, or index (counsel `005612`). Comlink already carries sealed facts between processes. The missing ring is **the filter on the wire**.

---

## What We Do Not Build

| Temptation | Why it stays out |
|------------|------------------|
| **GraphQL** | Not in LEXICON or TAME; JSON-in-payload contradicts Visual Track departures; Sui GraphQL was a rejected external path |
| **HTTP REST gateway** | Host seam for browsers later; not the Rye OS client path |
| **New Comlink module** | This is an **aspect of the fact lane** — Tablecloth query over sealed datagrams |
| **Schema language / resolvers** | Filter fields already named: peer · bolt · revision · tilak · path_hint |
| **Full Realidream viewer** | Still held — Pond policy + Dexter second consumer; this lap serves the **data path**, not the window |

Hyperfiddle's lesson maps to **Weave · fold · Tilak** — not Electric. Values cross seams as **Bron** (or compact wire that encodes the same fields), never JSON-in-a-payload.

---

## What SLC Lap This Is

**Tablecloth query wire** — first lap where a Rye OS client sends a sealed filter request and receives matching catalog names over Comlink hosted UDP, then folds locally.

| Word | Meaning for this lap |
|------|------------------------|
| **Simple** | One filter request, one sealed response of names, one verify path |
| **Lovable** | A Realidream host can answer "which leaves match this Tilak?" without shipping the whole catalog |
| **Complete** | Welcome path GREEN; empty match returns empty (honest absence); overflow refused; unwelcome bad kind refused |

---

## Request and Response — Fields

Compact wire (fits one sealed datagram, `max_message` 340), same discipline as `recall_sync_wire.rye`.

**Request (kind `0x11`):** optional peer, bolt, revision, tilak, path_hint — same optionality as `TableclothQuery`.

**Response (kind `0x12`):** count + ordered hits of `{peer, bolt, revision, path}` — names only; resins stay on the host until a later sync/catch-up lap fetches them.

Client fold: names → local Skate lines or a later resin fetch. The host remains source of truth; the wire carries the filter answer.

---

## Edge of Complete — In and Out

### In scope (lap 1)

- `mantra/recall_tablecloth_query_wire.rye` — encode/decode + build from catalog
- `mantra/recall_tablecloth_query_delivery.rye` — hosted UDP selftest
- Witness + parity **219**
- Hammock + TASKS/ROADMAP pin

### In scope (lap 1b — query view)

- `tools/fixtures/tablecloth_query_hits.bron` — wire answer shape as fixture
- `pond/apps/drawn_terminal.rye` `queryviewtest` — fold hits → Skate
- `tools/realidream_query_view.rish` — witness; parity **220**

### In scope (lap 2 — device wire · landed `20260710.174217`)

- Four virtio guests: client TX/RX · host RX/TX
- Ports **15575**/**15576**; same sealed bytes as hosted `peerB`/`b` → two hits
- `tools/mantra_recall_tablecloth_query_device.rish`; parity **246**

### Out of scope (later)

- Resin bytes in the query response (use sync/catch-up)
- Browser HTTP bridge
- GraphQL schema or introspection
- Full Realidream live viewer
- Weave graduation (second consumer still waits Comlink reading Weave's fact shape directly)

---

## GraphQL Intent → Our Vocabulary

| GraphQL idea | Rye OS name |
|--------------|-------------|
| Query document | `TableclothQuery` filter (optional fields) |
| Schema types | LeafBinding / Name — already seated |
| Resolver | `query_tablecloth` over `BoltCatalog` |
| Transport | Comlink sealed datagram (fact lane) |
| Client cache / UI | Local fold → Skate (Realidream views) |
| Subscription | Outer subscribe poll (already on wire) |

---

## Implementation Map

| File | Role |
|------|------|
| `mantra/recall_tablecloth_query.rye` | In-process filter (parity **175**) — unchanged |
| `mantra/recall_tablecloth_query_wire.rye` | Compact request/response bodies |
| `mantra/recall_tablecloth_query_delivery.rye` | Hosted seal → UDP → open → filter → seal reply |
| `tools/mantra_recall_tablecloth_query_wire.rish` | Hosted witness |
| `comlink/guest_tablecloth_query_*.rye` | Device virtio guests (request + response) |
| `tools/mantra_recall_tablecloth_query_device.rish` | Device witness (parity **246**) |

---

*May the filter stay a filter on the wire. May Realidream clients ask by Tilak and fold what returns. And may GraphQL remain a lesson studied, never a second language in the tree.*
