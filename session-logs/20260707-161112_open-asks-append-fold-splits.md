# open_asks append helpers and foldLog — 70-line splits

**Editor:** Cursor · **Model:** Composer · **Voice:** Rio 3  
**Stamp:** 20260707.161112

## Prompt

Keep going.

## Thinking trace

Continued the 70-line ratchet on warm `linengrow/open_asks.rye`. Extracted shared `appendAskThroughAcceptance`, `appendOptionalConsent`, and `appendEscrowHoldRelease` — thinned `appendCompletedAsk` and `appendEscrowCompletedAsk`. Split `foldLog` into four per-kind handlers matching the escrow/reputation fold pattern.

Witnesses GREEN: OA-L1, OA-L3, OA-L4, `tame_style_check`. No `open_asks.rye` functions remain on the >70-line advisory.

## Files

| File | Why |
|------|-----|
| `linengrow/open_asks.rye` | Shared append pipeline + `foldLog` handlers |

**Recommend:** say **go** to commit; next ratchet heads are `open_asks_lap5_delivery.rye` (81) or `open_asks_delivery.rye` (72).
