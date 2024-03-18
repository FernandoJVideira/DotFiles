export $os=$(uname)
echo "Current shell: $SHELL"
export shell=$(basename $SHELL)

package_manager=""

if [ "$os" == "Darwin" ]; then
    package_manager="brew"
elif [ "$os" == "Linux" ]; then
    package_manager=$(type -p apt > /dev/null && echo "apt"; type -p pacman > /dev/null && echo "pacman"; type -p dnf > /dev/null && echo "dnf")
fi

export package_manager