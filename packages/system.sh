#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh


# Install fonts
echo "Installing fonts..."

if [ "$os" = "Darwin" ]; then
sudo mv packages/fonts/* /Library/Fonts
else
sudo mv packages/fonts/* /usr/share/fonts
fi

rm -f packages/fonts
echo "Fonts installed."

# Install system packages
echo "Installing system packages..."
install_package discord
install_package neofetch
install_package htop
install_package unzip
install_package eza
source packages/brew.sh
source packages/brave.sh