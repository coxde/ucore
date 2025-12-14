# Global build variables
ARG IMAGE_NAME="${IMAGE_NAME:-ucore}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-coxde}"

# Stage 1: Build context
FROM scratch AS ctx
COPY /build_files /build_files
COPY --from=ghcr.io/projectbluefin/brew:latest /system_files /files
COPY /files /files

# Stage 2: Base image
FROM ghcr.io/ublue-os/ucore:stable

# Use variables in this stage
ARG IMAGE_NAME
ARG IMAGE_VENDOR

# Build
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh

# Linting
RUN bootc container lint
