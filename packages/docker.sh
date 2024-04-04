#!/bin/bash

if command -v docker >/dev/null 2>&1; then
  echo "Docker is already installed!"
else
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
fi