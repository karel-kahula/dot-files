# If you come from bash you might have to change your $PATH.
export GOPATH=/Users/kkahula/go
export PATH=/usr/local/Cellar:/usr/local/bin:$HOME/bin:$PATH:$GOPATH/bin
source $HOME/.zshrc.local

export GPG_TTY=$(tty)
export EDITOR="nvim"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/kkahula/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.aliases

source $HOME/.antigen.zsh
antigen use oh-my-zsh
antigen bundle <<EOBUNDLES
    git
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme kphoen
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt sharehistory

eval $(thefuck --alias)
