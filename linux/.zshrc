#Linux Path
export PATH="$PATH:/usr/local/go/bin:$PATH"


# User configuration
#Fzf Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#Conda Config
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#Miniconda Config
__conda_setup="$('/$homeDir/fernandovideira/$condaDir/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fernandovideira/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fernandovideira/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/${homeDir[$os]}/fernandovideira/${condaDir[$os]}/bin:$PATH"
    fi
fi
unset __conda_setup

