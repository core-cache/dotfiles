#!/bin/bash

set -oe pipefail

function ensure_installed {
  which $1 && echo "$1 already installed" || brew install $1
}

DOTFILES_SRC=${DOTFILES_SRC:-~/.dotfiles}

# config
mkdir -p ~/.config

# init vim
VUNDLE_DEST=~/.vim/bundle/Vundle.vim
test -e $VUNDLE_DEST || git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DEST
ln -sf $DOTFILES_SRC/.vimrc ~
vim +PluginInstall +qall

# init zsh
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -o ~/.oh-my-zsh/themes/TheOne.zsh-theme https://raw.githubusercontent.com/benniemosher/the-one-theme/master/zsh/TheOne.zsh-theme
ln -sf $DOTFILES_SRC/.zshrc ~
ln -sf ~/.dotfiles/.oh-my-zsh/custom/* ~/.oh-my-zsh/custom/

# init bash
ln -sf $DOTFILES_SRC/.bashrc ~

# search
ln -sf $DOTFILES_SRC/.ackrc ~

# atom
mkdir -p ~/.atom
ln -sf $DOTFILES_SRC/.atom/config.cson ~/.atom/config.cson
ln -sf $DOTFILES_SRC/.atom/keymap.cson ~/.atom/keymap.cson

# eslint
ln -sf $DOTFILES_SRC/.eslintrc.yml ~

# scripts
ln -sf $DOTFILES_SRC/scripts ~

# init tmux
ensure_installed tmux
TPM_DEST=~/.tmux/plugins/tpm
test -e $TPM_DEST || git clone https://github.com/tmux-plugins/tpm $TPM_DEST
ln -sf $DOTFILES_SRC/.tmux.conf ~
ln -sf $DOTFILES_SRC/.tmux.mac.conf ~
ln -sf $DOTFILES_SRC/.tmux.linux.conf ~

# utils
ensure_installed grv
ensure_installed ctags

# git
test -e ~/.gitconfig || cp $DOTFILES_SRC/.gitconfig ~

# ctags
ln -sf $DOTFILES_SRC/.ctags ~

# neovim
mkdir -p ~/.config/nvim
ln -sf $DOTFILES_SRC/config/nvim/init.vim ~/.config/nvim/

# wakatime
test -e ~/.wakatime.cfg || cp $DOTFILES_SRC/.wakatime.cfg ~

# karabiner
ln -sf $DOTFILES_SRC/config/karabiner ~/.config/karabiner

# vs code
VS_CODE_SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p $VS_CODE_SETTINGS_DIR
ln -sf $DOTFILES_SRC/vscode/settings.json $VS_CODE_SETTINGS_DIR

# prettier
ln -sv $DOTFILES_SRC/.prettierrc ~/

# global ignore file
ln -sf $DOTFILES_SRC/.ignore ~/

# global mysql config file
ln -sf $DOTFILES_SRC/.my.cnf ~/

# python
ln -sf $DOTFILES_SRC/config/pycodestyle ~/.config/pycodestyle
