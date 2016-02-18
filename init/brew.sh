#!/usr/bin/env bash

# OSX-only
is_osx || return 1

# Install Homebrew Cask Plugin
installBrewCask() {
  warn "Installing Homebrew Cask Plugin"
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
}

brew tap neovim/neovim
brew tap caskroom/versions

# Install Homebrew Casks
installCasks() {
  if ! brew cask &> /dev/null; then
    installBrewCask
  fi

  brew cask install \
    dockertoolbox \
    flux \
    iterm2-nightly \
    macdown \
    seil \
    vagrant \
    virtualbox
}

# Install Homebrew Recipes
installRecipes() {
  warn "Installing Homebrew Recipes: ${list[*]}"

  brew install \
    cloc \
    coreutils \
    git \
    git-extras \
    go \
    imagemagick \
    moreutils \
    rename \
    the_silver_searcher \
    tmux \
    tree \
    vim --with-lua \
    watch \
    wget

  brew install --HEAD \
    neovim
}

# Install Homebrew
if ! program_exists "brew"; then
  warn "Installing Homebrew"
  true | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  installCasks
  installRecipes
else
  warn "Updating Homebrew"
  brew doctor
  brew update

  installCasks
  installRecipes
fi
