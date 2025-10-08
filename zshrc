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
export N_PREFIX=$HOME
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/openjdk/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export SSL_CERT_FILE=/Users/Shared/usb_ca_chain.crt
# export HTTP_PROXY=http://dxfost4@eu-webproxyosx.servers.global.prv:8080
# export HTTPS_PROXY=$HTTP_PROXY
# export http_proxy=$HTTP_PROXY
# export https_proxy=$HTTP_PROXY
# export ALL_PROXY=$HTTP_PROXY
# export no_proxy=.cypress.io,localhost,127.0.0.1,.local,169.254/16,.elavon.net,.global.prv,.elavon.com,10.30.0.0/16,.aws.prv,.nova.prv,.internal.prv,.na.global.prv,.elavontc.prv,.corp.protobase.com,spp*,svp*,.int.usbc.com,.euroconex.prv,.novainfo.com,.us.bank-dns.com,.nonprod.aws.prv,servers.global.prv,.127.0.0.1.nip.io,..amazonaws.com
# export NO_PROXY=$no_proxy
#Homebrew may only install with API
#export HOMEBREW_INSTALL_FROM_API=1
#export HOMEBREW_BOTTLE_DOMAIN=https://artifactory.us.bank-dns.com/artifactory/homebrew-remote/

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

export PATH="/Applications/Fortify/Fortify_SCA_and_Apps_21.2.3/bin:$PATH"
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
export NODE_EXTRA_CA_CERTS=/Users/Shared/USB_Global_Chain.crt

unalias heroku
unalias ssh
unalias scp

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
