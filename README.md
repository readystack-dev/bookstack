# BookStack: ReadyStack build kit

The offline build kit for the Docker image `readystack/bookstack:v26.09.3-CE-ubuntu24.04-r3`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v26.09.3-CE-ubuntu24.04-r3](https://github.com/readystack-dev/bookstack/releases/tag/v26.09.3-CE-ubuntu24.04-r3)
- Image: [`docker.io/readystack/bookstack:v26.09.3-CE-ubuntu24.04-r3`](https://hub.docker.com/r/readystack/bookstack/tags), manifest digest `sha256:7dd74866fc6bb09cd0b102c1714c96ca923d3eef1d34f111fbed405c723da1b2`
- Product page: https://readystack.dev/products/bookstack
- Source and build recipe: https://readystack.dev/products/bookstack/recipe
- Build trail: https://readystack.dev/products/bookstack/trail/v26.09.3-CE-ubuntu24.04-r3
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=bookstack

## The image

Single container (Apache + mod_php, one foreground process) running the BookStack Laravel/PHP application. It REQUIRES an EXTERNAL MySQL 8.0+ / MariaDB 10.6+ database the operator provisions and points the container at via DB_HOST/DB_PORT/DB_DATABASE/DB_USERNAME/DB_PASSWORD env vars — there is NO embedded/SQLite database. BookStack creates and migrates its own schema (`php artisan migrate`) on first start. NOT a multi-service cluster and NOT docker-compose/Kubernetes-only, but it is NOT self-contained: a MySQL/MariaDB server is a hard external dependency.

## Who uses BookStack and why

Teams and organisations that want a simple, self-hosted place to write and organise documentation.

BookStack stores knowledge as books, chapters and pages, with a simple WYSIWYG editor and full search, so anyone with basic word-processing skills can write and find documentation.

A typical use: An IT team keeps runbooks, onboarding notes and how-to guides in scattered files. In BookStack each system gets a book, each topic a chapter and each procedure a page; new staff search one place, and anyone who can use a word processor can keep a page up to date.

From the upstream project's own description: https://github.com/BookStackApp/BookStack, https://www.bookstackapp.com/.

## This release

- Docker Scout policy grade at release: **A** (94%), graded 2026-11-24 with `docker scout policy` (CLI 1.26.0, docker-default configuration).
  - Docker Scout counts 139 packages with copyleft licences (GPL, LGPL, MPL), 133 of them operating-system packages (it counts only packages whose licence it can read; the SBOM lists every component).
- Signed with ReadyStack's release key (fingerprint `04daa92344a52dbc`): https://readystack.dev/keys/cosign.pub.
- Runs as a non-root user (`bookstack`).
- Attestations on the image: an SPDX SBOM and SLSA provenance v1.
- Rebuilt from this kit with network egress blocked on 2026-11-24; the rebuilt image digest is the published one.
- Base: Ubuntu 24.04.

The current grade, measured again every day, is on https://readystack.dev/products/bookstack.

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

— ReadyStack · https://readystack.dev
