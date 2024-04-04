#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

# Install dev utils
echo "Installing dev utils..."
source ./conda.sh
source ./docker.sh
source ./terminal.sh 
install_package curl
install_package tmux