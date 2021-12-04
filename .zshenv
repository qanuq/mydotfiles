# history time format
export HIST_STAMPS="yyyy-mm-dd"

# use case-insensitive completion.
export CASE_SENSITIVE="false"

# add brew path to man path
export MANPATH="/usr/local/share/man:/usr/share/man:$MANPATH"

# set french as lang
export LANG=fr_FR.UTF-8

# set vim as default editor
export EDITOR='vim'
export VISUAL=$EDITOR

# set less as pager
export PAGER=less

# path to viminfo file used by fasd
export _FASD_VIMINFO=$HOME/.vim/viminfo

# globalias module will not expand these aliases
export GLOBALIAS_FILTER_VALUES=(a cat catd d dot f la ll mydotfiles s sd sf v z zz)
