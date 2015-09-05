#!/usr/bin/env bash
set -e

################################################################################
#
# Variables
#
################################################################################
ALL_FILES=$(ls .)
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TIMESTAMP=$(date +%s)
BACKUPS=
BACKUPS_DIR=$DOTFILES_DIR/backups/$TIMESTAMP
IGNORED_FILES='backups\|bin\|init\|install\|vendor\|.gitmodules\|LICENSE\|README.md'
DOTFILES=$(echo $ALL_FILES | tr ' ' '\n' | grep -v "$IGNORED_FILES")

################################################################################
#
# Functions
#
################################################################################
header() {
  echo -e "   |¯|        |¯|       /¯¯¯¯|   |¯|             "
  echo -e "   | |        | |      |  /¯¯ _  | |             "
  echo -e "   | |      __| |__  __| |__ ( ) | |             "
  echo -e "  _| |  __ (__   __)(__   __) ¯  | |  ___  /¯¯¯  "
  echo -e " /   | /  \   | |      | |   |¯| | | /   \ \___  "
  echo -e "|    ||    |  | |      | |   | | | ||¯¯¯¯      \ "
  echo -e " \__/  \__/   |_|      |_|   |_| |_| \___/  ___/ "
}

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
is_ubuntu() { [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1; }

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

move_in_and_init() {
  local init_dir="$DOTFILES_DIR/init"
  pushd "$init_dir" &> /dev/null
  source "$1"
  popd &> /dev/null
}

init(){
  info "Running bootstrap scripts"
  set +e
  move_in_and_init "brew.sh"
  move_in_and_init "node.sh"
  move_in_and_init "osx.sh"
  move_in_and_init "ubuntu.sh"
  set -e
}

install_submodules() {
  info "Installing plugins"
  git submodule update --init --recursive
}

install() {
  info "Here we go!"
  backup
  if [[ -z "$backups" ]]; then
    warn "Nothing to backup"
  fi
  success "Backups complete -> $BACKUPS_DIR"
  install_submodules
  success "Plugins installed!"
  link_files
}
################################################################################
#
# Install
#
################################################################################
echo
header
echo
install
init
