#!/bin/bash

# Detect the operating system
OS="$(uname -s)"

# Install packages based on the OS
if [ "$OS" = "Linux" ]; then
  # Ubuntu or other Debian-based systems
  apt update
  apt install git zsh neovim gcc stow curl fzf ripgrep -y
  apt install gh -y

  # Install Lazygit on Ubuntu
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  install lazygit -D -t /usr/local/bin/

  # Add zsh as a login shell
  command -v zsh | tee -a /etc/shells

elif [ "$OS" = "Darwin" ]; then
  # macOS
  # Check if Homebrew is installed, if not, install it
  if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install packages using Homebrew
  brew install git zsh neovim gcc stow curl fzf ripgrep gh

  # Install Lazygit on macOS
  brew install lazygit

  # Add zsh as a login shell
  if ! grep -q "$(which zsh)" /etc/shells; then
    sudo sh -c "echo $(which zsh) >> /etc/shells"
  fi
fi

# Install antigen
curl -L git.io/antigen >~/antigen.zsh

# Stow dotfiles
stow git
stow vim
stow nvim
stow zsh

# Use zsh as default shell
chsh -s $(which zsh) $USER

# Install Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
