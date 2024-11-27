#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

echo "Installing Starship..."

curl -Ss https://starship.rs/install.sh | sh

echo "Starship installed successfully."