bindkey '^q' push-line-or-edit
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey -M vicmd v edit-command-line

bindkey '^l' clear-screen