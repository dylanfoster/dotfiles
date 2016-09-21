# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# TMUX
export EVENT_NOKQUEUE=1

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Utilities
alias reload='source $HOME/.zshenv'
