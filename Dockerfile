FROM alpine:latest
MAINTAINER William Weiskopf <william@weiskopf.me>

RUN apk add --no-cache \
    fuse \
    libacl \
    libattr \
    lz4 \
    openssl \
    pkgconfig \
    python3 \
 && apk add --no-cache --virtual=build-dependencies \
    acl-dev \
    attr-dev \
    fuse-dev \
    gcc \
    lz4-dev \
    musl-dev \
    openssl-dev \
    python3-dev \
 && python3 -m ensurepip \
 && pip3 install -U pip virtualenv \
 && virtualenv /env \
 && /env/bin/pip3 install setuptools_scm llfuse \
 && /env/bin/pip3 install borgbackup \
 && apk del build-dependencies

ENTRYPOINT ["/env/bin/borg"]

