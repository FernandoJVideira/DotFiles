#! /bin/bash

source utils/vars.sh
source utils/install_packages.sh

# List of packages to install
SYSPACKAGES=(
  "btop"
  "unzip"
  "eza"
  "libreoffice"
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

brew install fastfetch
brew install zoxide
source packages/terminal.sh
source packages/starship.sh
source packages/zen-browser.sh