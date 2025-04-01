#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -xeou pipefail

# Convince the installer we are in CI
touch /.dockerenv

# Make these so script will work
mkdir -p /var/home
mkdir -p /var/roothome

# Pixi Install Script
curl --retry 3 --silent --show-error --output /tmp/pixi-install --location https://pixi.sh/install.sh 
chmod +x /tmp/pixi-install
/tmp/pixi-install
tar --zstd -cvf /usr/share/pixi.tar.zst /home/linuxpixi/.pixi

echo "::endgroup::"
