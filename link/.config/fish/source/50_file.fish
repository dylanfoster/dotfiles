# Easier navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

alias dev 'cd /Users/Shared/git'
# Lock the screen (when going AFK)
alias afk "/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Outputs filesize in bytes
alias df 'df -h'
alias fs 'stat -f "%z bytes"'

# Directory listing
alias l 'tree --dirsfirst -aFCNL 1 $argv'
alias ll 'tree --dirsfirst -aLpughDFiC 1'
alias lsd 'll -d'

# Creates a new directory and enter it
function md
  mkdir -p $argv
  cd $argv
end
