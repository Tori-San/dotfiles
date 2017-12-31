if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap de neo
if [ -f ~/.screenlayout/default.sh ] ; then
    . ~/.screenlayout/default.sh
fi

if [ -f ~/.Xresources ]; then
    xrdb merge ~/.Xresources
fi

exec i3 -V >> ~/.i3log/i3log-"$(date +%F)" 2>&1
