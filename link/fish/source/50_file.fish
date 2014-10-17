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
alias k 'l'
alias l 'ls -al'

if type -P tree > /dev/null
  alias ll 'tree --dirsfirst -aLpughDFiC 1'
  alias lsd 'll -d'
else
  alias ll 'ls -al'
  alias lsd 'CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
end

# Creates a new directory and enter it
function md
  mkdir -p $argv
  cd $argv
end
