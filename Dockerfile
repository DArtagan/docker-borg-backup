FROM alpine:latest
MAINTAINER William Weiskopf <william@weiskopf.me>

RUN apk add --no-cache \
  borgbackup \
  openssh-client \
  bash

ENTRYPOINT ["borg"]
