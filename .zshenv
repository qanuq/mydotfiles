typeset -U path PATH
if [ -d "${HOME}/.local/bin" ] ; then
    path=("$HOME/.local/bin" $path)
fi
export PATH