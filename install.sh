#!/bin/sh

git submodule update --init

./scripts/link-dotfiles.sh

vim -E -s -S $HOME/.vimrc "+PlugInstall" "+qa"
nvim -E -s -S $HOME/.vimrc "+PlugInstall" "+qa"
