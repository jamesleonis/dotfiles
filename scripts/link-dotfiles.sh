#!/bin/sh

DOTFILES=$(find $(cd `dirname $0`/..; pwd) ! -path "*.git*" -iname "*symlink")

for df in $DOTFILES; do
  target=$(echo $df | sed -r "s:.*/(.*).symlink:$HOME/.\1:")
  rm -rf $target
  ln -s $df $target
done
