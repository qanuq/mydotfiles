#!/bin/bash

# uncomment to debug
# set -x

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install homebrew if it is not already installed
which brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# turn homebrew analytics off
brew analytics off

./Brewfile
./Caskfile

# add sudoedit link
[ ! -e /usr/local/bin/sudoedit ] && ln -s /usr/bin/sudo /usr/local/bin/sudoedit

mkdir -p "$HOME/.local/bin"
