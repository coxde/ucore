#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 -y install \
    btop \
    cockpit \
    cockpit-files \
    duf \
    eza \
    fastfetch \
    fd-find \
    fish \
    lnav \
    ncdu \
    restic \
    ugrep \
    zoxide