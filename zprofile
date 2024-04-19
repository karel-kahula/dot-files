[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

PATH="${HOME}/go/bin:${PATH}"
PATH="/usr/local/sbin:${PATH}"
export PATH
export CLICOLOR=1

source $HOME/.secrets

PATH="${HOME}/Library/Python/3.10/bin:${PATH}"
export PATH

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib -L/opt/homebrew/opt/readline/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"
export TMPDIR="/tmp"
export GOPRIVATE="github.com/pcln"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="/opt/homebrew/opt:$PATH"

autoload -Uz compinit
compinit

