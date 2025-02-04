#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 -y install \
    btop \
    cockpit-files \
    duf \
    eza \
    fastfetch \
    fd-find \
    fish \
    lnav \
    ncdu \
    ugrep \
    zoxide \
    rclone \
    restic