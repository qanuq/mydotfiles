# mydotfiles

How to use?

    git clone --bare git@github.com:qanuq/mydotfiles.git $HOME/.mydotfiles.git
    alias dot='git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'
    dot config --local status.showUntrackedFiles no

    # backup files and use --force option if files must be overwritten.
    dot checkout main
