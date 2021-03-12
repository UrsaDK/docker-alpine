# syntax = docker/dockerfile:latest

FROM alpine:latest AS base
# FROM ruby:3-alpine AS base
# FROM crystallang/crystal:latest-alpine AS base
ARG BUILD_SHA BUILD_DATE
LABEL org.opencontainers.image.vendor="Dmytro Konstantinov" \
    org.opencontainers.image.source="https://ursa.dk/XXX" \
    org.opencontainers.image.revision="${BUILD_SHA}" \
    org.opencontainers.image.created="${BUILD_DATE}"
VOLUME ["/mnt"]
COPY ./dockerfs /
RUN --mount=type=cache,target=/var/cache \
    rm -Rf \
        /etc/inittab \
        /etc/profile.d/color_prompt \
    && sed -i 's#guest:/dev/null:#guest:/home:#' /etc/passwd \
    && chown -R guest:users /home /mnt \
    && apk upgrade \
    && apk add \
        bash \
        less \
    && :
WORKDIR /mnt
ENTRYPOINT ["/etc/init.d/login_shell"]

FROM base AS mutagen
VOLUME ["/mnt"]
USER guest
ENTRYPOINT ["/etc/init.d/login_shell"]

FROM base AS latest
VOLUME ["/mnt"]
# RUN --mount=type=bind,source=/test,target=/home/test,rw \
#     ls -ld /home/test \
#     && ls -la /home/test \
#     && date > /home/test/monkey \
#     && ls -la /home/test \
WORKDIR /mnt
USER guest
ENTRYPOINT ["/etc/init.d/login_shell"]

FROM latest AS stable
ENV APP_ENV=production
VOLUME ["/mnt"]
WORKDIR /home
USER guest
COPY --chown=guest . .
RUN rm -Rf dockerfs \
    && echo -e "${BUILD_SHA}\n${BUILD_DATE}" > /home/VERSION
ENTRYPOINT ["/etc/init.d/login_shell"]
