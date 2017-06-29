if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt EXTENDED_GLOB
setopt RM_STAR_SILENT
setopt null_glob

export PATH=/usr/local/bin:$PATH

# Source environment scripts
for file in "$HOME"/.env/*.sh; do
  source $file
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/dylanfoster/.travis/travis.sh ] && source /Users/dylanfoster/.travis/travis.sh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/Shared/git/virtucom-desktop/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/Shared/git/virtucom-desktop/node_modules/tabtab/.completions/electron-forge.zsh
export PATH="$HOME/.fastlane/bin:$PATH"

