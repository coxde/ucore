#!/bin/bash

set -ouex pipefail

# Clean temp files
# Enable extended globbing
shopt -s extglob

dnf5 clean all
rm -rf /tmp/* || true
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)