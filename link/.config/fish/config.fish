set fish_greeting

set -x EDITOR vim
set -x GOPATH $HOME/go
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x NVM_DIR $HOME/nvm
set -x VISUAL $EDITOR
set -x TERM xterm-256color

# Docker
set -x DOCKER_HOST tcp://127.0.0.1:2375

# Paths
function add_path --argument-names path
  test -d $path; and set PATH $path $PATH
end

add_path /usr/local/bin
add_path /usr/bin
add_path /bin
add_path /usr/local/sbin
add_path /usr/sbin
add_path /sbin
add_path /opt/subversion/bin
add_path $HOME/.dotfiles/bin
add_path $GOPATH/bin

# Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias dev 'cd /Users/Shared/git'
alias k 'l'
alias l 'tree --dirsfirst -aFCNL 1'
alias ll 'tree --dirsfirst -aLpughDFiC 1'
alias lsd 'll -d'

# Completions
function make_completion --argument-names alias command
  echo "
  function __alias_completion_$alias
    set -l cmd (commandline -o)
    set -e cmd[1]
    complete -C\"$command \$cmd\"
  end
  " | .
  complete -c $alias -a "(__alias_completion_$alias)"
end

function alias_and_complete --argument-names alias command
  make_completion $alias "$command"
  alias $alias "$command"
end

# Aliases
## Git
alias df 'df -h'
alias fs 'stat -f "%z bytes"'
alias_and_complete clone 'git clone'
alias_and_complete g 'git'
alias_and_complete ga 'git add -Av'
alias_and_complete gcm 'git commit -m'
alias_and_complete gco 'git checkout'
alias_and_complete gd 'git diff'
alias_and_complete gdc 'git diff --cached'
alias_and_complete gu 'git pull origin $current_branch'
alias_and_complete gp 'git push origin $current_branch'
alias_and_complete gr 'git remote'
alias_and_complete grv 'git remote -v'
alias glog 'git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gpa 'git push origin $current_branch; and git push --tags'
alias_and_complete gs 'git status'

## Utilities
alias ip 'curl -s http://checkip.dyndns.com/ | sed "s/[^0-9\.]//g"'
alias md 'mkdir -p $argv; cd $argv'
alias whois 'whois -h whois-servers.net'
alias_and_complete tma 'tmux attach -t'
alias_and_complete tmk 'tmux kill-session -t'
alias tml 'tmux list-sessions'
function tmn
  if not test -z $argv
    set name $argv
  else
    set name (basename (pwd) | sed 's/^\.//')
  end

  tmux new -s "$name"
end
alias vclean 'rm $HOME/.vim/swaps/*'

## Node.js
function npms
  npm search --registry=https://registry.npmjs.org $argv
end

function npm-stable
  npms $argv | grep -E '2014-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
end

# Z
. ~/.dotfiles/vendor/z-fish/z.fish

# afk
function afk
  eval "/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
end

# OSX-specific
if test (uname -s) = 'Darwin'
  add_path /usr/local/lib/python2.7/site-packages

  alias brewup 'brew update; and brew upgrade'
  alias cleanup 'find . -name "*.DS_Store" -type f -ls -delete'
  alias o 'open .'
  alias emptytrash 'sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'
  alias flushdns 'dscacheutil -flushcache'
  alias vi 'vim'

  if hash docker 2> /dev/null; and hash docker-machine 2> /dev/null
    if test (docker-machine status default) != "Running"
      docker-machine start default 2> /dev/null
    end
    source $HOME/.dockerfunc
    eval (docker-machine env default)
  end
end

