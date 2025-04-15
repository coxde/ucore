#!/bin/bash

set -ouex pipefail

echo "::group:: ===== Manage Packages ====="
/ctx/packages.sh
echo "::endgroup::"

echo "::group:: ===== Configure System ====="
/ctx/config.sh
echo "::endgroup::"

echo "::group:: ===== Clean System ====="
/ctx/cleanup.sh
echo "::endgroup::"