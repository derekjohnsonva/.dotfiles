# things that need to be installed
# nvim
# stow
# zsh

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

# install neovim plugins
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim
vim +PluginInstall +qall
# Use kitty terminal on MacOS
[ $(uname -s) = 'Darwin' ] && stow kitty
