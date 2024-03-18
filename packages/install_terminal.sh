source vars.sh
source install_packages.sh

if [ "$package_manager" = "brew" ] then;
    install_package iterm2
    cp config/com.googlecode.iterm2.plist ~/Library/Preferences
else
    install_package kitty
    cp config/kitty.conf ~/.config/kitty/kitty.conf
fi