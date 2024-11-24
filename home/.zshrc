#Get OS
os="$(uname)"

#MacOS Path
if [ "$os" = "Darwin" ]; then
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
else
    export PATH="$PATH:/usr/local/go/bin:$PATH"
fi

# User configuration
#Fzf Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Conda Config
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
declare -A homeDir
homeDir=(["Darwin"]="Users" ["Linux"]="home")
declare -A condaDir
condaDir=(["Darwin"]="miniforge3" ["Linux"]="miniconda3")

#Miniconda Config
__conda_setup="$('/$homeDir/fernandovideira/$condaDir/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/${homeDir[$os]}/fernandovideira/${condaDir[$os]}/etc/profile.d/conda.sh" ]; then
        . "/${homeDir[$os]}/fernandovideira/${condaDir[$os]}/etc/profile.d/conda.sh"
    else
        export PATH="/${homeDir[$os]}/fernandovideira/${condaDir[$os]}/bin:$PATH"
    fi
fi
unset __conda_setup

