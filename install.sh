#!/bin/bash

source packages/vars.sh
source packages/install_packages.sh

echo "Detected OS: $os"
echo "Detected Package Manager: $package_manager"

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    [[ "${resp,,}" =~ ^(y|)$ ]]
}

for file in shell/* 
do
    if [ -f "$file" ]; then
        fullpath=$(realpath $file)
        if ask "Source ${file}?"; then
            echo "source $fullpath" >> ~/.${shell}rc
        fi
    fi
done

if command -v git >/dev/null 2>&1; then
    echo "Git is already installed"
else
    echo "Git is not installed"
    if ask "Install git?"; then
        install_package git
    fi
fi

if command -v zsh >/dev/null 2>&1; then
    echo "Zsh is already installed"
else
    echo "Zsh is not installed"
    if ask "Install zsh?"; then
        install_package zsh
    fi
fi

# Verify if zsh is installed
if command -v zsh >/dev/null 2>&1; then
    if ask "Change shell to zsh & install oh-my-zsh?"; then
        echo "Changing shell to zsh..."
        fullpath=$(realpath packages/install_oh_my_zsh.sh)  
        source $fullpath

        if ask "Install and set zsh plugins?"; then
            echo "Installing and setting zsh plugins..."
            fullpath=$(realpath packages/install_zsh_plugins.sh)
            source $fullpath
        fi

        if ask "Use fzf as the default cd command?"; then
            echo "Using fzf as the default cd command..."
            fullpath=$(realpath shell/fzf/fzf_cd.sh)
            echo "source $fullpath" >> ~/.zshrc
        fi
    fi
fi

if command -v bash >/dev/null 2>&1 && [ "$shell" = "bash" ]; then
    if ask "Install oh-my-bash?"; then
        echo "Installing oh-my-bash..."
        fullpath=$(realpath packages/install_oh_my_bash.sh)
        source $fullpath
    fi
fi

if ask "Install Terminal?"; then
    echo "Installing Terminal..."
    fullpath=$(realpath packages/install_terminal.sh)
    source $fullpath
fi

if ask "Install Fonts?"; then
    echo "Installing Fonts..."
    fullpath=$(realpath packages/install_fonts.sh)
    source $fullpath
fi

if ask "Install Homebrew?"; then
    echo "Installing Homebrew..."
    fullpath=$(realpath packages/install_homebrew.sh)
    source $fullpath
fi

if ask "Install exa?"; then
    echo "Installing exa..."
    f
    install_package exa
fi

if ask "Install tmux?"; then
    echo "Installing tmux..."
    install_package tmux
fi

# Tmux conf
if ask "Load .tmux.conf?"; then
    ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
fi

if ask "Install conda?"; then
    echo "Installing conda..."
    fullpath=$(realpath packages/install_conda.sh)
    source $fullpath
fi

if ask "Install VsCode?" ; then
    echo "Installing VsCode..."
    fullpath=$(realpath packages/install_vscode.sh)
    source $fullpath
fi

if ask "Install Go?"; then
    echo "Installing Go..."
    fullpath=$(realpath packages/install_go.sh)
    source $fullpath
fi

if ask "Install Node & npm?"; then
    echo "Installing Node & npm..."
    fullpath=$(realpath packages/install_node.sh)
    source $fullpath
fi

if ask "Install Docker?"; then
    echo "Installing Docker..."
    fullpath=$(realpath packages/install_docker.sh)
    source $fullpath
fi

if ask "Install Brave?"; then
    echo "Installing Brave..."
    fullpath=$(realpath packages/install_brave.sh)
    source $fullpath
fi