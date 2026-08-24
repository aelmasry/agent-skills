# Upstream skill packages

Source snapshots for external skill libraries. **Do not edit skills here** — change upstream or re-vendor.

After updating a package:

```bash
./scripts/slim-packages.sh      # optional — drop upstream tests/docs from packages/
./scripts/vendor-external-skills.sh
./install.sh
```

| Directory | Upstream | Pin file |
|-----------|----------|----------|
| `superpowers/` | https://github.com/obra/superpowers | `VENDOR_VERSION` |
| `delegate-skills/` | https://github.com/amElnagdy/delegate-skills | `VENDOR_VERSION` |
| `review-skills/` | https://github.com/amElnagdy/review-skills | `VENDOR_VERSION` |

See [docs/EXTERNAL_SKILLS.md](../docs/EXTERNAL_SKILLS.md) for verification notes and skill inventory.
