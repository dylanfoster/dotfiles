set PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin \
                /opt/subversion/bin

# Surpress fish greeting message
set fish_greeting ""

# Set locale
set -U LC_ALL en_US.UTF-8
set -U LANG en_US.UTF-8
set -U LANGUAGE en_US.UTF-8

for file in ~/.config/fish/source/**.fish
  source "$file"
end
