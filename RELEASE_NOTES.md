# BookStack v26.09.3 — ReadyStack release `v26.09.3-CE-ubuntu24.04-r4`

Generated 2026-11-28 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/bookstack:v26.09.3-CE-ubuntu24.04-r4` (linux/amd64). Index digest `sha256:439155582c6cfffff3a322cef260d24d1d0b0acff3a0f6dcad3aa2619b6b5f6e` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:fad137bc0dd91329b4682b83d5b75195544f7cfa43255b963a946b22360779a6` [`TARGET_DIGEST.txt`].
- **Upstream:** BookStack v26.09.3 built from source at `v26.09.3` of https://github.com/BookStackApp/BookStack — upstream notes: https://github.com/BookStackApp/BookStack/releases/tag/v26.09.3 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `bookstack`.
- **Build:** `source-rebuild-php`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `v26.09.3-CE-ubuntu24.04-r3`.

## What changed in this release

- Upstream version unchanged (v26.09.3); ReadyStack rebuild.
- BookStack v26.09.3 is unchanged from the release this supersedes (v26.09.3-CE-ubuntu24.04-r3); this release rebuilds it. Changes: libexpat1 moves from 2.6.1-2ubuntu0.6 to 2.6.1-2ubuntu0.7 (USN-9196-1). Settings, ports and data volumes are those of v26.09.3-CE-ubuntu24.04-r3: replace the container with this image on the same volumes.

## Security status at release (measured 2026-11-28)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `bookstack` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/bookstack:v26.09.3-CE-ubuntu24.04-r4` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:fad137bc0dd91329b4682b83d5b75195544f7cfa43255b963a946b22360779a6`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 3 of 3 use cases passed (3 authored) against the running image [`docs/validation/test-results.json`].
- The cases are `GET /status` (200), `GET /login` (200), `GET /robots.txt` (200); the suite checks nothing else.

## Known issues

- None found (reviewed by held semantic review (Claude) on 2026-11-28).

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/bookstack:v26.09.3-CE-ubuntu24.04-r4
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

