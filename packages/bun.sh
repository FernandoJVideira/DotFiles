#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

echo "Installing Bun..."

curl -Ss https://bun.sh/install | sh

echo "Bun installed successfully."