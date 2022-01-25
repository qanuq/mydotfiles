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
    bgnotify
    colored-man-pages
    copybuffer
    copydir
    copyfile
    direnv
    dirhistory
    encode64
    extract
    fancy-ctrl-z
    fasd
    fd
    genpass
    git-flow-avh
    gitignore
    gh
    globalias
    gnu-utils
    invoke
    isodate
    iterm2
    jump
    keychain
    macos
    mosh
    pip
    pyenv
    ripgrep
    rsync
    sudo
    terraform
    zsh-syntax-highlighting
    zsh-history-substring-search
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
    alias v='f -e "$EDITOR" -B viminfo' # complete files from history and viminfo
    alias a='fasd -a'                   # any
    alias s='fasd -si'                  # show search and select
    alias d='fasd -d'                   # directory
    alias f='fasd -f'                   # file
    alias sd='fasd -sid'                # interactive directory selection
    alias sf='fasd -sif'                # interactive file selection
    alias z='fasd_cd -d'                # cd
    alias zz='fasd_cd -d -i'            # cd with interactive selection

    bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (files and directories)
    bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
    bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)
}

alias g=git
alias h=history
alias j=jump

alias l='ls -lFh'   # size, show type, human readable
alias la='ls -lAFh' # long list, show almost all, show type, human readable
alias lt='ls -ltFh' # long list, sorted by date, show type, human readable
alias ll='ls -l'    # long list

alias grep='grep --color'
alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g LL='2>&1 | less'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# enable main highlighters, plus brackets and following regexp
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets regexp)
typeset -A ZSH_HIGHLIGHT_REGEXP
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ZSH_HIGHLIGHT_REGEXP+=('\bsudo\b' fg=yellow,bold,underline,bg=black)
    ZSH_HIGHLIGHT_REGEXP+=('\bsudoedit\b' fg=yellow,bold,underline,bg=black)
    ZSH_HIGHLIGHT_REGEXP+=('\brm\b' fg=white,bold,bg=red)
    ZSH_HIGHLIGHT_REGEXP+=('\brmdir\b' fg=white,bold,bg=red)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]sudo[[:>:]]' fg=yellow,bold,underline,bg=black)
    ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]sudoedit[[:>:]]' fg=yellow,bold,underline,bg=black)
    ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]rm[[:>:]]' fg=white,bold,bg=red)
    ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]rmdir[[:>:]]' fg=white,bold,bg=red)
fi

# some syntax highlighting colors
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=red"
