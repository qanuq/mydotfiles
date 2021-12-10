# path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# theme name to load
ZSH_THEME="robbyrussell"

# disable automatic updates
zstyle ':omz:update' mode disabled

# keychain manages ssh agent
zstyle :omz:plugins:keychain agents ssh
# load identities
zstyle :omz:plugins:keychain identities sirius_key antares_key
# additional options to the keychain program
zstyle :omz:plugins:keychain options --quiet --ignore-missing

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    aliases
    bgnotify
    colored-man-pages
    common-aliases
    copybuffer
    copydir
    copyfile
    dirhistory
    encode64
    extract
    fancy-ctrl-z
    fasd
    genpass
    git
    gitignore
    globalias
    isodate
    iterm2
    keychain
    macos
    sudo
)

source $ZSH/oh-my-zsh.sh

# add mydotfiles and dot aliases if git command exists
command -v git > /dev/null && {
    alias mydotfiles='git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'
    alias dot=mydotfiles
}

# bat is a better cat
command -v bat > /dev/null && {
    alias cat='bat -p'
    alias catd='bat -d'
}

# fasd can mimic https://github.com/rupa/v 's behaviour
command -v fasd > /dev/null && {
    # https://developpaper.com/fast-jump-tool-a-brief-introduction-to-fasd/
    # remove default fasd aliases first
    unalias v
    unalias o
    unalias j
    alias v='f -e "$EDITOR" -B viminfo'
    alias a='fasd -a' # any
    alias s='fasd -si' # show search and select
    alias d='fasd -d' # directory
    alias f='fasd -f' # file
    alias sd='fasd -sid'
    alias sf='fasd -sif'
    alias z='fasd_cd -d'
    alias zz='fasd_cd -d -i'
}

alias h=history

# enable main highlighters, plus brackets and following regexp
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets regexp)
typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]sudo[[:>:]]' fg=yellow,bold,underline,bg=black)
ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]rm[[:>:]]' fg=white,bold,bg=red)
ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]rmdir[[:>:]]' fg=white,bold,bg=red)

# some syntax highlighting colors
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=red"

# must be at the end of file
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
