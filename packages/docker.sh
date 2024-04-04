#!/bin/bash

if check_command "docker"; then
  echo "Docker is already installed!"
else
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  rm -f get-docker.sh
fi