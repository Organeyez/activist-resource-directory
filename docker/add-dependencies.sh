#!/bin/sh

apk add -U \
  build-base \
  git \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  postgresql-dev \
;

test "$ENV" = "development" && \
  apk add inotify-tools
