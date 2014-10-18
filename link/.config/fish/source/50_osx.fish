if [ (uname -s) != 'Darwin' ]
  exit 1
end

# Paths
set PATH $PATH /usr/local/lib/python2.7/site-packages

# Updates homebrew index and upgrades installed packages
alias brewup 'brew update; and brew upgrade'

# DROID
alias droid 'say -v zarvox droid'

# Recursively delete `.DS_Store` files
alias cleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Flushes dns caches
alias flushdns 'dscacheutil -flushcache'

# Opens current directory in Finder
alias o 'open .'
