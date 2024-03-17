echo "Setting fzf as the default cd command..."
echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" >> ~/.zshrc
echo "fcd() {
    if [ "$#" -ne 0 ]; then
        builtin cd "$@";
    else
        local dir
        dir=$(find ~ -type d 2>/dev/null | fzf +m) && builtin cd "$dir"
    fi
}" >> ~/.zshrc