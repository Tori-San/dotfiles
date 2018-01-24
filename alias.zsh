alias l='ls -lhv --group-directories-first'
alias la='ls -lhAv --group-directories-first'

#alias Update='sudo pacman -Syu --noconfirm'
#alias Install='sudo pacman -S'
#alias Search='sudo pacman -Ss'
#alias Remove='sudo pacman -Rns'
#alias Clean='sudo pacman -Scc'

#alias AurSearch='yaourt -Ss'
#alias AurUpdate='yaourt -Syua'
#alias AurInstall='yaourt -S'

alias :q='exit'

alias hflqynmdv='setxkbmap de neo'

alias rtfm='man'
alias tldr='less'

alias comp="g++ -std=c++14 -O2 -Wall -Wextra "
alias compd="clang++ -std=c++14 -g3 -Weverything -Wno-shadow-field-in-constructor -Wno-c++98-compat -Wno-missing-prototypes -Wno-c++98-compat-pedantic -Wno-shorten-64-to-32 -Wno-missing-variable-declarations -Wno-exit-time-destructors -Wno-global-constructors -Wno-padded -Wno-sign-conversion -fsanitize=undefined -fsanitize=address -D_GLIBCXX_DEBUG "
alias compo="clang++ -std=c++14 -O3 -march=native -Wall -Wextra "

compy () {
    cython --embed $1 -o /tmp/cython_tmp.c && \
    gcc $(python-config --cflags) $(python-config --ldflags) /tmp/cython_tmp.c ${@:2} && \
    rm /tmp/cython_tmp.c
}

alias clip="xclip -selection clipboard"

alias pubip="curl -s ipv4.icanhazip.com"

alias vserver="ssh -A dratini@v22017014164742712.powersrv.de"

alias netrestart="systemctl restart netctl-auto@wlp5s0.service"
alias btrestart="systemctl restart bluetooth"

alias scratch='i3-msg exec "termite --title Scratch -e \"tmux new -A -s scratch\""'

alias ナノ="nano"

alias newsandbox="isolate --init --cg"
alias sandbox="isolate --dir=etc --dir=boot --dir=home --dir=opt --dir=root --dir=sbin --dir=tmp --cg --cg-timing --chdir=$(pwd) --full-env --processes=100 --meta=/tmp/boxmeta --run "
alias sandboxmem="isolate --dir=etc --dir=boot --dir=home --dir=opt --dir=root --dir=sbin --dir=tmp --cg --cg-mem=4194304 --cg-timing --chdir=$(pwd) --full-env --mem=4194304  --processes=100 --meta=/tmp/boxmeta --run "

alias vim="vim --servername vim"

alias gds="git diff --staged"
