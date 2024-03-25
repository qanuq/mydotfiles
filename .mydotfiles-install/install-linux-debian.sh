#!/bin/bash

# uncomment to debug
# set -x

# ask for the administrator password upfront
/usr/bin/sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do /usr/bin/sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# add sudoedit link
[ ! -e /usr/local/bin/sudoedit ] && ln -s /usr/bin/sudo /usr/local/bin/sudoedit

# allow gitconfig interactive.singleKey to work
/usr/bin/sudo /usr/bin/apt install -y libterm-readkey-perl

/usr/bin/sudo /usr/bin/apt install -y tig

/usr/bin/sudo /usr/bin/apt install -y zsh

/usr/bin/sudo update-alternatives --set editor /usr/bin/vim.basic
