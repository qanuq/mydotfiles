# add dot alias if git command exists
if command -v git > /dev/null 2>&1; then
    alias dot='git --git-dir="$HOME/.mydotfiles.git/" --work-tree="$HOME"'
    alias g=git
    alias -s git="git clone"
    # use git completion for dot alias
    compdef _git dot
fi
# add dotig alias if tig command exists
if command -v tig > /dev/null 2>&1; then
    alias dotig='GIT_DIR="$HOME/.mydotfiles.git/" GIT_WORK_TREE="$HOME" tig'
fi
# bat is a better cat
if command -v bat > /dev/null 2>&1; then
    alias cat='bat --plain --style="plain"'
    alias catd='bat --diff --style="plain,changes,numbers"'
    alias catr='bat --show-all --style="plain"'
fi

if command -v nvim > /dev/null 2>&1; then
    alias n=nvim
    alias nd='nvim -d'
    alias ro='nvim -R'
else
    alias n=vim
    alias nd='vim -d'
    alias ro='vim -R'
fi
alias -s {txt,json,xml,yml,yaml,toml,py,html,css,js}=n

if command -v tmux > /dev/null 2>&1; then
    alias t='tmux'
    alias tl='tmux ls'
    alias tn='tmux new -s'
    alias ta="tmux attach -t"
    alias tk='tmux kill-session -t'
    alias tx='tmux kill-server'
fi

alias c=clear
alias h=history
alias j=jump

alias  l="eza --color=auto --oneline --classify=auto --group-directories-first"
alias la="eza --color=auto --all"
alias lc="eza --color=auto --across --grid --icons"
alias ll="eza --color=auto --color-scale --color-scale-mode=gradient --git --group-directories-first --header --long --time-style=long-iso"
alias ls="eza --color=auto --classify=auto"
alias lt="eza --color=auto --all --header --long --reverse --sort=modified --time-style=relative"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

alias grep='grep --color'

alias -g G='| grep'
alias -g H='| head'
alias -g L="| less"
alias -g LL='2>&1 | less'
alias -g N='| n -'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g R='| rg'
alias -g T='| tail'

# directory history
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

alias -- -='builtin cd -'
alias 1='builtin cd -1'
alias 2='builtin cd -2'
alias 3='builtin cd -3'
alias 4='builtin cd -4'
alias 5='builtin cd -5'
alias 6='builtin cd -6'
alias 7='builtin cd -7'
alias 8='builtin cd -8'
alias 9='builtin cd -9'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias http='python3 -m http.server 8888 -d .'
alias public_ip='curl --silent -L https://ifconfig.co'
alias tmp="cd $(mktemp -d)"
alias echo_path='echo -e ${PATH//:/\\n}'

alias _="sudo"
alias mux="tmuxp load"
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockRr='docker rm $(docker ps -a -q)'                                     # delete every containers / images
alias dockRr='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything
alias dockceu='docker-compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
alias dockce='docker-compose run --rm'
alias isodate="date +%Y-%m-%dT%H:%M:%S%z"
alias isodate_utc="date -u +%Y-%m-%dT%H:%M:%SZ"
alias isodate_basic="date -u +%Y%m%dT%H%M%SZ"
alias unixstamp="date +%s"
alias date_locale="date +"%c""
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
alias prc='pre-commit'
alias prcau='pre-commit autoupdate'
alias prcr='pre-commit run'
alias prcra='pre-commit run --all-files'
alias prcrf='pre-commit run --files'