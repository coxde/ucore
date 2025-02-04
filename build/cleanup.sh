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

# Enable services
systemctl enable tailscaled.service
systemctl enable cockpit.service
systemctl enable docker.service

# Clean temp files
# Enable extended globbing
shopt -s extglob

dnf5 clean all
rm -rf /tmp/* || true
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)