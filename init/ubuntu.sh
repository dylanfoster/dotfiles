#!/usr/bin/env bash
is_ubuntu || return 1

LINUXBREW="$HOME/.linuxbrew/bin/brew"

# Update APT
info "Updating APT"

sudo apt-get update
sudo apt-get install -y software-properties-common \
  python-software-properties

sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get upgrade -y

# Install APT packages
info "Installing APT packages..."

sudo apt-get install -y \
  autoconf \
  bc \
  build-essential \
  curl \
  git \
  git-core \
  libbz2-dev \
  libcurl4-openssl-dev \
  libexpat-dev \
  libncurses-dev \
  libncurses5-dev \
  libssl-dev \
  m4 \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  ruby \
  telnet \
  texinfo \
  tree \
  zlib1g-dev

success "Installed apt packages"

# Install Linuxbrew
if [[ ! -f "$LINUXBREW" ]]; then
  info "Installing Linuxbrew..."

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
fi

# Install Linuxbrew packages
info "Installing Linuxbrew packages..."

$LINUXBREW update
$LINUXBREW install \
  git-extras \
  htop \
  tmux \
  vim \
  zsh

# Shell
ZSH_BIN="$HOME/.linuxbrew/bin/zsh"

# Add ZSH to list of valid shells
if [[ "$ZSH_BIN" && $(grep -L "$ZSH_BIN" /etc/shells) ]]; then
  echo "$ZSH_BIN" | sudo tee -a /etc/shells &> /dev/null
fi
