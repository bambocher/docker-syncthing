FROM alpine:3.4
MAINTAINER Dmitry Prazdnichnov <dp@bambucha.org>

ENV VERSION 0.13.4-r0
ENV HOME /mnt

RUN apk --no-cache add syncthing=$VERSION

VOLUME /config

EXPOSE 8384 22000 21027/udp

WORKDIR /mnt

USER 1000:1000

CMD ["-gui-address=0.0.0.0:8384", "-home=/config", "-no-browser", "-no-restart"]

ENTRYPOINT ["syncthing"]
