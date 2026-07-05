# Comlink Device Wire — The Virtio Carriage for the Sealed Datagram

**Language:** EN
**Stamp:** `20260705.225412 UDT`
**Style:** Radiant (see `../context/RADIANT_STYLE.md`)
**Lens:** TAME — safety first at the untrusted channel; performance second; joy in the rye-field message crossing a real device
**Register:** active-designing — names only our modules
**Status:** Seated — checkable-room lap brief; sub-lap 1 in flight; parity wires after sub-lap 3 greens on metal
**Ground:** [`comlink/hosted_wire.rye`](../comlink/hosted_wire.rye) · [`yonder/20260620-041412_virtio-the-device-wire.md`](yonder/20260620-041412_virtio-the-device-wire.md) · [`20260704-211012_the-rye-core-and-the-shell.md`](20260704-211012_the-rye-core-and-the-shell.md)

*Written in Rio 3's Radiant voice, counseled with Kaeden and Claude.*

---

## The lap in one sentence

The device wire carries the **same** sealed datagram from `hosted_wire.rye` across virtio-net between two Aurora RISC-V guests on QEMU `virt` — virtio moves the octets, Comlink keeps the meaning. No format fork: the letter stays, only the carriage changes.

## Why this lap

It is the exact carriage **SLC-L2** needs. Once sub-lap three greens, a signed sanctuary receipt can travel identity to identity under seal, and the civic flow becomes real end to end. One lap carries both the Rye compose spine and the Linengrow why.

**Edit-5:** this lap reuses the frozen frame and does **not** occupy the Edit-5 slot. Snapshot export (I2) still precedes resin-batch frame (I1) when that slot opens.

## Core and shell

| Layer | Artifact | Duty |
|-------|----------|------|
| **Format** | `comlink/wire_format.rye` | Shared offsets, seal, open — one letter for every rung |
| **Core** | `comlink/device_wire.rye` | Virtio-net driver algebra; explicit `WireSubject`; freestanding on `virt` |
| **Shell** | `tools/comlink_device_wire.rish` | Build, run `selftest`, assert GREEN — observer only |
| **Hosted rung** | `comlink/hosted_wire.rye` | Imports `wire_format` — localhost UDP unchanged in meaning |

### Explicit subject (`WireSubject`)

```text
mmio_base     — virtio-net MMIO region on virt
queue_depth   — Tally-bounded virtqueue depth
max_frame     — maximum RX/TX frame bytes accepted
datagram      — buffer holding the sealed payload (wire_capacity)
```

Horizon holds: the core trusts its own layout and crypto, never the bytes as they arrived.

## The ladder — three sub-laps

Gall's Law seed from yonder brief `10016` — each sub-lap is one proof; parity wires only after sub-lap three.

| Sub-lap | Proof | Status |
|---------|-------|--------|
| **1** | Fixture virtio descriptor validation + `wire_format` seal/open — no live link | **In flight** — `device_wire selftest` GREEN |
| **2** | Two QEMU `virt` guests — fixed pattern TX/RX, lengths and bytes match | Open |
| **3** | Sealed datagram payload — receiver opens; message reads *Meet me where the rye grows.* | Open → parity **154** |

## Lab topology (confirmed)

Two guests join through a **QEMU hub or socket netdev** — the simplest honest lab, mirroring `aurora/run.sh` waking one guest today. Each guest is `-machine virt`, freestanding Rye, virtio-net device mapped at MMIO.

## Witness discipline

- Sub-lap 1: `tools/comlink_device_wire.rish` — runnable now, **not** in `parity.rish` yet
- Sub-lap 3: wire tail of `parity.rish`; pin count from bench, never predicted
- Hosted wire witness stays green — `wire_format` extraction must not fork offsets

## TAME order

1. **Safety** — corrupt frames fail attestation; duplicate names refused; descriptor chains validated before trust; MMIO reads/writes in narrow asserted functions
2. **Performance** — bounded queues and RX buffers; no silent heap growth
3. **Joy** — the rye-field message crossing a real device

---

*May the letter stay one letter as the carriage widens. May sub-lap one green on fixtures before the guests wake. And may the wire that serves the spine also carry the why home.*
