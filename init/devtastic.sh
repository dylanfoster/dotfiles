

# Install Node.js stable
if ! program_exists "n"; then
  cd ~/.dotefiles/vendor/n
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
  )

  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } > /dev/null
  list="$(to_install "${modules[*]}" "${installed[*]}")"
  if [[ "$list" ]]; then
    notice "Installing Node Modules: ${list[*]}"
    npm install -g $list
  fi
fi

# Install fish shell if it isn't already
if ! program_exists "fish"; then
  (
    cd ~/.dotfiles/vendor/fish-shell
    autoconf
    ./configure
    make
    sudo make install
  )
fi

# Set shell to fish
if program_exists "fish"; then
  fish_location=$(which fish)
  if [[ ! "$(cat /etc/shells | grep "$fish_location")" ]]; then
    echo $fish_location | sudo tee -a /etc/shells
  fi

  if [[ ! "echo $FISH_VERSION" ]]; then
    notice "Changing shell to "$fish_location""
    chsh -s "$fish_location"
  fi
fi
