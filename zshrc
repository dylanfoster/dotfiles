if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt EXTENDED_GLOB
setopt RM_STAR_SILENT
setopt null_glob

export GOPATH=$HOME/go
export PATH=/usr/local/bin:$GOPATH/bin:$PATH

# Source environment scripts
for file in "$HOME"/.env/*.sh; do
  source $file
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

eval "$(rbenv init -)"

export KOPS_STATE_STORE=s3://cluster-state.travelbank.com
source <(kubectl completion zsh)

function gam() { "/Users/dylanfoster/bin/gam/gam" "$@" ; }
