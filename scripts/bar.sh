#!/bin/sh
killall powerline-lemonbar; \
powerline-lemonbar\
    --i3 \
    --bar_command lemonbar \
    --height 16 \
    --interval 2 \
    -- \
    -a 40 \
    -b \
    -f 'Hack-11' \
    -f 'PowerlineSymbols-11' \
    -f 'FontAwesome-11' \
    -f 'IPAGothic-11' \
    -o 1 -o 0 -o 0 -o 0
