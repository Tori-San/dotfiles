eval $(ssh-agent)
ssh-add

~/dotfiles/scripts/startxcheck.sh
if (($? == 0)); then
    startx;
fi
