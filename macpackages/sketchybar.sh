#!/bin/bash

source utils/vars.sh
source utils/install_packages.sh

echo "Installing Dependencies..."
install_package sf-symbols
install_package jq
install_package ifstat
install_package gh

echo "Installing Sketchybar..."
brew install sketchybar