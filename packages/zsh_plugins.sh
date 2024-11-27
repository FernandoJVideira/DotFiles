#!/bin/bash

echo "Installing Zsh plugins..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "Zsh plugins installed."

echo "Adding config to .zshrc..."
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Install fzf
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "fzf installed!"