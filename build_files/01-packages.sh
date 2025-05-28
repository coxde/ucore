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

# Install 3rd party packages
## eza
curl --retry 3 -L -s https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | tar xz
install -Dm0755 -t /usr/local/bin/ eza
rm -f eza

curl --retry 3 --create-dirs -Lo \
    /usr/share/fish/vendor_completions.d/eza.fish \
    https://github.com/eza-community/eza/raw/refs/heads/main/completions/fish/eza.fish
