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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/pkg/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/pkg/google-cloud-sdk/path.zsh.inc'; fi
