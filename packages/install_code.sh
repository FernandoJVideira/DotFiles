source packages/vars.sh
source packages/install_packages.sh

if [ "$os" = "Darwin" ]; then
    install_package visual-studio-code        
else
  case $package_manager in
      "apt")
          sudo apt-get install wget gpg
          wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
          sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
          sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
          rm -f packages.microsoft.gpg
          sudo apt install apt-transport-https
          sudo apt update
          install_package code

          ;;
      "pacman")
          pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
          yay -S visual-studio-code-bin
          ;;
      "dnf")
          sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
          sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
          dnf check-update
          install_package code     
          ;;
      *)
          echo "Unknown package manager"
          exit 1
          ;;
  esac
fi