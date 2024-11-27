#!/bin/bash

source utils/install_packages.sh
source utils/vars.sh

echo "Installing Wezterm packages..."

if [ "$os" = "Darwin" ]; then
    brew install --cask wezterm
    brew install starship
elif [ "$os" = "Linux" ]; then
    brew tap wez/wezterm-linuxbrew
    brew install wezterm
fi

source packages/zsh_plugins.sh