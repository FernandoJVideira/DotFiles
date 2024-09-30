#!/bin/bash

source utils/install_packages.sh

if [ "$os" = "macos" ]; then
    install_package yabai
    install_package skhd
fi