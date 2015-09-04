#!/usr/bin/env bash

# Install Node.js stable
if ! program_exists "n"; then
  pushd $HOME/.dotfiles/vendor/n
  make install
  n latest
else
  n latest
fi

# Install NPM global modules
if program_exists "npm"; then
  modules=(
    ember-cli
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

# Install powerline-shell
pushd $HOME/.dotfiles/vendor/powerline-shell &> /dev/null
cp ./config.py.dist ./config.py
./install.py
ln -s $HOME/.dotfiles/vendor/powerline-shell/powerline-shell.py $HOME/powerline-shell.py
popd &> /dev/null

for file in $HOME/.dotfiles/funcs; do
  mv $file /usr/local/bin
done
