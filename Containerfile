# Build context
FROM scratch AS ctx
COPY / /

# Base image
FROM ghcr.io/ublue-os/ucore-minimal:stable AS base

# Environments
ARG IMAGE_NAME="${IMAGE_NAME:-ucore}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-coxde}"

# Build
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh && \
    ostree container commit