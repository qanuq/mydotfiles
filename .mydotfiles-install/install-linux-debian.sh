#!/bin/bash

# uncomment to debug
# set -x

script_dir=$(dirname "$(realpath "$0")")

# ask for the administrator password upfront
/usr/bin/sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do /usr/bin/sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# add sudoedit link
[ ! -e /usr/local/bin/sudoedit ] && ln -s /usr/bin/sudo /usr/local/bin/sudoedit

mkdir -p "$HOME/.local/bin"

/usr/bin/sudo /usr/bin/apt update

# allow gitconfig interactive.singleKey to work
/usr/bin/sudo /usr/bin/apt install -y libterm-readkey-perl

/usr/bin/sudo /usr/bin/apt install -y bat
/usr/bin/sudo /usr/bin/apt install -y fd-find
/usr/bin/sudo /usr/bin/apt install -y ripgrep
/usr/bin/sudo /usr/bin/apt install -y tig
/usr/bin/sudo /usr/bin/apt install -y tmux

/usr/bin/sudo /usr/bin/apt install -y zsh

/usr/bin/sudo /usr/bin/dpkg-divert --local --divert /usr/bin/bat --rename --add /usr/bin/batcat
/usr/bin/sudo /usr/bin/dpkg-divert --local --divert /usr/bin/fd --rename --add /usr/bin/fdfind

/usr/bin/sudo update-alternatives --set editor /usr/bin/vim.basic

# install eza
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
curl -sL https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "# eza repo\ndeb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# clone pyenv repo
if [ ! -d "$HOME/.pyenv" ]; then
    git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
fi

(export bin_path=$HOME/.local/bin/; $script_dir/install-direnv.sh)
$script_dir/install-starship.sh --bin-dir $HOME/.local/bin/ --yes

# installing fonts
FONTS_DIR=$HOME/.local/share/fonts
mkdir -p $FONTS_DIR
cp -fv $script_dir/fonts/FiraCode/*.ttf $FONTS_DIR
cp -fv $script_dir/fonts/FiraCodeNerdFont/*.ttf $FONTS_DIR
cp -fv $script_dir/fonts/SymbolsNerdFont/*.ttf $FONTS_DIR
