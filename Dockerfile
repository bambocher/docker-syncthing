FROM alpine:3.4
MAINTAINER Dmitry Prazdnichnov <dp@bambucha.org>

ENV VERSION 0.14.9
ENV CHECKSUM 5e4a505e0683d319c0d38f34be3f2bb53c7c7b8c53a7f0b672381271c1fc8ef4
ENV HOME /mnt

RUN apk --no-cache add ca-certificates openssl \
    && wget https://github.com/syncthing/syncthing/releases/download/v$VERSION/syncthing-linux-amd64-v$VERSION.tar.gz \
    && echo $CHECKSUM "" *.gz | sha256sum -c - \
    && tar zxf *.gz \
    && rm *.gz \
    && mv syncthing*/syncthing /usr/bin \
    && rm -rf syncthing* \
    && apk del openssl

WORKDIR /mnt

USER 1000:1000
VOLUME /srv /mnt
EXPOSE 8384 22000 21025/udp

ENTRYPOINT ["syncthing"]
CMD ["-gui-address=0.0.0.0:8384", "-home=/srv", "-no-browser", "-no-restart", "-logflags=0"]
