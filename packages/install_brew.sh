source vars.sh

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to path
if [ "$os" = "Darwin" ]; then
    echo "eval $(/opt/homebrew/bin/brew shellenv)" >> ~/.${shell}rc
else
    echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.${shell}rc
fi