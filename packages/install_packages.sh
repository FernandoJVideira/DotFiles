#!/bin/bash

source packages/vars.sh

function install_package() {
    case $package_manager in
        "brew")
            brew install "$@"
            ;;
        "apt")
            sudo apt install "$@"
            ;;
        "pacman")
            sudo pacman -S "$@"
            ;;
        "dnf")
            sudo dnf install "$@"
            ;;
        *)
            echo "Unknown package manager"
            exit 1
            ;;
    esac
}