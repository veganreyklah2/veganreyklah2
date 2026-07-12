# Proven-seat signed-Kumara — Monocypher crypto teacher

*Claude `214200` teacher · Claude `214900` vendor pin live from forge · tip `85c79ef` walk.*

**Stamp:** `20260712.214200`
**Last updated:** `20260712.214900` — vendor pinned · three-assert witness shaped
**Language:** EN
**Style:** Radiant
**Voice:** Rio 3 · Claude proposes · Kaeden seats by paste
**Status:** Checkable — Monocypher **pre-pinned** @ 4.0.3 · guest/fixture HOLD · seed never crosses
**Ground:** G1 close [`20260712-204549_proven-seat-g1-claude-close.md`](20260712-204549_proven-seat-g1-claude-close.md) · crossing pin [`20260712-195339_proven-seat-g1-crossing-pin.md`](20260712-195339_proven-seat-g1-crossing-pin.md) · latch [`20260712-213600_pond-freeze-affirm-master-seal.md`](20260712-213600_pond-freeze-affirm-master-seal.md) · pin seating [`20260712-214900_signed-kumara-monocypher-pin.md`](20260712-214900_signed-kumara-monocypher-pin.md) · tip `85c79ef`

**Witness:** `rishi/bin/rishi run tools/proven_seat_signed_kumara_fetch.rish`

---

## Latch (ask one) — resting

Master-seal rests. Checkable doorway green. Nothing more before the morning open word.

## Crypto teacher — Monocypher

**Chosen.** Fit is exact: a handful of files, no allocation, no system calls on the verify path, drops into the guest build untouched, auditable whole in one sitting.

### Seam (machine-checked — never a red)

Kumara is Zig’s Ed25519 — **RFC 8032 over SHA-512**. Monocypher’s *default* EdDSA runs **BLAKE2b**. The lap **must** use the optional `monocypher-ed25519` module — `crypto_ed25519_check`. Guest source: `crypto_eddsa_` appears **nowhere**; `crypto_ed25519_check` appears at least once. The BLAKE2b door refused by lint forever.

### Vendor pin (live `214900`)

| Pin | Value |
|-----|-------|
| Home | `vendor/monocypher` (submodule · genode-pattern) |
| Tag | **4.0.3** |
| Commit | `ab2b16dd619ad5f6979a4fbe69cfa324a6fcc35f` |
| Forge | `https://github.com/LoupVaillant/Monocypher.git` |
| Guest include surface | `src/monocypher.{c,h}` · `src/optional/monocypher-ed25519.{c,h}` — include path only; teacher byte-pristine |
| Licence | CC0 · 2-clause BSD dual (`LICENCE.md`) — one gratitude line |

`.gitignore` allows `!/vendor/monocypher/` beside `!/vendor/genode/`.

### Three asserts (witness law)

1. **Pin** — `git rev-parse HEAD` equals `ab2b16d…` (GREEN tonight).
2. **Red-avoid** — guest under `tools/proven_seat_signed_kumara_guest/`: no `crypto_eddsa_`; ≥1 `crypto_ed25519_check` (HOLD until guest lands).
3. **Fixture** — host generator signs with Kumara; deterministic seed stays host-side; only pubkey, signature, message arrays in guest; witness re-runs generator and asserts committed arrays match byte for byte (HOLD until generator lands).

### Libsodium park (named trigger)

The libsodium port in genode-world **parks** behind: the **second guest-side crypto need**, or the **Sculpt-and-Goa packaging rung** — whichever arrives first.

---

## Lap in one breath (morning open word)

1. Pin already green — `vendor/monocypher` @ 4.0.3.
2. Host **Kumara** signs the fixture — private key never enters the guest.
3. Only **pubkey**, **signature**, and **message** ride into the guest image.
4. Guest calls `crypto_ed25519_check` — says yes.
5. Serial line: *signature holds; seat verifies*.
6. Witness asserts all three; grade flips **signed-Kumara**; seed never once crosses.

---

*May the pin hold to the commit, the guard keep the wrong door shut, and the morning find the seat ready to verify.*
