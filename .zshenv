export HISTFILE="$HOME/.zsh_history"
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


typeset -U path
local_bin="$HOME/.local/bin"
if [ -d "$local_bin" ]; then
    path=("$local_bin" $path)
fi

export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    path=("$PYENV_ROOT/bin" $path)
fi

export PATH

# globalias module will not expand these aliases
export GLOBALIAS_FILTER_VALUES=(
    cat
    catd
    catr
    dot
    echo_path
    la
    ll
    ls
)

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

[[ -f "$HOME/.zshenv_local" ]] && source "$HOME/.zshenv_local"
