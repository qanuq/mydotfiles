#!/bin/bash

# uncomment to debug
# set -x

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# allow gitconfig interactive.singleKey to work
sudo apt install -y libterm-readkey-perl

sudo apt install -y ack
sudo apt install -y direnv
sudo apt install -y fasd
sudo apt install -y fd-find
sudo apt install -y fdupes
sudo apt install -y git
sudo apt install -y htop
sudo apt install -y keychain
sudo apt install -y mosh
sudo apt install -y ncdu
sudo apt install -y neovim
sudo apt install -y ripgrep
sudo apt install -y silversearcher-ag
sudo apt install -y tmux
sudo apt install -y tree

# install bat, on debian 10. else, need to install with apt
curl --silent --location https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd64.deb --output bat_amd64.deb && sudo dpkg -i bat_amd64.deb; rm -fv bat_amd64.deb
# install gitflow-avh
curl --silent --location https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh --output ./gitflow-installer.sh && sudo /bin/bash gitflow-installer.sh install stable; rm -fv gitflow-installer.sh

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
# install zsh-history-substring-search plugin
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
