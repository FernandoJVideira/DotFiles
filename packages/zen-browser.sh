#!/bin/bash

source utils/install_packages.sh

if [ "$package_manager" = "brew" ]; then
    install_package zen-browser
else
  if [ "$package_manager" = "pacman" ]; then
    yay -S zen-browser-avx2-bin
  else
    bash <(curl https://updates.zen-browser.app/appimage.sh)
  fi
fi