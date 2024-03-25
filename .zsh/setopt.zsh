# ZSH options

# Changing Directories
# http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories
setopt auto_cd                 # if a command isn't valid, but is a directory, cd to that dir
setopt auto_pushd              # make cd push the old directory onto the directory stack
setopt cd_silent               # print nothing when typing cd -
setopt pushd_ignore_dups       # don’t push multiple copies of the same directory onto the directory stack
setopt pushd_minus             # exchanges the meanings of ‘+’ and ‘-’ when specifying a directory in the stack
setopt pushd_silent            # print nothing when typing pushd
setopt pushd_to_home           # pushd without args go to home

# Completions
# http://zsh.sourceforge.net/Doc/Release/Options.html#Completion-4
setopt always_to_end           # move cursor to the end of a completed word
setopt auto_list               # automatically list choices on ambiguous completion
setopt auto_menu               # show completion menu on a successive tab press
setopt auto_param_slash        # if completed parameter is a directory, add a trailing slash
setopt auto_remove_slash       # remove trailing slash if followed by delimiter or command-ending character
setopt complete_in_word        # complete from both ends of a word
unsetopt menu_complete         # don't autoselect the first completion entry
setopt list_beep               # beep on an ambiguous completion.

# Expansion and Globbing
# http://zsh.sourceforge.net/Doc/Release/Options.html#Expansion-and-Globbing
setopt extended_glob           # use more awesome globbing features
unsetopt glob_dots             # don't include dotfiles when globbing

# History
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
setopt append_history          # append to history file
setopt extended_history        # write the history file in the ':start:elapsed;command' format
setopt hist_beep               # beep when attempting to access a missing history entry
setopt hist_expire_dups_first  # expire a duplicate event first when trimming history
setopt hist_find_no_dups       # don't display a previously found event
setopt hist_ignore_all_dups    # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_dups        # don't record an event that was just recorded again
setopt hist_ignore_space       # don't record an event starting with a space
setopt hist_no_store           # don't store history commands
setopt hist_reduce_blanks      # remove superfluous blanks from each command line being added to the history list
setopt hist_save_no_dups       # don't write a duplicate event to the history file
setopt hist_verify             # don't execute immediately upon history expansion
setopt inc_append_history      # write to the history file immediately, not when the shell exits
setopt share_history           # share history between all sessions

# Input/output
# http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
unsetopt clobber              # disable > on existing files. Use >| instead
unsetopt correct              # don't try to correct the spelling of commands
unsetopt correct_all          # don't try to correct the spelling of all arguments in a line
unsetopt flow_control         # disable start/stop characters in shell editor
unsetopt ignore_eof           # allow ctrl-d to exist shell
setopt interactive_comments   # allow comments
unsetopt rm_star_silent       # ask for confirmation for `rm *' or `rm path/*'
