from themer import ThemeActivator
import os

class TmuxActivator(ThemeActivator):
    """Tell tmux to reload powerline"""
    def activate(self):
        os.system('powerline-daemon -r')
        os.system('powerline-config tmux setup')
