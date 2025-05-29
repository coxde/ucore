#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 -y install \
    btop \
    cockpit \
    cockpit-files \
    cockpit-ostree \
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

# Install COPR packages
dnf5 -y copr enable alternateved/eza
dnf5 -y install eza
dnf5 -y copr disable alternateved/eza
