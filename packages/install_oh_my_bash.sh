source install_packages.sh

echo "Installing oh-my-bash..."
if ! command -v curl >/dev/null 2>&1 ; then
    # Install curl
    install_package curl
fi
# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"