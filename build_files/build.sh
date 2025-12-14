#!/bin/bash

set -ouex pipefail

echo "::group:: ===== Copy Files ====="
cp -avf "/ctx/files"/. /
echo "::endgroup::"

echo "::group:: ===== Manage Packages ====="
/ctx/build_files/01-packages.sh
echo "::endgroup::"

echo "::group:: ===== Configure System ====="
/ctx/build_files/06-config.sh
echo "::endgroup::"

echo "::group:: ===== Clean System ====="
/ctx/build_files/99-cleanup.sh
echo "::endgroup::"
