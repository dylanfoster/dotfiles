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
alias l='tree --dirsfirst -aFCNL 1'
alias ll='tree --dirsfirst -aLpughDFiC 1'
alias lsd='ll -d'
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

# npm

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npp() {
  npm publish $@
}

# network

alias ip='curl -s http://checkip.dyndns.com/ | sed "s/[^0-9\.]//g"'
alias whois='whois -h whois-servers.net'
# osx

if [ $(uname -s) = 'Darwin' ]; then
  alias cleanup='find . -name "*.DS_Store" -type f -ls -delete'
  alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'
  alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
  alias flushdns='dscacheutil -flushcache'
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
