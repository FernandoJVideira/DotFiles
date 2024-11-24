#!/bin/bash
# This script is meant to be sourced by other scripts
# It sets the OS and package manager variables

# Detect OS
export os=$(uname)

# Detect Package Manager
package_manager=""
if [ "$os" = "Darwin" ]; then
    package_manager="brew"
elif [ "$os" = "Linux" ]; then
    package_manager=$(type -p apt > /dev/null && echo "apt"; type -p pacman > /dev/null && echo "pacman"; type -p dnf > /dev/null && echo "dnf")
fi
export package_manager

# List of packages to install
PACKAGES=(
  "system"
  "dev-utils"
  "programming"
)
export PACKAGES

MAC_PACKAGES=(
  "sketchybar"
  "skhd"
  "yabai"
  "wezterm"
)
export MAC_PACKAGES