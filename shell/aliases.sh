#General (All OSes)
# Check if exa is installed
if command -v exa >/dev/null 2>&1; then
    alias ls="exa"
fi

alias c="clear"

if command -v brew >/dev/null 2>&1; then
  alias bupd="brew update && brew upgrade"
  alias bi="brew install"
  alias bs="brew search"
fi