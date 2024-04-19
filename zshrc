PS1='%~ %# '

source $HOME/.aliases

HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory
unsetopt autocd beep
unsetopt sharehistory

bindkey -e

DISABLE_AUTO_TITLE="true"

autoload -Uz compinit
compinit

export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type __init_nvm)" = function ]; then
 export NVM_DIR="$HOME/.nvm"

 [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

 declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')

 function __init_nvm() {
   for i in "${__node_commands[@]}"; do unalias $i; done
   . "$NVM_DIR"/nvm.sh
   unset __node_commands
   unset -f __init_nvm
 }

 for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kkahula/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kkahula/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kkahula/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kkahula/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
