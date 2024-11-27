#!/bin/bash

source utils/vars.sh
source utils/install_packages.sh

source utils/utils.sh

echo "Detected OS: $os"
echo "Detected Package Manager: $package_manager"

# Check if the script should start from the middle
if [ "$1" != "continue" ]; then
    source utils/zsh_install.sh

    echo "Removing old config files..."
    rm -rf ~/.zshrc ~/.p10k.zsh ~/.tmux.conf

    echo "Installing Stow..."
    install_package stow

    echo "Installing curl..."
    install_package curl

    if [ "$os" = "Darwin" ]; then
        echo "Setting up MacOS..."
        stow darwin
    else
        echo "Setting up Linux..."
        stow linux
    fi

    echo "Installing Homebrew..."
    source packages/brew.sh

    echo "Homebrew installed! Restarting the shell and re-executing the script..."
    # Restart the shell and re-execute the script from this point
    exec zsh -c "source ~/.zshrc && $0 continue"
fi

echo "Adding General Aliases to zshrc..."
for file in shell/* 
do
    if [ -f "$file" ]; then
        fullpath=$(realpath $file)
        if ask "Source ${file}?"; then
            echo
            echo "source $fullpath" >> ~/.zshrc
        fi
    fi
done

echo "Setting Distros Aliases..."
declare -A distros_aliases
distros_aliases=(["brew"]="shell/mac/macos_aliases.sh" ["pacman"]="shell/arch/arch_aliases.sh" ["dnf"]="shell/fedora/fedora_aliases.sh" ["apt"]="shell/debian/debian_aliases.sh")

if ask "Install $package_manager-based aliases?"; then
    echo "Installing $package_manager-based aliases..."
    echo
    fullpath=$(realpath ${distros_aliases[$package_manager]})
    echo
    echo "source $fullpath" >> ~/.zshrc
fi

if [ "$package_manager" = "pacman" ]; then
    echo "Installing yay..."
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

echo "Installing General Packages..."
for package in "${PACKAGES[@]}"; do
    if ask "Install $package?"; then
        source packages/$package.sh
    fi
done

if [ "$os" = "Darwin" ]; then
    echo "Installing Mac-Specific Packages..."
    for package in "${MAC_PACKAGES[@]}"; do
    if ask "Install $package?"; then
        source macpackages/$package.sh
        fi
    done
fi