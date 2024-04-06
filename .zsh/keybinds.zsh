bindkey "^q" push-line-or-edit
bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward
bindkey "^n" history-search-forward
bindkey "^p" history-search-backward

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^b" backward-char
bindkey "^f" forward-char

bindkey "^h" backward-delete-char
bindkey "^d" delete-char

bindkey "^[_" insert-last-word
bindkey "^_" undo

bindkey "^j" accept-line
bindkey "^m" accept-line
bindkey "^o" accept-line-and-down-history

bindkey "^k" kill-line

# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
# TODO backward-delete-word
# TODO ^w backward-kill-word
# TODO change bindkey '^u' kill-whole-line
# TODO bindkey '^[D' kill-word
# "^[?" which-command
# "^X^K" kill-buffer
# "^T" transpose-chars
# "^[T" transpose-words
# "^X=" what-cursor-position
# redo
# "^[A" accept-and-hold
# " " magic-space

bindkey "^[c" capitalize-word
bindkey "^[l" down-case-word
bindkey "^[u" up-case-word

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line
bindkey -M vicmd v edit-command-line

bindkey "^l" clear-screen

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-beginning-search
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# finally, make sure the terminal is in application mode, when zle is
# active. only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
