# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH
#MacOS Path
if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
    export PATH="$PATH:$HOME/velox"
    #Go Path
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
    #Node Path
    export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
else
    export PATH="$PATH:/usr/local/go/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

#export custom prompt
export PS1="%n$"

# Powerlevel10k Prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh b

# Load zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search gh macos)  
source $ZSH_CUSTOM/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source $ZSH/oh-my-zsh.sh

# User configuration
#Fzf Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Function to use fzf with default cd command
fcd() {
    if [ "$#" -ne 0 ]; then
        builtin cd "$@";
    else
        local dir
        dir=$(find ~ -type d 2>/dev/null | fzf +m) && builtin cd "$dir"
    fi
}

eval "$(goenv init -)"

#Conda Config
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#Check if running macOS or Linux
if [[ "$(uname)" == "Darwin" ]]; then
    homeDir="Users"
    condaDir="miniforge3"
else
    homeDir="home"
    condaDir="miniconda3"
fi

#Miniconda Config
__conda_setup="$('/$homeDir/fernandovideira/$condaDir/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/$homeDir/fernandovideira/$condaDir/etc/profile.d/conda.sh" ]; then
        . "/$homeDir/fernandovideira/$condaDir/etc/profile.d/conda.sh"
    else
        export PATH="/$homeDir/fernandovideira/$condaDir/bin:$PATH"
    fi
fi
unset __conda_setup