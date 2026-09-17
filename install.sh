#!/bin/sh

git submodule update --init

./link-dotfiles.sh

vim -E -s -S $HOME/.vimrc "+PlugInstall" "+qa"
nvim -E -s -S $HOME/.vimrc "+PlugInstall" "+qa"
