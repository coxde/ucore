#!/bin/bash

set -ouex pipefail

# Install packages (TODO: add eza when F42 pkg available)
dnf5 -y install \
    btop \
    cockpit \
    cockpit-files \
    cockpit-ostree \
    duf \
    fastfetch \
    fd-find \
    fish \
    google-authenticator \
    lnav \
    ncdu \
    qrencode-libs \
    restic \
    ugrep \
    zoxide
