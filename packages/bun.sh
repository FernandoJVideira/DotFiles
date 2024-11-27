#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

echo "Installing Starship..."

if [ ! check_command "curl" ]; then
    install_package curl
fi

curl -fsSL https://bun.sh/install | sh

echo "Starship installed successfully."