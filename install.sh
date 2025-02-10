# things that need to be installed
# stow
# git
# zsh
# nvim
# # Things that Nvim needs
# # lazygit
# # fzf
# # ripgrep
# If it is ubuntu this is what you would need to run
apt update
apt install git zsh neovim stow curl -y

# install antigen
curl -L git.io/antigen >antigen.zsh

# stow dotfiles
stow git
stow vim
stow nvim
stow zsh
stow aerc

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim
vim +PluginInstall +qall
