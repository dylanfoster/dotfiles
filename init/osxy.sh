#!/usr/bin/env bash

# OSX-only
is_osx || return 1

# Install Homebrew Cask Plugin
installBrewCask() {
  notice "Installing Homebrew Cask Plugin"
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
}

# Install Homebrew Casks
installCasks() {
  if ! brew cask &> /dev/null; then
    installBrewCask
  fi

  casks=(
    adium
    flux
    iterm2
    seil
    vagrant
    virtualbox
  )

  list="$(to_install "${casks[*]}" "$(brew cask list)")"

  if [[ "$list" ]]; then
    notice "Installing Homebrew Casks: ${list[*]}"
    brew cask install $list
  fi
}

# Install Homebrew Recipes
installRecipes() {
  recipes=(
    cloc
    coreutils
    fish
    git
    git-extras
    go
    imagemagick
    moreutils
    rename
    the_silver_searcher
    tmux
    tree
    vim --with-lua
    watch
    wget
  )

  list="$(to_install "${recipes[*]}" "$(brew list)")"

  if [[ "$list" ]]; then
    notice "Installing Homebrew Recipes: ${list[*]}"
    brew install $list
  fi
}

# Install Homebrew
if ! program_exists "brew"; then
  notice "Installing Homebrew"
  true | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  installCasks
  installRecipes
else
  notice "Updating Homebrew"
  brew doctor
  brew update

  installCasks
  installRecipes
fi

