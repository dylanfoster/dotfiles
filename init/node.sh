#!/usr/bin/env bash

NODE_VERSION=

install_node() {
  info "Installing latest Node.js version..."

  n lts
  NODE_VERSION=$(node -v)
  success "Node.js $NODE_VERSION installed"
}

# Install Node.js stable
if ! program_exists "n"; then
  info "Installing n..."

  pushd $DOTFILES_DIR/n &> /dev/null
  sudo -u "$(whoami)" make install
  popd &> /dev/null
  install_node
else
  install_node
fi

# Install NPM global modules
if program_exists "npm"; then
  info "Installing node modules..."

  npm install -g \
    bower \
    conventional-changelog-cli \
    ember-cli \
    eslint \
    eslint-config-unstandard \
    gulp \
    json \
    nodemon \
    supervisor \
    tslint \
    typescript \
    vtop \
    yarn \
    yo
fi
