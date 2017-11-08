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
