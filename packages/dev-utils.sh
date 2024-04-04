#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

# Install dev utils
echo "Installing dev utils..."
source packages/conda.sh
source packages/docker.sh
source packages/terminal.sh 
install_package tmux
install_package goenv