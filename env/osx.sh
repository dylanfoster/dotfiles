if [ $(uname -s) = 'Darwin' ]; then
  alias cleanup='find . -name "*.DS_Store" -type f -ls -delete'
  alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'
  alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
  alias flushdns='dscacheutil -flushcache'
fi
