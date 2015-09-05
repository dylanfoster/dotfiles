#!/usr/bin/env /bash

if ! [[ -f "$HOME/powerline-shell.py" ]]; then
  # Install powerline-shell
  echo "powerline => $DOTFILES_DIR"
  pushd $DOTFILES_DIR/vendor/powerline-shell &> /dev/null
  cp ./config.py.dist ./config.py
  ./install.py
  ln -s $DOTFILES_DIR/vendor/powerline-shell/powerline-shell.py $HOME/powerline-shell.py
  popd &> /dev/null
fi

chsh -s $(which zsh)
