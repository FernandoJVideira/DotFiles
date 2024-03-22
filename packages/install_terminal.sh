#!/bin/bash

source packages/vars.sh
source packages/install_packages.sh

if [ "$package_manager" = "brew" ]; then
    install_package iterm2
    install_package warp
    cp config/com.googlecode.iterm2.plist ~/Library/Preferences
else
    install_package kitty
    fullpath=$(realpath package/config/kitty.conf)
    cp $fullpath ~/.config/kitty/kitty.conf
fi