#!/bin/bash

# uncomment to debug
# set -x

release="latest"
kernel=$(uname -s | tr "[:upper:]" "[:lower:]")
case "$(uname -m)" in
    x86_64)
        machine=amd64
        ;;
    i686 | i386)
        machine=386
        ;;
    armv7l)
        machine=arm
        ;;
    aarch64 | arm64)
        machine=arm64
        ;;
    *)
        ;;
esac

download_url=$(
curl -sL "https://api.github.com/repos/direnv/direnv/releases/$release" \
    | grep browser_download_url \
    | cut -d '"' -f 4 \
    | grep "direnv.$kernel.$machine\$"
)

curl -o "$HOME/.local/bin/direnv" -sL "$download_url"
chmod u+x "$HOME/.local/bin/direnv"