# Provenance — BookStack (`v26.09.3-CE-ubuntu24.04-r3`)

Every item below is copied from a record in this archive; the record is named in brackets.

## Source

- Upstream repository: https://github.com/BookStackApp/BookStack
- Revision built: `v26.09.3` (commit `bf680915b6dbaf93eee5234ec72dc33bc5abafbf`)
- Source tree: `c735e100fd0c427420fd2fa7b4692756bb713b94d7ff80338925b8ab48b0d5d4` over 2621 files [`docs/provenance/SOURCE_TREE_HASH.json`]
- Community Edition only: enterprise code is removed or refused before the build (CE audit at acquire).

## Build

- Method: `source-rebuild-php`; base image `ubuntu:24.04`
- Built with `--network=none` from vendored source, dependencies and base images; BuildKit pinned to `moby/buildkit:v0.31.2` (shipped in `toolchain/`).
- SOURCE_DATE_EPOCH: `1795543172` [`SOURCE_DATE_EPOCH.txt`]
- Frozen inputs: [`docs/provenance/FREEZE_MANIFEST.json`], build recipe: [`docs/provenance/BUILD_RECIPE.json`].

## Output

- Published image: `readystack/bookstack:v26.09.3-CE-ubuntu24.04-r3` — index digest `sha256:fc79843c8f391e2b306bc7d9a8144d7aa25871da0a4dc9b6eed9ded0ce303729` [`docs/provenance/LOCKED_DIGEST.txt`]
- linux/amd64 image digest `sha256:7dd74866fc6bb09cd0b102c1714c96ca923d3eef1d34f111fbed405c723da1b2` — reproduced from this archive before publishing [`docs/provenance/REPRO_VERIFICATION.json`].

## Attestations and signature

- SBOM + SLSA provenance attached to the image: attached: an SPDX SBOM and SLSA v1 provenance [`docs/provenance/SCOUT_VERDICT.json`]
- cosign signature by the ReadyStack release key: verified before publishing. Check it: `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/bookstack:v26.09.3-CE-ubuntu24.04-r3`

## Pinned inputs, and why

- 32 pinned inputs, each with where it came from, why this one, how it was checked and when it was decided: `docs/PINS.md` [`docs/provenance/PINS.json`] (upstream source 2, base and build images 2, image digests 3, language runtimes and toolchains 2, dependency versions readystack sets 13, pins in the kit's dockerfiles 3, readystack's build engine 2, dependencies upstream chose 2, services the release checks run beside 3).

## Build trail

- How this release passed through the ReadyStack harness, record by record (every chain, drive, stage, review round, defect and check, each naming the record it is copied from): `ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.trail.json`, published beside this archive and signed with the release key (`ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.trail.json.sigstore`), and readable at https://readystack.dev/products/bookstack/trail/v26.09.3-CE-ubuntu24.04-r3.

