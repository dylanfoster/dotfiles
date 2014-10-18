set fish_greeting

# Paths
function update_path --argument-names path
  test -d $path; and set PATH $path $PATH
end

update_path /usr/local/bin
update_path /usr/bin
update_path /bin
update_path /usr/local/sbin
update_path /usr/sbin
update_path /sbin
update_path /opt/subversion/bin
update_path $HOME/.dotfiles/bin

# Set locale
set -U LC_ALL en_US.UTF-8
set -U LANG en_US.UTF-8
set -U LANGUAGE en_US.UTF-8

for file in $HOME/.dotfiles/link/.config/fish/source/**.fish
  source "$file"
end
