export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=500000
export SAVEHIST=$HISTSIZE

export LANG=fr_FR.UTF-8

if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR
export PAGER=less

typeset -U path PATH
if [ -d "$HOME/.local/bin" ]; then
    path=("$HOME/.local/bin" $path)
fi
export PATH

# globalias module will not expand these aliases
export GLOBALIAS_FILTER_VALUES=(
    cat
    catd
    dot
    echo_path
    la
    ll
    ls
)