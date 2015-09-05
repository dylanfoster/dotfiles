# Ubuntu-only
is_ubuntu || return 1

# Update APT
notice "Updating APT"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# Install APT packages
notice "Installing APT packages: ${list[*]}"
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
