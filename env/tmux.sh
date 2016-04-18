alias tma='tmux attach -d -t'
alias tmk='tmux kill-session -t'
alias tmak='tmux kill-server'
alias tml='tmux list-sessions'
alias tmd='tmux detach'

tmn() {
  if [ ! -z $argv ]; then
    name=$argv
  else
    name=$(basename $(pwd) | sed 's/^\.//')
  fi
  echo $name

  tmux new -s "$name"
}
