#!/bin/bash

utils/vars.sh
source utils/install_packages.sh

if [ "$package_manager" = "brew" ]; then
    install_package iterm2
    install_package warp
    cp config/com.googlecode.iterm2.plist ~/Library/Preferences
else
    install_package kitty
    cd .. && stow kitty
fi