# Keys in This Folder

**Language:** EN
**Last updated:** 2026-06-21 (`015712`)

---

These two OpenPGP public keys are **not** duplicates. They share an email and creation date yet carry **different fingerprints** and **different roles**.

| File | Fingerprint (short) | Role |
|------|---------------------|------|
| `gpg_signing_06462132.pub.asc` | `0646 2132 … FA7A` | **Master identity** — root of trust for tags, messages, and certifying other keys. ASCII-only UID. Stays outside the sandbox. |
| `rye_signing_DBF853.pub.asc` | `DBF8 5343 … 2B99` | **Sandbox signing** — dedicated, revocable key the automated agent uses inside ai-jail. Day-to-day commit **Verified** badges on the forges use this fingerprint. |

Canonical fingerprints and SSH keys live in [`../PUBKEYS.md`](../PUBKEYS.md).

**Why keep both in the repo:** anyone cloning the project can verify commits against the sandbox key without hunting an external paste. The master public key is published here so the trust chain is visible — master certifies sandbox; sandbox signs commits — without ever placing private material in the tree.

---

*May the split stay clear: one key for the root of trust, one for the sandbox that signs the work.*
