# Install Node.js stable
set -e
if ! program_exists "n"; then
  cd $HOME/.dotfiles/vendor/n
  make install
  n stable
else
  n stable
fi

# Install NPM global modules
if program_exists "npm"; then
  modules=(
    gulp
    nodemon
    yo
    ember-cli
  )

  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } > /dev/null
  list="$(to_install "${modules[*]}" "${installed[*]}")"
  if [[ "$list" ]]; then
    notice "Installing Node Modules: ${list[*]}"
    npm install -g $list
  fi
fi
