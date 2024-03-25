# colors
autoload -Uz colors && colors
# completion
autoload -Uz compinit && compinit

# use emacs key bindings
bindkey -e

if [ -d "$HOME/.zsh/completions" ]; then
    fpath=("$HOME/.zsh/completions" $fpath)
fi

source "$HOME/.zsh/setopt.zsh"
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/colors.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/encode64.zsh"
source "$HOME/.zsh/fancy-ctrl-z.zsh"
source "$HOME/.zsh/globalias.zsh"
source "$HOME/.zsh/jump.zsh"
source "$HOME/.zsh/ssh.zsh"
source "$HOME/.zsh/sudo.zsh"

# https://github.com/Tarrasch/zsh-bd
source "$HOME/.zsh/bd.zsh"

# https://github.com/zsh-users/zsh-syntax-highlighting
# version 0.8.0
# must be at the end of this file
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"