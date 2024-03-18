source vars.sh

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

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search gh)/' ~/.zshrc 
#Add zsh-interactive-cd plugin
echo "source $ZSH/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh" >> ~/.zshrc
echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc