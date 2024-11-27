#!/bin/bash

source utils/vars.sh
source utils/install_packages.sh

# Install programming languages
echo "Installing programming languages..."
source packages/go.sh
source packages/bun.sh
install_package nodejs
install_package npm
