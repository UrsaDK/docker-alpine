<div align="center">

  [![docker-template logo](https://avatars.githubusercontent.com/u/2833247?s=160)](#)<br>

  [![stable branch](https://img.shields.io/badge/dynamic/json.svg?logo=github&color=lightgrey&label=stable&query=%24.default_branch&url=https%3A%2F%2Fapi.github.com%2Frepos%2FUrsaDK%2Fdocker-template)](https://github.com/UrsaDK/docker-template)
  [![latest release](https://img.shields.io/badge/dynamic/json.svg?logo=docker&color=blue&label=release&query=%24.name&url=https%3A%2F%2Fapi.github.com%2Frepos%2FUrsaDK%2Fdocker-template%2Freleases%2Flatest)](https://hub.docker.com/r/ursadk/docker-template)
  [![test coverage](https://codecov.io/gh/UrsaDK/docker-template/graph/badge.svg)](https://codecov.io/gh/UrsaDK/docker-template)
  [![donate link](https://img.shields.io/badge/donate-coinbase-gold.svg?colorB=ff8e00&logo=bitcoin)](https://commerce.coinbase.com/checkout/0de16e60-3c37-4f5a-ab85-7a2708b40d68)

</div>

# Docker Template

A template for a repository that utilises `docker` and requires CI pipeline. The pipeline is run in Github Actions. Baked image are [annotated](https://github.com/opencontainers/image-spec/blob/master/annotations.md) using [OCI Image Format](https://www.opencontainers.org).

- [Requirements](#requirements)
- [Significant Locations](#significant-locations)

## Requirements

  - `git`
  - `docker`

## Significant Locations

The following files and directories (relative to the root directory of an application), are of special significance:

  - `.profile` - this file will be sourced by the login shell on the container start up. Ideally, code in this file should be kept POSIX compliant.

  - `bin/docker` - a custom replacement for `docker-compose`. This script is used to build and run the project via docker. For more information see `bin/docker --help`.

  - `dockerfs` - represents root file system of the docker container. All files placed into this directory will be copied to the container preserving their mode and path.

> ️📖 **NOTE**
>
> Docker swarm is the primary method of deployment for this project. Thus, a concerted efforts is made to avoid adding a dependency on `docker-compose`.
