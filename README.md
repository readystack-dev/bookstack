# BookStack: ReadyStack build kit

The offline build kit for the Docker image `readystack/bookstack:v26.09.3-CE-ubuntu24.04-r3`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v26.09.3-CE-ubuntu24.04-r3](https://github.com/readystack-dev/bookstack/releases/tag/v26.09.3-CE-ubuntu24.04-r3)
- Image: [`docker.io/readystack/bookstack:v26.09.3-CE-ubuntu24.04-r3`](https://hub.docker.com/r/readystack/bookstack/tags), manifest digest `sha256:7dd74866fc6bb09cd0b102c1714c96ca923d3eef1d34f111fbed405c723da1b2`
- Product page: https://readystack.dev/products/bookstack
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=bookstack

BookStack is distributed under its upstream licence (MIT); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v26.09.3-CE-ubuntu24.04-r3 release](https://github.com/readystack-dev/bookstack/releases/tag/v26.09.3-CE-ubuntu24.04-r3): `ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.tar.gz` (201.0 MB), SHA-256 `4da938b6b390c52108cb8d9a70dd8f612782f687d7c8452edb3df4be0b9b1a64`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.rebuild.json.sigstore ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.tar.gz
cd v26.09.3-CE-ubuntu24.04-r3
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-bookstack-v26.09.3-CE-ubuntu24.04-r3.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/bookstack/recipe. The complete kit is the release download. Each release is a tag here.
