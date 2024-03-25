# colors
autoload -Uz colors && colors
# completion
autoload -Uz compinit && compinit

# use emacs key bindings
bindkey -e

source $HOME/.zsh/setopt.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/globalias.zsh