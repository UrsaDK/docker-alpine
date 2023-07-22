<div align="center">

  [![docker-template logo](https://avatars.githubusercontent.com/u/2833247?s=160)](#)<br>

  [![stable branch](https://img.shields.io/badge/dynamic/json.svg?logo=github&color=lightgrey&label=stable&query=%24.default_branch&url=https%3A%2F%2Fapi.github.com%2Frepos%2FUrsaDK%2Fdocker-template)](https://github.com/UrsaDK/docker-template)
  [![latest release](https://img.shields.io/badge/dynamic/json.svg?logo=docker&color=blue&label=release&query=%24.name&url=https%3A%2F%2Fapi.github.com%2Frepos%2FUrsaDK%2Fdocker-template%2Freleases%2Flatest)](https://hub.docker.com/r/ursadk/docker-template)
  [![test coverage](https://codecov.io/gh/UrsaDK/docker-template/graph/badge.svg)](https://codecov.io/gh/UrsaDK/docker-template)
  [![donate link](https://img.shields.io/badge/donate-coinbase-gold.svg?colorB=ff8e00&logo=bitcoin)](https://commerce.coinbase.com/checkout/0de16e60-3c37-4f5a-ab85-7a2708b40d68)

</div>

# Docker Alpine Template

A template for a repository that utilises `docker` and requires CI pipeline. The pipeline is run in Github Actions. Baked image are [annotated](https://github.com/opencontainers/image-spec/blob/master/annotations.md) using [OCI Image Format](https://www.opencontainers.org).

- [Requirements](#requirements)
- [Building a new image](#building-a-new-image)

## Requirements

You will definitely need:

  - [git](https://git-scm.com)
  - [docker](https://www.docker.com)
  - [mutagen](https://mutagen.io)
  - [yq](https://github.com/mikefarah/yq)
  - [bash](https://www.gnu.org/software/bash/) including: awk, grep

See [`./macos/README`](./macos/README.md) if you're on MacOS.

Finally, you will want to update the following resources:

  - ./docker-compose.yml - `services → app → image` <br>
    Edit the name portion of the application docker image.

  - ./macos/docker-compose.yml - `sync → * → beta` <br>
    Edit the name portion of the application docker image.

## Building a new image

Docker Compose does not support dynamic variables. Therefore, there is no way to define BUILD_SHA and BUILD_DATE when using `docker compose build`. As such, `docker compose build` is discouraged is favour of `./bin/app build`.
