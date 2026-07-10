# Granary Weave Settle — Seated

**Stamp:** `20260710.172625` (Kaeden: keep going after compass hygiene)
**Language:** EN
**Style:** Radiant (see `../RADIANT_STYLE.md`)
**Status:** Seated — Granary lap 6 in-process weave settle; parity **243**
**Ground:** Granary seating [`20260710-163043_granary-name-seated.md`](20260710-163043_granary-name-seated.md) · Mandi settle sibling [`20260710-171202_mandi-listing-settle-seated.md`](20260710-171202_mandi-listing-settle-seated.md) · commerce plainly [`../../external-research/20260710-171707_granary-mandi-commerce-plainly.md`](../../external-research/20260710-171707_granary-mandi-commerce-plainly.md)

*Written by Kaeden and Rio 3.*

---

## The ruling

A Granary Exchange listing may close with a signed `weave-settle-v1` slip that binds:

1. **listing_receipt** — digest of the identity-free weave listing body
2. **payment** — digest of `weave-payment-v1` (amount + MALA send digest + WOV transfer digest)

Kumara seed `0x69`. No buyer/seller fields. Same unwelcome bolt as Mandi vessel settle. Live TigerBeetle waits its own gate.

## First lap (landed `20260710.172625`)

In-process only: Exchange listing at 100 mala → MALA mint/send fold + WOV mint/transfer → settle slip. Module `granary/weave_settle_core.rye`; witness `tools/granary_weave_settle.rish`; parity **243**.

---

*May every weave sold be named honestly and closed on digests that outlive the handshake.*
