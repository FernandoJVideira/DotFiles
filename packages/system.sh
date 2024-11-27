#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

# List of packages to install
SYSPACKAGES=(
  "fastfetch"
  "btop"
  "unzip"
  "eza"
  "wezterm"
)

# Install fonts
echo "Installing fonts..."
if [ "$os" = "Darwin" ]; then
sudo mv packages/fonts/* /Library/Fonts
else
sudo mv packages/fonts/* /usr/share/fonts
fi
rm -f packages/fonts
echo "Fonts installed."

# Install system packages
echo "Installing system packages..."
for package in "${SYSPACKAGES[@]}"; do
  if ask "Install $package?"; then
    install_package $package
  fi
done
source packages/starship.sh
source packages/brave.sh