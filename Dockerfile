FROM alpine:3.4
MAINTAINER Dmitry Prazdnichnov <dp@bambucha.org>

ARG VCS_REF
ARG VERSION

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=https://github.com/bambocher/docker-syncthing \
      org.label-schema.version=$VERSION \
      org.label-schema.license=MIT \
      org.label-schema.schema-version="1.0"

ENV URL=https://github.com/syncthing/syncthing/releases/download \
    API=https://api.github.com/repos/syncthing/syncthing/releases/latest \
    XDG_CONFIG_HOME=/ \
    HOME=/mnt \
    BUILD="curl tar"

RUN apk --no-cache add ca-certificates $BUILD && \
    curl -sL $URL/$VERSION/syncthing-linux-amd64-$VERSION.tar.gz | \
    tar xz --no-anchored -C /usr/bin --strip-components=1 syncthing && \
    apk del $BUILD

WORKDIR /mnt

USER 1000:1000
VOLUME ["/syncthing", "/mnt"]
EXPOSE 8384 22000 21027/udp

ENTRYPOINT ["syncthing"]
CMD ["-gui-address=:8384", "-no-browser", "-no-restart", "-logflags=0"]
