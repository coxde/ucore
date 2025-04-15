#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 -y install \
    btop \
    cockpit \
    cockpit-files \
    cockpit-ostree \
    duf \
    eza \
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