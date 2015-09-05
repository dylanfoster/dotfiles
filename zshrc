if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt EXTENDED_GLOB
setopt RM_STAR_SILENT

################################################################################
# aliases

alias ...='cd ../../'
alias ....='cd ../../../'
alias l='ls -al'
alias dev='cd /Users/shared/git'

md() {
  mkdir -p "$argv"
  cd "$argv"
}

unalias rm

# Git

alias g='git'
alias clone='g clone'
alias ga='g add -Av'
alias gb='g branch'
alias gbd='gb -d'
alias gc='g commit'
alias gcm='gc -m'
alias gd='g diff'
alias gm='g merge'
alias gms='gm --squash'
alias gp='g push'
alias gr='g remote'
alias grv='gr -v'
alias gs='g status'
alias gu='g pull'
alias gup='g pull --rebase'

# Shows files changed for a given path (gfc master..release)
alias gfc='git diff-tree --no-commit-id --name-only -r'

# Shorter more useful log
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

# osx

if [ $(uname -s) = 'Darwin' ]; then
  alias cleanup
  alias emptrytrash
  alias afk
fi

# tmux

alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tml='tmux list-sessions'
tmn() {
  if [ ! -z $argv ]; then
    name=$argv
  else
    name=$(basename $(pwd) | sed 's/^\.//')
  fi
  echo $name

  tmux new -s "$name"
}

# vim

alias vclean='rm $HOME/.vim/swaps/*'
