# docker-syncthing

[![Docker Layers](https://badge.imagelayers.io/bambucha/syncthing:latest.svg)](https://imagelayers.io/?images=bambucha/syncthing:latest 'Get your own badge on imagelayers.io')
[![Docker Pulls](https://img.shields.io/docker/pulls/bambucha/syncthing.svg)](https://registry.hub.docker.com/u/bambucha/syncthing/)

Alpine Syncthing Docker Container

Run Syncthing container:

```shell
docker run \
    --user 1000:1000 \
    --publish 8384:8384 \
    --publish 22000:22000 \
    --publish 21027:21027/udp \
    --volume `pwd`/config:/config \
    --volume `pwd`/Sync:/mnt/Sync \
    --name syncthing \
    --restart always \
    --detach \
    bambucha/syncthing
```

### License

[The MIT License (MIT)](LICENSE)
