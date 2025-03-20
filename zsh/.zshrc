# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
# plugins can be found here https://github.com/unixorn/awesome-zsh-plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ael-code/zsh-colored-man-pages


# List out all globally installed npm packages
alias list-npm-globals='npm list -g --depth=0'
# Adds better handling for `rm` using trash-cli
# https://github.com/sindresorhus/trash-cli
# You can empty the trash using the empty-trash command
# https://github.com/sindresorhus/empty-trash-cli
# alias rm='trash'

# checkout branch using fzf
alias gcob='git branch | fzf | xargs git checkout'
# use this alias to view images on kitty terminal
alias icat="kitty +kitten icat"
# open vim config from anywhere
# alias vimrc='vim ${HOME}/.config/nvim/init.vim'
alias lg="lazygit"

# DIRCOLORS (MacOS)
# export CLICOLOR=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH
export PATH=${PATH}:${HOME}/bin

# Config for Bat, the cat alternative https://github.com/sharkdp/bat
export BAT_THEME="gruvbox-dark"
# On linux, the apt bat package defaults to using the "batcat" command. I don't like this
# so we will alias it to bat
if [[ "$(uname)" == "Linux" ]]; then
    alias cat="batcat"
    alias bat="batcat"
fi



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
antigen theme romkatv/powerlevel10k
antigen apply


[ -f "/Users/derekjohnson/.ghcup/env" ] && . "/Users/derekjohnson/.ghcup/env" # ghcup-env
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
