#!/bin/bash

# uncomment to debug
# set -x

# ask for the administrator password upfront
/usr/bin/sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do /usr/bin/sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# allow gitconfig interactive.singleKey to work
/usr/bin/sudo /usr/bin/apt install -y libterm-readkey-perl

/usr/bin/sudo /usr/bin/apt install -y awscli
/usr/bin/sudo /usr/bin/apt install -y ack
/usr/bin/sudo /usr/bin/apt install -y cmake
/usr/bin/sudo /usr/bin/apt install -y cmus
/usr/bin/sudo /usr/bin/apt install -y colordiff
/usr/bin/sudo /usr/bin/apt install -y curl
/usr/bin/sudo /usr/bin/apt install -y direnv
/usr/bin/sudo /usr/bin/apt install -y fasd
/usr/bin/sudo /usr/bin/apt install -y fd-find
/usr/bin/sudo /usr/bin/apt install -y fdupes
/usr/bin/sudo /usr/bin/apt install -y git
/usr/bin/sudo /usr/bin/apt install -y gnupg
/usr/bin/sudo /usr/bin/apt install -y htop
/usr/bin/sudo /usr/bin/apt install -y keychain
/usr/bin/sudo /usr/bin/apt install -y libxml2
/usr/bin/sudo /usr/bin/apt install -y make
/usr/bin/sudo /usr/bin/apt install -y mosh
/usr/bin/sudo /usr/bin/apt install -y ncdu
/usr/bin/sudo /usr/bin/apt install -y neofetch
/usr/bin/sudo /usr/bin/apt install -y neovim
/usr/bin/sudo /usr/bin/apt install -y nodejs
/usr/bin/sudo /usr/bin/apt install -y p7zip
/usr/bin/sudo /usr/bin/apt install -y pbzip2
/usr/bin/sudo /usr/bin/apt install -y pigz
/usr/bin/sudo /usr/bin/apt install -y ripgrep
/usr/bin/sudo /usr/bin/apt install -y screen
/usr/bin/sudo /usr/bin/apt install -y shellcheck
/usr/bin/sudo /usr/bin/apt install -y silversearcher-ag
/usr/bin/sudo /usr/bin/apt install -y tidy
/usr/bin/sudo /usr/bin/apt install -y tig
/usr/bin/sudo /usr/bin/apt install -y tmux
/usr/bin/sudo /usr/bin/apt install -y tree
/usr/bin/sudo /usr/bin/apt install -y unar
/usr/bin/sudo /usr/bin/apt install -y universal-ctags
/usr/bin/sudo /usr/bin/apt install -y watch
/usr/bin/sudo /usr/bin/apt install -y wdiff

/usr/bin/sudo /usr/bin/apt install -y zsh

/usr/bin/sudo /usr/bin/apt install -y bat
/usr/bin/sudo /usr/bin/dpkg-divert --local --divert /usr/bin/bat --rename --add /usr/bin/batcat


/usr/bin/sudo update/-alternatives --set editor /usr/bin/vim.basic

# pyenv dependencies
/usr/bin/sudo /usr/bin/apt install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
/usr/bin/curl -fsSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | /bin/bash

# rename fdfind to fd
/usr/bin/sudo /usr/bin/dpkg-divert --local --divert /usr/bin/fd --rename --add /usr/bin/fdfind

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | /usr/bin/sudo /usr/bin/tee /etc/apt/sources.list.d/vscodium.list
/usr/bin/curl -fsSL https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | /usr/bin/gpg --dearmor | /usr/bin/sudo /bin/dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
/usr/bin/sudo /usr/bin/apt update
/usr/bin/sudo /usr/bin/apt install -y codium
/usr/bin/sudo /usr/bin/dpkg-divert --local --divert /usr/bin/code --rename --add /usr/bin/codium

# install gitflow-avh
/usr/bin/curl -fsSL https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh -o gitflow-installer.sh && /usr/bin/sudo /bin/bash gitflow-installer.sh install stable; rm -fv gitflow-installer.sh

# install github-cli
/usr/bin/curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | /usr/bin/sudo /bin/dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(/usr/bin/dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | /usr/bin/sudo /usr/bin/tee /etc/apt/sources.list.d/github-cli.list > /dev/null
/usr/bin/sudo /usr/bin/apt update
/usr/bin/sudo /usr/bin/apt install -y gh

# install terraform
/usr/bin/curl -fsSL https://apt.releases.hashicorp.com/gpg | /usr/bin/gpg --dearmor | /usr/bin/sudo /bin/dd of=/usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bullseye main" | /usr/bin/sudo /usr/bin/tee /etc/apt/sources.list.d/hashicorp.list
/usr/bin/sudo /usr/bin/apt update
/usr/bin/sudo /usr/bin/apt install -y terraform

# install kdrive
/usr/bin/curl -fsSL https://download.storage.infomaniak.com/drive/desktopclient/kDrive-3.2.6.20211208.AppImage -o "$HOME/bin/kDrive.AppImage"
chmod +x "$HOME/bin/kDrive.AppImage"
"$HOME/bin/kDrive.AppImage" &

# install ohmyzsh
/bin/bash -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting plugin
/usr/bin/git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
# install zsh-history-substring-search plugin
/usr/bin/git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
