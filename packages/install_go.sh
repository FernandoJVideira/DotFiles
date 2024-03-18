source packages/vars.sh
source packages/install_packages.sh

CURRENT_VERSION=$(go version | awk '{print $3}')
VERSION=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')

echo "Current Go version: $CURRENT_VERSION"

if [ "$CURRENT_VERSION" = "$VERSION" ]; then
  echo "Go is already up to date!"
  exit 0
else
  echo "Go is not installed"
  if [ $package_manager = "brew" ]; then
    install_package go
  else
    echo "Downloading Go $VERSION..."
    wget -q https://go.dev/dl/$VERSION.linux-amd64.tar.gz

    echo "Removing old Go version..."
    sudo rm -rf /usr/local/go

    echo "Installing..."
    sudo tar -C /usr/local -xzf $VERSION.linux-amd64.tar.gz

    echo "Cleaning up..."
    rm $VERSION.linux-amd64.tar.gz

    echo "Go $VERSION installed!"
  fi
fi

