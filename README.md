[<img src="https://hotio.dev/img/trackarr.png" alt="logo" height="130" width="130">](https://gitlab.com/cloudb0x/trackarr)

[![GitHub Source](https://img.shields.io/badge/github-source-ffb64c?style=flat-square&logo=github&logoColor=white)](https://github.com/docker-hotio/docker-trackarr)
[![GitHub Registry](https://img.shields.io/badge/github-registry-ffb64c?style=flat-square&logo=github&logoColor=white)](https://github.com/users/hotio/packages/container/package/trackarr)
[![Docker Pulls](https://img.shields.io/docker/pulls/hotio/trackarr?color=ffb64c&style=flat-square&label=pulls&logo=docker&logoColor=white)](https://hub.docker.com/r/hotio/trackarr)
[![Discord](https://img.shields.io/discord/610068305893523457?style=flat-square&color=ffb64c&label=discord&logo=discord&logoColor=white)](https://hotio.dev/discord)
[![Upstream](https://img.shields.io/badge/upstream-project-ffb64c?style=flat-square)](https://gitlab.com/cloudb0x/trackarr)
[![Website](https://img.shields.io/badge/website-hotio.dev-ffb64c?style=flat-square)](https://hotio.dev/containers/trackarr)

## Starting the container

Just the basics to get the container running:

```shell hl_lines="4 5 6 7 8 9"
docker run --rm \
    --name trackarr \
    -p 7337:7337 \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=002 \
    -e TZ="Etc/UTC" \
    -e ARGS="" \
    -e DEBUG="no" \
    -v /<host_folder_config>:/config \
    hotio/trackarr
```

The [highlighted](https://hotio.dev/containers/trackarr) variables are all optional, the values you see are the defaults.

## Tags

| Tag                | Upstream                       | Version | Build |
| -------------------|--------------------------------|---------|-------|
| `release` (latest) | Releases                       | ![version](https://img.shields.io/badge/dynamic/json?color=f5f5f5&style=flat-square&label=&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Fdocker-hotio%2Fdocker-trackarr%2Frelease%2FVERSION.json) | ![build](https://img.shields.io/github/workflow/status/docker-hotio/docker-trackarr/build/release?style=flat-square&label=) |
| `nightly`          | Every commit to develop branch | ![version](https://img.shields.io/badge/dynamic/json?color=f5f5f5&style=flat-square&label=&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Fdocker-hotio%2Fdocker-trackarr%2Fnightly%2FVERSION.json) | ![build](https://img.shields.io/github/workflow/status/docker-hotio/docker-trackarr/build/nightly?style=flat-square&label=) |

You can also find tags that reference a commit or version number.

## Configuration location

Your trackarr configuration inside the container is stored in `/config/app`, to migrate from another container, you'd probably have to move your files from `/config` to `/config/app`.

## Executing your own scripts

If you have a need to do additional stuff when the container starts or stops, you can mount your script with `-v /docker/host/my-script.sh:/etc/cont-init.d/99-my-script` to execute your script on container start or `-v /docker/host/my-script.sh:/etc/cont-finish.d/99-my-script` to execute it when the container stops. An example script can be seen below.

```shell
#!/usr/bin/with-contenv bash

echo "Hello, this is me, your script."
```

## Troubleshooting a problem

By default all output is redirected to `/dev/null`, so you won't see anything from the application when using `docker logs`. Most applications write everything to a log file too. If you do want to see this output with `docker logs`, you can use `-e DEBUG="yes"` to enable this.
