#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
unzip Hack.zip -d Hack
cd ../Hack
cp *.ttf /usr/share/fonts
cd ..
rm -rf Hack
rm Hack.zip

wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip -d JetBrainsMono-2.304
cd ../JetBrainsMono-2.304/fonts/ttf
cp *.ttf /usr/share/fonts
cd ../..
rm -rf JetBrainsMono-2.304
rm JetBrainsMono-2.304.zip
fc-cache -f -s