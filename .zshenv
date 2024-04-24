export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=500000
export SAVEHIST=$HISTSIZE

export LANG=fr_FR.UTF-8

typeset -U path

path=("/usr/local/bin" $path)

local_bin="$HOME/.local/bin"
if [ -d "$local_bin" ]; then
    path=("$local_bin" $path)
fi

export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    path=("$PYENV_ROOT/bin" $path)
fi

export PATH

if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export PAGER=less

# add brew path to man path
export MANPATH="/usr/local/share/man:/usr/share/man:$MANPATH"

# globalias module will not expand these aliases
export GLOBALIAS_FILTER_VALUES=(
    cat
    catd
    catr
    dot
    echo_path
    l
    la
    lc
    ll
    ls
    lt
)

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

export _FZF_FD_COMMAND="fd --hidden --strip-cwd-prefix --follow --color=always --exclude .git"
export _FZF_BAT_COMMAND="bat --color=always --style=header,changes --wrap=never --line-range :500 {} 2> /dev/null"
export _FZF_EZA_COMMAND="eza --tree --classify=auto --icons --color=always {} | head -200"
export FZF_DEFAULT_COMMAND="${_FZF_FD_COMMAND} --type=f"
export FZF_CTRL_T_COMMAND="${_FZF_FD_COMMAND}"
export FZF_ALT_C_COMMAND="${_FZF_FD_COMMAND} --type=d"

export FZF_DEFAULT_OPTS=" \
    --ansi \
    --border=block \
    --height=100% \
    --inline-info \
    --layout=reverse \
    --no-scrollbar \
    --prompt='>>> ' \
    --scroll-off=5 \
"

export FZF_CTRL_R_OPTS=" \
    --bind='?:toggle-preview' \
    --bind='ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' \
    --color=header:yellow \
    --header='?: toggle preview, ctrl-y: copy command into clipboard' \
    --preview='echo {}' \
    --preview-window=border-top:down:3:hidden:wrap \
"

export FZF_ALT_C_OPTS=" \
    --bind='?:toggle-preview' \
    --color=header:yellow \
    --header='?: toggle preview' \
    --preview='$_FZF_EZA_COMMAND' \
    --preview-window='border-left:right:50%:hidden:nowrap' \
"

export FZF_CTRL_T_OPTS=" \
    --bind='?:toggle-preview' \
    --bind='ctrl-d:preview-page-down' \
    --bind='ctrl-u:preview-page-up' \
    --color=header:yellow \
    --header='?: toggle preview' \
    --preview-window='border-left:right:50%:hidden:nowrap' \
    --preview='$_FZF_BAT_COMMAND \
    || $_FZF_EZA_COMMAND' \
"

[[ -f "$HOME/.zshenv_local" ]] && source "$HOME/.zshenv_local"
