# path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# theme name to load
ZSH_THEME="robbyrussell"

# disable automatic updates
zstyle ':omz:update' mode disabled

source $ZSH/oh-my-zsh.sh

# add mydotfiles and dot aliases if git command exists
command -v git > /dev/null && {
    alias mydotfiles='git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'
    alias dot=mydotfiles
}

# must be at the end of file
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
