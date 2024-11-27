#!/bin/bash

source utils/vars.sh
source utils/install_packages.sh

# Install programming languages
echo "Installing programming languages..."
source packages/bun.sh
source packages/golang.sh

install_package nodejs
install_package npm
brew install thefuck
