#!/bin/bash

source vars.sh
source utils.sh
source install_packages.sh

# Verify if zsh is installed
if ! check_command "zsh" ; then
    echo "Installing zsh..."
    install_package zsh
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
    echo "Zsh installed successfully., please restart your terminal after script run ends."
else
    echo "Zsh is already installed."
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Setting zsh as default shell..."
        chsh -s $(which zsh)
        echo "Zsh is now your default shell."
    else
        echo "Zsh is already your default shell."
    fi
fi