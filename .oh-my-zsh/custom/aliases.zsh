alias vim='/usr/local/bin/vim'
alias vi=vim
alias v=vim

alias ..='cd ..'
alias cdd='cd -'
alias cdg='cd ~/git'

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

alias ctags='/usr/local/bin/ctags'

alias pm='pmake --jobs 5'

alias ag='ag --path-to-ignore ~/.ignore'

# programming

alias py='python'

function light() {
  if [ -z "$2" ]
  then
    src=$(pbpaste)
  else
    src=$(cat $2)
  fi
  echo $src | highlight -O rtf --syntax $1 --font Inconsolata --style solarized-dark --font-size 24 | pbcopy
}

function aliases-relink () {
  ln -sf ~/.dotfiles/.oh-my-zsh/custom/* ~/.oh-my-zsh/custom/
}
