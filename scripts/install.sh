#!/bin/sh

git submodule update --init

./scripts/link-dotfiles.sh

vim -E -s -S $HOME/.vimrc "+VundleInstall" "+qa"
