set $background {{ black }}
set $foreground {{ white }}
set $gray       {{ alt_black }}
set $primary    {{ primary }}
set $secondary  {{ secondary }}
set $tertiary   {{ tertiary }}
set $warning    {{ special }}

set $mod Mod4

font pango:Terminus 8

floating_modifier $mod

# start a terminal
bindsym $mod+Return exec xfce4-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id ~/bin/dm-recent -fn "terminesspowerline-8" -i -nb "{{ black }}" -nf "{{ tertiary }}" -sb "{{ secondary }}" -sf "{{ black }}" -p "> "

# change focus
#bindsym $mod+j focus left
#bindsym $mod+k focus down
#bindsym $mod+l focus up
#bindsym $mod+odiaeresis focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+odiaeresis move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

#move between screens
bindsym $mod+Shift+Mod1+Left move workspace to output left
bindsym $mod+Shift+Mod1+Down move workspace to output down
bindsym $mod+Shift+Mod1+Up move workspace to output up
bindsym $mod+Shift+Mod1+Right move workspace to output right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# change container layout (stacked, tabbed, toggle split)
#bindsym $mod+s layout stacking
#bindsym $mod+w layout tabbed
#bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# screenshot
bindsym Print exec scrot -u -e 'mv $f ~/Pictures/Screenshots/'
bindsym --release Shift+Print exec scrot -s -e 'mv $f ~/Pictures/Screenshots/'"

# workspaces

set $w1 "1"
set $w2 "2"
set $w3 "3"
set $w4 "4"
set $w5 "5"
set $w6 "6"
set $w7 "7"
set $w8 "8"
set $w9 "9"
set $w0 "10"
set $wf1 "F1"
set $wf2 "F2"
set $wf3 "F3"
set $wf4 "F4"
set $wf5 "F5"
set $wf6 "F6"
set $wf7 "F7"
set $wf8 "F8"
set $wf9 "F9"
set $wf0 "F10"

# switch to workspace
bindsym $mod+1 workspace $w1
bindsym $mod+2 workspace $w2
bindsym $mod+3 workspace $w3
bindsym $mod+4 workspace $w4
bindsym $mod+5 workspace $w5
bindsym $mod+6 workspace $w6
bindsym $mod+7 workspace $w7
bindsym $mod+8 workspace $w8
bindsym $mod+9 workspace $w9
bindsym $mod+0 workspace $w0
bindsym $mod+F1 workspace $wf1
bindsym $mod+F2 workspace $wf2
bindsym $mod+F3 workspace $wf3
bindsym $mod+F4 workspace $wf4
bindsym $mod+F5 workspace $wf5
bindsym $mod+F6 workspace $wf6
bindsym $mod+F7 workspace $wf7
bindsym $mod+F8 workspace $wf8
bindsym $mod+F9 workspace $wf9
bindsym $mod+F10 workspace $wf0

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $w1
bindsym $mod+Shift+2 move container to workspace $w2
bindsym $mod+Shift+3 move container to workspace $w3
bindsym $mod+Shift+4 move container to workspace $w4
bindsym $mod+Shift+5 move container to workspace $w5
bindsym $mod+Shift+6 move container to workspace $w6
bindsym $mod+Shift+7 move container to workspace $w7
bindsym $mod+Shift+8 move container to workspace $w8
bindsym $mod+Shift+9 move container to workspace $w9
bindsym $mod+Shift+0 move container to workspace $w0
bindsym $mod+Shift+F1 move container to workspace $wf1
bindsym $mod+Shift+F2 move container to workspace $wf2
bindsym $mod+Shift+F3 move container to workspace $wf3
bindsym $mod+Shift+F4 move container to workspace $wf4
bindsym $mod+Shift+F5 move container to workspace $wf5
bindsym $mod+Shift+F6 move container to workspace $wf6
bindsym $mod+Shift+F7 move container to workspace $wf7
bindsym $mod+Shift+F8 move container to workspace $wf8
bindsym $mod+Shift+F9 move container to workspace $wf9
bindsym $mod+Shift+F10 move container to workspace $wf0

bindsym $mod+m scratchpad show
bindsym $mod+Shift+m move scratchpad

# assignments

#assign [class="chromium"] $w1

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec --no-startup-id "sh -c 'if [ $(echo -e \\"no\nyes\\" | dmenu -fn \\"terminesspowerline-8\\" -sb \\"{{ special }}\\" -i -p \\"exit i3?\\") = yes ]; then i3-msg exit; fi'"

bindsym $mod+Shift+s exec --no-startup-id "sh -c 'if [ $(echo -e \\"no\nyes\\" | dmenu -fn \\"terminesspowerline-8\\" -sb \\"{{ special }}\\" -i -p \\"shutdown?\\") = yes ]; then shutdown now; fi'"

bindsym $mod+Shift+x exec "i3lock-fancy -gp"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym odiaeresis resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

mode "gaps" {
    bindsym o      mode "gaps-o"
    bindsym i      mode "gaps-i"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

mode "gaps-i" {
    bindsym p  gaps inner current plus 5
    bindsym m gaps inner current minus 5
    bindsym 0     gaps inner current set 0


    bindsym Shift+p  gaps inner all plus 5
    bindsym Shift+m gaps inner all minus 5
    bindsym Shift+0     gaps inner all set 0

    bindsym Return mode "default"
    bindsym Escape mode "default"
}
mode "gaps-o" {
    bindsym p     gaps outer current plus 5
    bindsym m     gaps outer current minus 5
    bindsym 0     gaps outer current set 0

    bindsym Shift+p     gaps outer all plus 5
    bindsym Shift+m     gaps outer all minus 5
    bindsym Shift+0     gaps outer all set 0

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"
bindsym $mod+Shift+g mode "gaps"

## custom keybindings

bindsym $mod+F11 exec --no-startup-id setxkbmap us
bindsym $mod+Shift+F11 exec --no-startup-id setxkbmap -layout us -variant intl
bindsym $mod+F12 exec --no-startup-id setxkbmap de neo
bindsym $mod+Shift+F12 exec --no-startup-id setxkbmap de

bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight - 20 #Decrease Brightness
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight + 20 #Increase Brightness

bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle #Mute
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -10% #Decrease Volume
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +10% #Increase Volume

bindsym XF86TouchpadToggle exec --no-startup-id toggletouchpad #Toggle Touchpad

bindsym $mod+Tab workspace back_and_forth

bindsym $mod+t exec --no-startup-id sh -c 'i3-msg workspace $(~kai/.config/i3/get_workspaces.py | dmenu -sb \\"{{ special }}\\" -i -p \\"switch workspace\\" -fn \\"terminesspowerline-8\\")'

bindsym $mod+Shift+t exec --no-startup-id sh -c 'i3-msg move container to workspace $(~kai/.config/i3/get_workspaces.py | dmenu -sb \\"{{ special }}\\" -i -p \\"move to workspace\\" -fn \\"terminesspowerline-8\\")'

## looks

new_window pixel 4
gaps inner 6
gaps outer 4
#smart_gaps on
smart_borders on

## colours

#type					border		background	text		indicator
client.focused          $primary    $primary   	$background $primary
client.focused_inactive $background $background $foreground $background
client.unfocused        $background $background $background $secondary
client.urgent           $warning    $warning    $foreground $warning

# workspace-assignments

for_window[title="Chromium"] move workspace 1
for_window[title="^Scratch$"] move scratchpad

# autostart

# bar

exec_always --no-startup-id pkill -f 'python .*powerline-lemonbar\.py'
exec_always --no-startup-id sleep 1 && ~/Repos/powerline/powerline/bindings/lemonbar/powerline-lemonbar.py --i3 --height 13 -- -b -f "-xos4-terminesspowerline-medium-*-*-*-12-*-*-*-*-*-*-*" -f FontAwesome-8

#exec --no-startup-id .config/i3/bar_wrapper.sh

exec --no-startup-id /usr/bin/compton -b -c --config ~/.config/compton/config # transparency+shadows
##exec --no-startup-id ~/utils/randomPokemonWallpaper # wallpaper
exec --no-startup-id ~/.fehbg
exec --no-startup-id xfce-terminal --title=Scratch
exec --no-startup-id chromium --title=Chromium