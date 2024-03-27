bindkey '^q' push-line-or-edit
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^b' backward-char
bindkey '^f' forward-char

bindkey '^h' backward-delete-char
bindkey '^d' delete-char

bindkey '^[_' insert-last-word
bindkey '^_' undo

bindkey '^j' accept-line
bindkey '^m' accept-line
bindkey '^o' accept-line-and-down-history

bindkey '^k' kill-line

# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
# TODO backward-delete-word
# TODO ^w backward-kill-word
# TODO change bindkey '^u' kill-whole-line
# TODO bindkey '^[D' kill-word

bindkey '^[c' capitalize-word
bindkey '^[l' down-case-word
bindkey '^[u' up-case-word

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey -M vicmd v edit-command-line

bindkey '^l' clear-screen