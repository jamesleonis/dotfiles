#!/bin/sh

DOTFILES=$(find $(cd `dirname $0`/..; pwd) ! -path "*.git*" -iname "*symlink")

# I hate that this is a thing.
if [ "$(uname)" = "Darwin" ] ; then
  SED='sed -E'
else
  SED='sed -r'
fi

for df in $DOTFILES; do
  target=$(echo $df | $SED "s:.*/(.*).symlink:$HOME/.\1:")
  rm -rf $target
  ln -s $df $target
done

unset SED
