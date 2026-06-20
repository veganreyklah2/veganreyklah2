# Gratitude Licenses — Clean-Room Discipline

`gratitude/` is a reading library, not a dependency. We study concepts; we never copy code.

## GPL projects (sixos, ai-jail, damus, nix, libqrencode)

- Study public documentation and design concepts only
- Never copy code from GPL sources into our modules
- For GPL-licensed display/compositor sources (e.g. River): rely on public protocol specs (Wayland, Vulkan) and documentation rather than reading implementation code
- Our implementations are written from scratch in Rye, expressed through quarantined clean-room briefs in `active-designing/`

## Permissive projects (zig, dvui, s6, skalibs, urbit, tigerbeetle, sui, primal, manyana)

- Safe to study freely — MIT, ISC, Apache 2.0, public domain
- Still write our own implementations; concepts enter through the clean room

## The clean-room path

External research (`external-research/`) studies the world with attribution. Active designing (`active-designing/`) names only our own modules. The quarantine boundary keeps the reading and the building separate.
