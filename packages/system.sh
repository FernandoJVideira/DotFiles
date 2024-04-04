#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh


# Install fonts
echo "Installing fonts..."

if [ "$os" = "Darwin"]; then
sudo mv ./fonts/* /Library/Fonts
else
sudo mv ./fonts/* /usr/share/fonts
fi

rm -rf ./fonts
echo "Fonts installed."

# Install system packages
echo "Installing system packages..."
install_package discord
install_package neofetch
install_package htop
install_package unzip
install_package eza
source ./brew.sh
source ./brave.sh