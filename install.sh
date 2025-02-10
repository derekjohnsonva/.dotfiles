# things that need to be installed
# stow
# git
# zsh
# nvim
# # Things that Nvim needs
# # lazygit
# # fzf
# # ripgrep
# UBUNU INSTALL STUFF
# If it is ubuntu this is what you would need to run
apt update
apt install git zsh neovim gcc stow curl -y
apt install fzf ripgrep -y

# Install Lazygit on ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/

# install antigen
curl -L git.io/antigen >~/antigen.zsh

# stow dotfiles
stow git
stow vim
stow nvim
stow zsh
stow aerc

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
chsh -s $(which zsh) $USER

# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim
vim +PluginInstall +qall
