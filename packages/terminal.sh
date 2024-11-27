#!/bin/bash

source utils/install_packages.sh

echo "Installing Wezterm packages..."
brew install wezterm
brew install starship

source packages/zsh_plugins.sh