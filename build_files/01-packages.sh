#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 -y install \
    cockpit \
    cockpit-ostree \
    gcc
