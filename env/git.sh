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
