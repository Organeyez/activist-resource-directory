FROM ruby:2.4.4-alpine

ARG ENV=${ENV:-production}

ENV EXECJS_RUNTIME='Node'

RUN mkdir -p /opt/yard
WORKDIR /opt/yard

ADD docker ./docker
RUN docker/add-dependencies.sh

VOLUME [ "/opt/yard" ]

ADD Gemfile* ./
RUN docker/build.sh

ADD . .
RUN docker/cleanup.sh

EXPOSE ${PORT}
