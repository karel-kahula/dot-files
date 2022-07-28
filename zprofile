[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
PATH="${HOME}/Library/Python/3.7/bin:${PATH}"
PATH="${HOME}/go/bin:${PATH}"
export PATH

source $HOME/.secrets
