#!/bin/bash

source utils/vars.sh
source utils/install_packages.sh

echo "Installing Dependencies..."
install_package sf-symbols
install_package jq
install_package ifstat
install_package gh
install_package font-sf-pro

echo "Installing Sketchybar..." 
install_package sketchybar