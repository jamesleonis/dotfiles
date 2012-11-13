#!/bin/sh
# "Inspired" by Jeet Sukumaran - http://jeetworks.org/node/90

if [[ -f /usr/bin/mvim ]]; then
    VIMPATH='mvim -d -f'
elif [[ -f /usr/bin/gvim ]]; then
    VIMPATH='gvim -d -f'
else
    VIMPATH='vimdiff'
fi

$VIMPATH $@
