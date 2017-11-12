if [ -z ${SSH_AGENT_PID+x} ]; then
    eval $(ssh-agent)
    ssh-add
fi

~/dotfiles/scripts/startxcheck.sh
if (($? == 0)); then
    startx;
fi
