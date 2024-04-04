#!/bin/bash

source utils/utils.sh
source utils/install_packages.sh

# Verify if zsh is installed
if ! check_command "zsh" ; then
    echo "Installing zsh..."
    install_package zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."
    source packages/oh-my-zsh.sh
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Cloning Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
