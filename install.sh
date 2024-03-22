#!/bin/bash

source packages/vars.sh
source packages/install_packages.sh

chmod 777 packages/*
chmod 777 packages/config/*
chmod 777 shell/*

echo "Detected OS: $os"
echo "Detected Package Manager: $package_manager"

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    [[ "${resp,,}" =~ ^(y|)$ ]]
}

# Verify if zsh is installed
if command -v zsh >/dev/null 2>&1; then
    if ask "Change shell to zsh & install oh-my-zsh?"; then
        source packages/install_oh_my_zsh.sh

        if ask "Install and set zsh plugins?"; then
            source packages/install_zsh_plugins.sh
        fi

        if ask "Use fzf as the default cd command?"; then
            fullpath=$(realpath shell/fzf/fzf_cd.sh)
            echo "source $fullpath" >> ~/.zshrc
        fi
    fi
fi

for file in shell/* 
do
    if [ -f "$file" ]; then
        fullpath=$(realpath $file)
        if ask "Source ${file}?"; then
            echo "source $fullpath" >> ~/.${shell}rc
        fi
    fi
done

if command -v zsh >/dev/null 2>&1; then
    echo "Zsh is already installed"
else
    echo "Zsh is not installed"
    if ask "Install zsh?"; then
        install_package zsh
    fi
fi

if command -v bash >/dev/null 2>&1 && [ "$shell" = "bash" ]; then
    if ask "Install oh-my-bash?"; then
        source packages/install_oh_my_bash.sh
    fi
fi

if ask "Source Distro Aliases?"; then
    declare -A distros_aliases
    distros_aliases=(["brew"]="shell/mac/macos_aliases.sh" ["pacman"]="shell/arch/arch_aliases.sh" ["dnf"]="shell/fedora/fedora_aliases.sh" ["apt"]="shell/debian/debian_aliases.sh")

    echo "Installing $package_manager-based Aliases..."
    fullpath=$(realpath ${distros_aliases[$package_manager]})
    echo "source $fullpath" >> ~/.${shell}rc
fi

if ask "Install Terminal?"; then
    source packages/install_terminal.sh
fi

if ask "Install Fonts?"; then
    source packages/install_fonts.sh
fi

if ask "Install Homebrew?"; then
    source packages/install_brew.sh
fi

if ask "Install exa?"; then
    echo "Installing exa..."
    install_package exa
fi

if ask "Install tmux?"; then
    echo "Installing tmux..."
    install_package tmux
fi

# Tmux conf
if ask "Load .tmux.conf?"; then
    ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
fi

if ask "Install conda?"; then
    source packages/install_conda2.sh
fi

if ask "Install VsCode?" ; then
    echo "Installing VsCode..."
    source packages/install_code.sh
fi

if ask "Install Go?"; then
    source packages/install_go.sh
fi

if ask "Install Node & npm?"; then
    source packages/install_node.sh
fi

if ask "Install Docker?"; then
    source packages/install_docker.sh
fi

if ask "Install Brave?"; then
    source packages/install_brave.sh
fi