# Ubuntu-only
is_ubuntu || return 1

# Update APT
warn "Updating APT"
sudo apt-get update
sudo apt-get install -y software-properties-common

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:pi-rho/dev

sudo apt-get update
sudo apt-get upgrade -y

# Install APT packages
warn "Installing APT packages: ${list[*]}"
sudo apt-get install \
  autoconf \
  bc \
  build-essential \
  git-core \
  htop \
  libncurses5-dev \
  libssl-dev \
  neovim \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  telnet \
  tree \
  vim-nox

pip3 install neovim
