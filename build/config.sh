#!/bin/bash

set -ouex pipefail

# Disable Fedora telemetry
# https://docs.projectbluefin.io/analytics/#fedora
systemctl mask rpm-ostree-countme.timer

# Disable connectivity check
# https://www.ctrl.blog/entry/network-connection-http-checks.html
# https://wiki.archlinux.org/title/NetworkManager#Checking_connectivity
tee /etc/NetworkManager/conf.d/20-connectivity.conf <<EOF
[connectivity]
enabled=false
EOF

# Disable Tailscale telemetry
tee -a /etc/default/tailscaled <<EOF
TS_NO_LOGS_NO_SUPPORT=true
EOF

# Enable Firewalld logging
sed -i 's/\s*LogDenied=.*$/LogDenied=all/g' /etc/firewalld/firewalld.conf

# Revert removing 40-disable-passwords.conf
# https://github.com/ublue-os/ucore/blob/f7de750a04aeecc35848b540ce06ad073b55f82d/ucore/post-install-ucore-minimal.sh#L36
# https://github.com/coreos/fedora-coreos-config/blob/stable/overlay.d/15fcos/etc/ssh/sshd_config.d/40-disable-passwords.conf
tee /etc/ssh/sshd_config.d/40-disable-passwords.conf <<EOF
# Disable password logins by default.
# https://github.com/coreos/fedora-coreos-tracker/issues/138
# This file must sort before 50-redhat.conf, which enables
# PasswordAuthentication.
PasswordAuthentication no
EOF

# Enable systemd services
systemctl enable tailscaled.service
systemctl enable cockpit.service
systemctl enable docker.service