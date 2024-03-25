# add dot aliases if git command exists
if command -v git > /dev/null 2>&1; then
    alias dot='git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'
fi
# add dotig aliases if tig command exists
if command -v tig > /dev/null 2>&1; then
    alias dotig='GIT_DIR="$HOME/.mydotfiles.git/" GIT_WORK_TREE="$HOME" tig'
fi