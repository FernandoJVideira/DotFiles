#Get OS
os="$(uname)"

#MacOS Path

#Homebrew Path
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
#Velox Path
export PATH="$PATH:$HOME/velox"
#Go Path
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
#Node Path
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
#Bun Path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# User configuration
#Fzf Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(thefuck --alias)"

#Conda Config
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fernandovideira/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fernandovideira/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/fernandovideira/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fernandovideira/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

