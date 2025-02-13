#!/bin/bash

set -ouex pipefail

echo "::group:: ===== Manage Packages ====="
/ctx/build/packages.sh
echo "::endgroup::"

echo "::group:: ===== Configure System ====="
/ctx/build/config.sh
echo "::endgroup::"

echo "::group:: ===== Clean System ====="
/ctx/build/cleanup.sh
echo "::endgroup::"