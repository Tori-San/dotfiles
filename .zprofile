eval $(ssh-agent)
ssh-add

~/utils/startxcheck.sh
if (($? == 0)); then
    startx;
fi
