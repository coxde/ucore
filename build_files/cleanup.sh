#!/bin/bash

set -ouex pipefail

# Clean temp files
# https://github.com/ublue-os/bazzite/blob/main/build_files/finalize
dnf5 clean all

rm -rf /tmp/* || true
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;

mkdir -p /var/tmp
chmod -R 1777 /var/tmp