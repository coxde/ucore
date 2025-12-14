#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 -y install \
    cockpit \
    cockpit-files \
    cockpit-ostree \
    gcc
