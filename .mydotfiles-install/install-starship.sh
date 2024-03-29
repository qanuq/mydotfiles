#!/bin/bash

# uncomment to debug
# set -x

platform=$(uname -s | tr "[:upper:]" "[:lower:]")
case "$platform" in
    linux) platform="unknown-linux-musl" ;;
    darwin) platform="apple-darwin" ;;
esac

arch=$(uname -m | tr "[:upper:]" "[:lower:]")
case "$arch" in
    amd64) arch="x86_64" ;;
    armv*) arch="arm" ;;
    arm64) arch="aarch64" ;;
esac

file=starship-$arch-$platform.tar.gz
download_url="https://github.com/starship/starship/releases/latest/download/$file"

tmp_dir=$(mktemp -d)
cd $tmp_dir

curl -o $file -sL $download_url
tar xof $file -C $HOME/.local/bin/
rm -rf $tmp_dir

chmod +x $HOME/.local/bin/starship
