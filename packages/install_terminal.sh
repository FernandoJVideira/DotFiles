#!/bin/bash

source packages/vars.sh
source packages/install_packages.sh

if [ "$package_manager" = "brew" ]; then
    install_package iterm2
    cp config/com.googlecode.iterm2.plist ~/Library/Preferences
else
    install_package kitty
    fullpath=$(realpath config/kitty.conf)
    cp $fullpath ~/.config/kitty/kitty.conf
fi