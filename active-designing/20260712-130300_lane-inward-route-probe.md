# Lane inward — Claude evolution counsel · Route-one probe

*Kaeden asked whether our `~/veganreyklah2` jail wrappers can evolve so on-path goals run inside an `ai-jail` command. Claude answered Route one (teacher flag + splice) vs Route two (nest bwrap — Pond clothes). This note seats the counsel and the probe result from the gratitude study surface — teacher unmodified.*

**Stamp:** `20260712.130300`
**Language:** EN
**Style:** Radiant
**Voice:** Rio 3 recording Claude · Kaeden’s clock from the 13:03 paste
**Status:** Counsel seated · **Route one flag absent** · Route two **parked for word** · host one-shot still worded
**Ground:** ruling [`../counsel/20260712-090512_claude-ruling-enclosure-ai-jail-then-pond.md`](../counsel/20260712-090512_claude-ruling-enclosure-ai-jail-then-pond.md) · wrappers `tools/cursor-jail.sh` · gate `tools/lane_kvm.sh` · gratitude study `gratitude/ai-jail/src/cli.rs` + `sandbox/bwrap.rs` (GPL-3.0 — ideas only)

---

## Host one-shot safety (Claude affirm)

Safe to run on the Framework host under human-in-the-loop: `-nic none`, no virtfs/9p, artifacts under `tools/.cache/proven-seat/`, QMP unix socket only, sha256-pinned copy boot, no sudo/D-Bus/systemd. QEMU is the wall; guest is the same upstream Sculpt family already booted for G0-complete. Jail encloses agents; this run is Kaeden’s hand at a verified nib.

**Pre-flight additions (human-in-loop):**

1. `git verify-commit HEAD` on the host clone (sandbox key)
2. Read the three short scripts once: `lane_kvm.sh`, `run_with_lane_kvm.sh`, `proven_seat_g0c_lane_kvm.sh`
3. After refuse-probe: `git status --porcelain` should print silence (cache gitignored)
4. Parity re-pin remains optional same-sitting; pin what it prints; red twice parks

A-narrow remains interim; Pond wins the lane home by out-refusing.

---

## Evolution — two routes (Claude)

| Route | Shape | Stop-and-park? |
|-------|--------|----------------|
| **One** | `lane_kvm.sh jail-flags` prints teacher device flag when lane on + kvm present; launch wrappers splice like `GPU_ARGS`; `--no-save-config` keeps it ephemeral; on-state adds jailed node+smoke; seccomp unknown until smoke | None if teacher already has the flag |
| **Two** | Thin witness-only nest of bwrap with same jail shape + one `--dev-bind /dev/kvm` — proven-seat only; daily editors stay vanilla ai-jail | **Yes** — module home (`tools/` vs `pond/`) and name (Pond customs) await Kaeden word. Patching teacher declines |

---

## Route-one probe (this tree · study only)

Teacher CLI (`gratitude/ai-jail` HELP): **`--gpu` / `--no-gpu`** is the only device-passthrough option. There is **no** `--kvm`, **no** generic `--dev` for arbitrary nodes. `--rw-map` / `--map` are filesystem binds (`--bind` / `--ro-bind`), not `--dev-bind`. GPU discovery alone uses `Mount::DevBind` for `/dev/dri` and nvidia nodes.

**Verdict:** Route one as “config + splice existing flag” **does not land** on today’s teacher. Stretching `--rw-map /dev/kvm` would use the wrong mount kind and is not the GPU pattern — decline as a side door. True enclosed KVM wants either a teacher `--kvm` (upstream ask · we do not patch) or **Route two** (parked).

Wrappers already wait: `cursor-jail.sh` sources `AIJAIL_FLAGS` + `GPU_ARGS` beside `--no-save-config`; `LANE_KVM=true` today only warns that the teacher does not pass kvm.

---

## Sequencing (needs Kaeden word)

Claude offered two honest orderings:

1. **Host first** — run the worded Framework one-shot; evolve the inward lane afterward  
2. **Probe-then-enclose** — was for when Route one flag exists; **flag absent**, so this shape collapses to Route two (parked) or host-first

Default keep-going without a new name: **host one-shot as worded**, then Route two / Pond doorway on further word.

---

## Out of scope until word

- Implementing `jail-flags` that invents a non-existent teacher flag  
- Nesting bwrap (Route two)  
- Patching `gratitude/ai-jail`  
- Reopening D-Bus / systemd host escapes  
