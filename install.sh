#!/bin/bash
set -e

# Variables

ALL_FILES=$(ls .)
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
DOTIGNORE=$DOTFILES_DIR/.dotignore
TIMESTAMP=$(date +%s)
BACKUPS=
BACKUPS_DIR=$DOTFILES_DIR/backups/$TIMESTAMP
IGNORED_FILES="$(cat $DOTIGNORE | while read line; do echo -n "$line\|"; done | sed 's/.\{2\}$//')"
DOTFILES=$(echo $ALL_FILES | tr ' ' '\n' | grep -v "$IGNORED_FILES")

# Intro

intro() {
  echo -e "     _         _      ___     _                    "
  echo -e "    ( )       ( )_  /'___) _ (_ )                  "
  echo -e "   _| |   _   | ,_)| (__  (_) | |    __    ___     "
  echo -e " /'_  | /'_ \ | |  | ,__) | | | |  /'__ \/',__)    "
  echo -e "( (_| |( (_) )| |_ | |    | | | | (  ___/\__, \    "
  echo -e " \__,_) \___/' \__)(_)    (_)(___) \____)(____/    "
}

# Functions

log(){
  echo -e "$1";
}

debug() {
  log "\033[1;30m==> $@\033[0m";
}

info() {
  log "\033[1;32m==> $@\033[0m";
}

success() {
  log "\033[0;32m✔ $@\033[0m";
}

skip() {
  log "\033[1;36m✖ $@\033[0m";
}

error() {
  log "\033[1;31m✖ $@\033[0m";
}

is_osx() { [[ "$OSTYPE" =~ ^darwin ]] || return 1; }
is_ubuntu() {
  [[ "$(cat /etc/lsb-release 2> /dev/null | head -1 2> /dev/null)" =~ Ubuntu ]] || return 1
}

program_exists() {
  if [ "$(type -p $1)" ]; then
    return 0
  fi
  return 1
}

backup() {
  info "Making backups of your dotfiles"

  for file in $DOTFILES; do
    if [[ -f "$HOME/.$file" ]]; then
      [[ -e "$BACKUPS_DIR" ]] || mkdir -p "$BACKUPS_DIR"
      mv "$HOME/.$file" "$BACKUPS_DIR"
      backups=1
    fi
  done
}

check_and_link() {
  if ! [[ -L "$HOME/.$1" ]]; then
    ln -sf "$DOTFILES_DIR/$1" "$HOME/.$1"
    success "$DOTFILES_DIR/$1 -> $HOME/.$1"
  else
    skip "Skipping $HOME/.$1"
  fi
}

link() {
  ln -sf "$DOTFILES_DIR/$1" "$HOME/.$1"
  success "$DOTFILES_DIR/$1 -> $HOME/.$1"
}

link_files() {
  info "Linking dotfiles..."

  for file in $DOTFILES; do
    if [[ -e "$HOME/.$file" ]]; then
      check_and_link "$file"
    else
      link "$file"
    fi
  done

  # TODO find a cleaner way
  rm -rf $HOME/.n
}

install_submodules() {
  info "Installing plugins"
  git submodule update --init --recursive
  success "Plugins installed!"
}

move_in_and_init() {
  local init_dir="$DOTFILES_DIR/init"
  pushd "$init_dir" &> /dev/null
  source "$1"
  popd &> /dev/null
}

install() {
  debug "Just do it!"
  backup
  if [[ -z "$backups" ]]; then
    debug "Nothing to backup"
  fi
  success "Backups complete -> $BACKUPS_DIR"
  install_submodules
  link_files
}

init(){
  debug "Running bootstrap scripts"
  set +e
  move_in_and_init "osx.sh"
  move_in_and_init "ubuntu.sh"
  move_in_and_init "node.sh"
  set -e
}

# Just do it

echo
intro
echo
install
init
