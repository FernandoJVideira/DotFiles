#!/bin/bash

os=$(uname)
package_manager=""

if [ "$os" == "Darwin" ]; then
    package_manager="brew"
elif [ "$os" == "Linux" ]; then
    package_manager=$(type -p apt > /dev/null && echo "apt"; type -p pacman > /dev/null && echo "pacman"; type -p dnf > /dev/null && echo "dnf")
fi

echo "Detected OS: $os"
echo "Detected Package Manager: $package_manager"

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    [[ "${resp,,}" =~ ^(y|)$ ]]
}


function install_package() {
    case $package_manager in
        "brew")
            brew install "$@"
            ;;
        "apt")
            sudo apt install "$@"
            ;;
        "pacman")
            sudo pacman -S "$@"
            ;;
        "dnf")
            sudo dnf install "$@"
            ;;
        *)
            echo "Unknown package manager"
            exit 1
            ;;
    esac
}

echo "Current shell: $SHELL"
shell=$(basename $SHELL)

if [ -f /usr/bin/zsh ]; then
    echo "Zsh is already installed"
else
    echo "Zsh is not installed"
    echo "Installing zsh..."
    install_package zsh
fi

if ask "Change shell to zsh?"; then
    if ask "Install oh-my-zsh?"; then
        echo "Installing oh-my-zsh..."
        if ! command -v curl >/dev/null 2>&1 ; then
            # Install curl
            install_package curl
        fi
        # Install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    for file in shell/* 
    do
        if [ -f "$file" ]; then
            fullpath=$(realpath $file)
            if ask "Source ${file}?"; then
                echo "source $fullpath" >> ~/.zshrc
            fi
        fi
    done

    declare -A distros_aliases
    distros_aliases=(["brew"]="shell/mac/macos_aliases.sh" ["pacman"]="shell/arch/arch_aliases.sh" ["dnf"]="shell/fedora/fedora_aliases.sh" ["apt"]="shell/debian/debian_aliases.sh")

    # Source Distro-specific aliases
    echo "Installing $package_manager-based Aliases..."
    fullpath=$(realpath ${distros_aliases[$package_manager]})
    echo "source $fullpath" >> ~/.zshrc

    if ask "Install and set zsh plugins?"; then
        #Load ZSH plugins
        echo "Installing ZSH plugins..."
        # Install zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        # Install zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

        # Install fzf
        echo "Installing fzf..."
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install

        sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search gh)/' ~/.zshrc 
        #Add zsh-interactive-cd plugin
        echo "source $ZSH/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh" >> ~/.zshrc
        echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc
    fi

    if ask "Use fzf as the default cd command?"; then
        fullpath=$(realpath shell/fzf/fzf_cd.sh)
        echo "source $fullpath" >> ~/.zshrc
    fi
fi

if ask "Install conda?"; then
    echo "Installing conda..."

    declare -A os_name
    os_name=(["Darwin"]="MacOSX-arm64" ["Linux"]="Linux-x86_64")

    mkdir -p ~/miniconda3
    curl https://repo.anaconda.com/miniconda/Miniconda3-latest-${os_name[$os]}.sh -o ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh

    # Add conda to path
    echo "export PATH=~/miniconda3/bin:$PATH" >> ~/.${shell}rc
fi

if ask "Install exa?"; then
    echo "Installing exa..."
    install_package exa
fi

if ask "Install Homebrew?"; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to path

    echo "export PATH=~/miniconda3/bin:$PATH" >> ~/.${shell}rc
fi

if ask "Install tmux?"; then
    echo "Installing tmux..."
    install_package tmux
fi

# Tmux conf
if ask "Do you want to install .tmux.conf?"; then
    ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
fi
