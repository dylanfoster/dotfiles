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

alias rm &> /dev/null && unalias rm
