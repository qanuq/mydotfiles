zstyle ':completion:*' menu select
# case insensitive -/_ completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
# complete . and .. special directories
zstyle ':completion:*' special-dirs true
# no colors on completion
zstyle ':completion:*' list-colors ""
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$HOME/.zsh/cache/"
# sequences of slashes in filename paths are treated as a single slash
zstyle ':completion:*' squeeze-slashes true
# completer options
zstyle ':completion:*' completer _expand _extensions _complete _approximate
# show info messages
#zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{green}%B-- %d --%b%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''

# complete hidden files
_comp_options+=(globdots)