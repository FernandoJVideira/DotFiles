#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

os=$(uname)
for file in shell/* 
do
    fullpath=$(realpath $file)
    if ask "Source ${file}?"; then
        echo "source $fullpath" >> ~/.zshrc
    fi
done

# Source Distro-specific aliases
if ["$os" == "Darwin"]; then
    echo "Installing MacOS Aliases..."
    echo "source shell/mac/macos_aliases.sh" >> ~/.zshrc
done
eli
    if type apt >/dev/null 2>&1 ; then
        echo "Installing Ubuntu/Debian Settings..."
        echo "source shell/debian/debian_aliases.sh" >> ~/.zshrc
    fi
    elif type pacman >/dev/null 2>&1 ; then
        echo "Installing Arch-based Aliases..."
        echo "source shell/arch/arch_aliases.sh" >> ~/.zshrc
    fi
    elif type dnf >/dev/null 2>&1 ; then
        echo "Installing Fedora Aliases..."
        echo "source shell/fedora/fedora_aliases.sh" >> ~/.zshrc
    fi
fi

echo "Current shell: $SHELL"
shell=$(basename $SHELL)

if ["$shell" == "zsh"]; then
    echo "Zsh is already installed"
else
    echo "Zsh is not installed"
    echo "Installing zsh..."
    if ["$os" == "Linux"]; then
        if type apt >/dev/null 2>&1 ; then
            sudo apt install zsh
        elif type pacman >/dev/null 2>&1 ; then
            sudo pacman -S zsh
        elif type dnf >/dev/null 2>&1 ; then
            sudo dnf install zsh
    fi
fi

if ask "Change shell to zsh?"; then
    echo "Changing shell to zsh..."
    chsh -s $(which zsh)

    if ask "Install oh-my-zsh?"; then
        echo "Installing oh-my-zsh..."
        # Install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

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

        # Set plugins
        plugins="plugins(git zsh-autosuggestions zsh-syntax-highlighting web-search gh macos)"
        #Get line number of plugins line in .zshrc
        line_number=$(grep -n "plugins=(" ~/.zshrc | cut -d: -f1)
        #Replace plugins line with new plugins
        sed -i "${line_number}s/.*/$plugins/" ~/.zshrc 
        #Add zsh-interactive-cd plugin
        echo "source $ZSH/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh" >> ~/.zshrc
        echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc
    fi

    if ask "Use fzf as the default cd command?"; then
        echo "source shell/fzf/fzf_cd.sh" >> ~/.zshrc
    fi
fi

    if ask "Install conda?"; then
        echo "Installing conda..."
        if ["$os" == "Darwin"]; then
            mkdir -p ~/miniconda3
            curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
            bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
            rm -rf ~/miniconda3/miniconda.sh
        else
            mkdir -p ~/miniconda3
            wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
            bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
            rm -rf ~/miniconda3/miniconda.sh
        fi
        # Add conda to path
        if [ "$shell" == "zsh" ]; then
            echo "export PATH=~/miniconda3/bin:$PATH" >> ~/.zshrc
        elif [ "$shell" == "bash" ]; then
            echo "export PATH=~/miniconda3/bin:$PATH" >> ~/.bashrc
        fi
    fi
    
    if ask "Install exa?"; then
        echo "Installing exa..."
        if ["$os" == "Darwin"]; then
            brew install exa
        else
            if type apt >/dev/null 2>&1 ; then
                sudo apt install exa
            elif type pacman >/dev/null 2>&1 ; then
                sudo pacman -S exa
            elif type dnf >/dev/null 2>&1 ; then
                sudo dnf install exa
        fi
    fi

    if ask "Install Homebrew?"; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Add Homebrew to path
        if [ "$shell" == "zsh" ]; then
            echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
        elif [ "$shell" == "bash" ]; then
            echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.bashrc
        fi
    fi

    if ask "Install tmux?"; then
        echo "Installing tmux..."
        if ["$os" == "Darwin"]; then
            brew install tmux
        else
            if type apt >/dev/null 2>&1 ; then
                sudo apt install tmux
            elif type pacman >/dev/null 2>&1 ; then
                sudo pacman -S tmux
            elif type dnf >/dev/null 2>&1 ; then
                sudo dnf install tmux
        fi
    fi

    # Tmux conf
    if ask "Do you want to install .tmux.conf?"; then
        ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
    fi
echo "Installation complete. Please restart your terminal."
