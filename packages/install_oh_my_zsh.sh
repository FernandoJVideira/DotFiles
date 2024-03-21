#!/bin/bash

source packages/install_packages.sh

if ! command -v curl >/dev/null 2>&1 ; then
    # Install curl
    install_package curl
fi
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"