#!/bin/sh
killall powerline-lemonbar; \
powerline-lemonbar\
    --i3 \
    --alt_output \
    --bar_command lemonbar \
    --height 13 \
    --interval 2 \
    -- \
    -a 40 \
    -b \
    -f '-xos4-terminesspowerline-medium-*-*-*-12-*-*-*-*-*-*-*' \
    -f 'FontAwesome-8' \
    -f 'IPAGothic-8'
