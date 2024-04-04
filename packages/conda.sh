#!/bin/bash

utils/vars.sh

declare -A os_name
os_name=(["Darwin"]="MacOSX-arm64" ["Linux"]="Linux-x86_64")

mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-${os_name[$os]}.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh