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
