export SHELL=/bin/zsh
export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/local/bin/vim
export AWS_DEFAULT_REGION=eu-west-1
export KEYTIMEOUT=1
export TIMER_FORMAT='[%d]'

# turn off brew auto update
export HOMEBREW_NO_AUTO_UPDATE=1

ZSH_THEME="TheOne"
ZSH_DISABLE_COMPFIX=true

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

plugins=(
  ssh-agent \
  git \
  vi-mode \
  web-search \
  autojump \
  docker docker-compose \
  urltools \
  catimg \
  fancy-ctrl-z \
  zsh_reload \
  nvm \
  fzf \
  node \
  yarn \
  python
  # timer \
)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH="$HOME/go"
export BAT_THEME=TwoDark

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh

which direnv > /dev/null && eval "$(direnv hook zsh)"

# Add scripts to PATH
export PATH="$PATH:$HOME/scripts"

# Add haskell & stack binaries
export PATH="$PATH:$HOME/Library/Haskell/bin:$HOME/.local/bin"

# Add latex
export PATH="$PATH:/usr/local/texlive/2019basic/bin/x86_64-darwin"

# Add Go binaries
export PATH="$PATH:$HOME/go/bin"

# Add Rust binaries
export PATH="$PATH:$HOME/.cargo/bin"

alias grv > /dev/null && unalias grv
alias stack > /dev/null && unalias stack

# load ~/.zshrc.local
[[ -s $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
