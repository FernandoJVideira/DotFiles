#!/bin/bash

sudo chmod 777 packages/*
sudo chmod 777 packages/config/*
sudo chmod 777 shell/*

source utils/vars.sh
source utils/install_packages.sh
source packages.sh

source utils/utils.sh

echo "Detected OS: $os"
echo "Detected Package Manager: $package_manager"

echo "Removing old config files..."
rm -rf ~/.zshrc ~/.p10k.zsh ~/.tmux.conf
source packages/install_stow.sh

echo "Stowing Config Files..."
stow home

echo "Installing Zsh plugins..."
source packages/install_zsh_plugins.sh

echo "Adding Aliases to zshrc..."
for file in shell/* 
do
    if [ -f "$file" ]; then
        fullpath=$(realpath $file)
        if ask "Source ${file}?"; then
            echo "source $fullpath" >> ~/.zshrc
        fi
    fi
done
echo "Setting Distros Aliases..."
declare -A distros_aliases
distros_aliases=(["brew"]="shell/mac/macos_aliases.sh" ["pacman"]="shell/arch/arch_aliases.sh" ["dnf"]="shell/fedora/fedora_aliases.sh" ["apt"]="shell/debian/debian_aliases.sh")

echo "Installing $package_manager-based Aliases..."
fullpath=$(realpath ${distros_aliases[$package_manager]})
echo "source $fullpath" >> ~/.zshrc


if package_manager = "pacman"; then
    echo "Installing yay..."
    pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

echo "Installing Packages..."
for package in "${PACKAGES[@]}"; do
    if ask "Install $package?"; then
        source packages/install_$package.sh
    fi
done
