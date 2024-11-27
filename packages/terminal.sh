#!/bin/bash

source utils/install_packages.sh
source utils/vars.sh

echo "Installing Wezterm packages..."

if [ "$os" = "Darwin" ]; then
    brew install --cask wezterm
    brew install starship
else
    case $package_manager in
      "apt")
          curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
          echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
          sudo apt update
          install_package wezterm
          ;;
      "pacman")
          yay -S wezterm-git
          ;;
      "dnf")
          sudo dnf install -y https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly-fedora40.rpm
          ;;
      *)
          echo "Unknown package manager"
          exit 1
          ;;
  esac
fi

source packages/zsh_plugins.sh