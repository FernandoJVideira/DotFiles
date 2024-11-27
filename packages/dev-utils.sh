#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

# Install dev utils
echo "Installing dev utils..."
source packages/code.sh
source packages/conda.sh
source packages/docker.sh
install_package tmux