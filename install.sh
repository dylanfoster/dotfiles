#!/bin/bash
set -e

# Variables

ALL_FILES=$(ls .)
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TIMESTAMP=$(date +%s)
BACKUPS=
BACKUPS_DIR=$DOTFILES_DIR/backups/$TIMESTAMP
IGNORED_FILES='LICENSE\|README.md\|backups\|bin\|init\|install\|shell.png\|vendor\|.gitmodules'
DOTFILES=$(echo $ALL_FILES | tr ' ' '\n' | grep -v "$IGNORED_FILES")

# Intro

show_intro() {
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

info() {
  log "\033[1;30m=> $@\033[0m";
}

warn() {
  log "\033[1;32m=> $@\033[0m";
}

success() {
  log "\033[0;32m✔ $@\033[0m";
}

skip_info() {
  log "\033[1;31m✖ $@\033[0m";
}

is_osx() { [[ "$OSTYPE" =~ ^darwin ]] || return 1; }
is_ubuntu() {
  [[ "$(cat /etc/lsb-release 2> /dev/null | head -1 2> /dev/null)" =~ Ubuntu ]] || return 1
}

program_exists() {
  if [ "$(type -P $1)" ]; then
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
    skip_info "Skipping $HOME/.$1"
  fi
}

link() {
  ln -sf "$DOTFILES_DIR/$1" "$HOME/.$1"
  success "$DOTFILES_DIR/$1 -> $HOME/.$1"
}

link_files() {
  info "Linking dotfiles"

  for file in $DOTFILES; do
    if [[ -e "$HOME/.$file" ]]; then
      check_and_link "$file"
    else
      link "$file"
    fi
  done
}

install_submodules() {
  info "Installing plugins"
  git submodule update --init --recursive
}

move_in_and_init() {
  local init_dir="$DOTFILES_DIR/init"
  pushd "$init_dir" &> /dev/null
  source "$1"
  popd &> /dev/null
}

install() {
  info "Just do it!"
  backup
  if [[ -z "$backups" ]]; then
    warn "Nothing to backup"
  fi
  success "Backups complete -> $BACKUPS_DIR"
  success "Plugins installed!"
  link_files
}

init(){
  info "Running bootstrap scripts"
  set +e
  move_in_and_init "osx.sh"
  move_in_and_init "ubuntu.sh"
  install_submodules
  move_in_and_init "brew.sh"
  move_in_and_init "node.sh"
  set -e
}

# Just do it

echo
show_intro
echo
install
init
