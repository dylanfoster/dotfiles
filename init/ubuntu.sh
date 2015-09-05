# Ubuntu-only
is_ubuntu || return 1

# Update APT
warn "Updating APT"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# Install APT packages
warn "Installing APT packages: ${list[*]}"
sudo apt-get -qq install \
  autoconf \
  bc \
  build-essential \
  git-core \
  htop \
  libncurses5-dev \
  libssl-dev \
  telnet \
  tree \
  vim-nox
