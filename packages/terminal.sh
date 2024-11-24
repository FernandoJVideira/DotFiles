#!/bin/bash

source utils/install_packages.sh

echo "Installing Wezterm packages..."
brew install wezterm
brew install starship

echo "Stowing config..."
stow wezterm
stow starship.toml

echo "Installing Zsh plugins..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "Zsh plugins installed."

echo "Adding config to .zshrc..."
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
