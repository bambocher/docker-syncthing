# Syncthing Docker Image

[![Version](https://images.microbadger.com/badges/version/bambucha/syncthing.svg)](https://microbadger.com/images/bambucha/syncthing) [![Layers](https://images.microbadger.com/badges/image/bambucha/syncthing.svg)](https://microbadger.com/images/bambucha/syncthing/) [![Commit](https://images.microbadger.com/badges/commit/bambucha/syncthing.svg)](https://microbadger.com/images/bambucha/syncthing) [![License](https://images.microbadger.com/badges/license/bambucha/syncthing.svg)](https://microbadger.com/images/bambucha/syncthing) [![Automated Build](https://img.shields.io/docker/automated/bambucha/syncthing.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/) [![Docker Pulls](https://img.shields.io/docker/pulls/bambucha/syncthing.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)

[Syncthing](https://github.com/syncthing/syncthing/) [Docker](https://docker.com/) image based on [Alpine](https://alpinelinux.org/) Linux and support [Inotify](https://github.com/bambocher/docker-syncthing-inotify) image.

## [Docker Run](https://docs.docker.com/engine/reference/run/)

```shell
SYNC_USER=$(id -u)
SYNC_GROUP=$(id -g)
SYNC_CONF=$(pwd)/config
SYNC_DATA=$(pwd)/data
sudo mkdir $SYNC_DATA $SYNC_CONF
sudo chown $SYNC_USER:$SYNC_GROUP $SYNC_DATA $SYNC_CONF

sudo docker run \
    -d \
    --restart always \
    --name syncthing \
    --user $SYNC_USER:$SYNC_GROUP \
    -p 8384:8384 \
    -p 22000:22000 \
    -p 21025:21025/udp \
    -p 21026:21026/udp \
    -p 21027:21027/udp \
    -v $SYNC_CONF:/syncthing \
    -v $SYNC_DATA:/mnt \
    bambucha/syncthing
```

## [Docker Compose](https://docs.docker.com/compose/) with [Inotify](https://github.com/bambocher/docker-syncthing-inotify/) image

```shell
SYNC_USER=1000
SYNC_GROUP=1000
SYNC_CONF=$(pwd)/config
SYNC_DATA=$(pwd)/data
sudo mkdir $SYNC_DATA $SYNC_CONF
sudo chown $SYNC_USER:$SYNC_GROUP $SYNC_DATA $SYNC_CONF
```

```shell
vi docker-compose.yml
```

```yml
version: "2"
services:
  syncthing:
    restart: always
    image: bambucha/syncthing
    user: 1000:1000
    volumes:
      - ./config:/syncthing
      - ./data:/mnt
    ports:
      - 8384:8384
      - 22000:22000
      - 21025:21025/udp
      - 21026:21026/udp
      - 21027:21027/udp
  inotify:
    restart: always
    image: bambucha/syncthing-inotify
    user: 1000:1000
    volumes:
      - ./config:/syncthing:ro
      - ./data:/mnt:ro
    links:
      - syncthing
```

```shell
docker-compose up -d
```

## License

[The MIT License](LICENSE)
