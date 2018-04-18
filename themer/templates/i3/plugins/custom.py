from themer import ThemeActivator
import os

class CustomActivator(ThemeActivator):
    def activate(self):
        # reload powerline deamon
        os.system('powerline-daemon -r')
        # tell tmux to reload colors
        os.system('powerline-config tmux setup')
        # update wallpaper for lxdm
        os.system('ln -f /home/kai/.config/themer/current/wallpaper.png /usr/local/share/wallpaper/wallpaper')
