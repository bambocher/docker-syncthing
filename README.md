# Alpine Syncthing Docker Container

[![GitHub Tag](https://img.shields.io/github/tag/bambocher/docker-syncthing.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)
[![Docker Stars](https://img.shields.io/docker/stars/bambucha/syncthing.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)
[![Layers](https://images.microbadger.com/badges/image/bambucha/syncthing.svg)](https://microbadger.com/images/bambucha/syncthing/)
[![Docker Pulls](https://img.shields.io/docker/pulls/bambucha/syncthing.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)
[![Docker Automated Build](https://img.shields.io/badge/automated-build-green.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)
[![Docker License](https://img.shields.io/badge/license-MIT-green.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)

## Usage

```shell
docker run \
    --d \
    --restart always \
    --name syncthing \
    --user $(id -u):$(id -g) \
    --p 8384:8384 \
    --p 22000:22000 \
    --p 21025:21025/udp \
    --v $(pwd)/config:/srv \
    --v $(pwd)/data:/mnt \
    bambucha/syncthing
```

## License

[The MIT License](LICENSE)
