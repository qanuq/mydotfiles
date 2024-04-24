#!/bin/bash

set -eu

VERSION=0.50.0
GIT_USER=junegunn
GIT_REPO=fzf
BASE_URL=https://github.com/$GIT_USER/$GIT_REPO/releases/download/$VERSION

BASE_FILE=""

ARCHI=$(uname -sm)
case "$ARCHI" in
  Darwin\ arm64)
      BASE_FILE=fzf-$VERSION-darwin_arm64.zip
      ;;
  Darwin\ x86_64)
      BASE_FILE=fzf-$VERSION-darwin_amd64.zip
      ;;
  Linux\ x86_64)
      BASE_FILE=fzf-$VERSION-linux_amd64.tar.gz
      ;;
  *)
      echo "$ARCHI is not supported." >&2
      exit 1
      ;;
esac

TMP_DIR=$(mktemp -d)
cd $TMP_DIR

curl -#OL $BASE_URL/$BASE_FILE

if [[ $BASE_FILE =~ tar.gz$ ]]; then
    tar xf $BASE_FILE
else
    unzip -q $BASE_FILE
fi

chmod +x fzf
mv -fv fzf $HOME/.local/bin/

# now install fzf-tmux
curl -#L https://raw.githubusercontent.com/$GIT_USER/$GIT_REPO/master/bin/fzf-tmux -o $HOME/.local/bin/fzf-tmux
chmod +x $HOME/.local/bin/fzf-tmux

