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
    -f 'PowerlineSymbols-12' \
    -f 'FontAwesome-11' \
    -f 'IPAGothic-11'
