# add dot alias if git command exists
if command -v git > /dev/null 2>&1; then
    alias dot='git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'
fi
# add dotig alias if tig command exists
if command -v tig > /dev/null 2>&1; then
    alias dotig='GIT_DIR="$HOME/.mydotfiles.git/" GIT_WORK_TREE="$HOME" tig'
fi
# bat is a better cat
if command -v bat > /dev/null 2>&1; then
    alias cat='bat -p'
    alias catd='bat -d'
fi
