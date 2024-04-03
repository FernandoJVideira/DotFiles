#!/bin/bash

function check_command () {
  command -v $1 >/dev/null 2>&1;
}

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    [[ "${resp,,}" =~ ^(y|)$ ]]
}