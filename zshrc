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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kkahula/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kkahula/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kkahula/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kkahula/bin/google-cloud-sdk/completion.zsh.inc'; fi
