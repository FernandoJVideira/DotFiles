#!/bin/bash

source utils/install_packages.sh
source utils/utils.sh

if ! command_check "curl"; then
    # Install curl
    install_package curl
fi
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"