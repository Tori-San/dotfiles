set $mod Mod4

set $dm-recent ~/dotfiles/scripts/dm-recent
set $dmenu-flags -fn \\"hack-10\\" -i -sb \\"{{ level1_bg }}\\" -nb \\"{{ level2_bg }}\\" -nf \\"{{ level2_fg }}\\" -sf \\"{{ level1_fg }}\\"
set $terminal termite

font pango:Terminus 8

floating_modifier $mod

# start a terminal
bindsym $mod+Return exec $terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id $dm-recent $dmenu-flags -p "> "

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
#bindsym $mod+Shift+j move left
#bindsym $mod+Shift+k move down
#bindsym $mod+Shift+l move up
#bindsym $mod+Shift+odiaeresis move right

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
# bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+Shift+a focus parent

# focus the child container
bindsym $mod+a focus child

# screenshot
bindsym Print exec scrot -u -e 'xclip -selection clipboard -t image/png $f && mv $f /tmp'
bindsym --release Shift+Print exec scrot -s -e 'xclip -selection clipboard -t image/png $f && mv $f /tmp'

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
bindsym $mod+Shift+e exec --no-startup-id "sh -c 'if [ $(echo -e \\"no\nyes\\" | dmenu $dmenu-flags -p \\"exit i3?\\") = yes ]; then i3-msg exit; fi'"

bindsym $mod+Shift+s exec --no-startup-id "sh -c 'if [ $(echo -e \\"no\nyes\\" | dmenu $dmenu-flags -p \\"shutdown?\\") = yes ]; then shutdown now; fi'"

bindsym $mod+Shift+x exec --no-startup-id xsecurelock

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        #bindsym j resize shrink width 10 px or 10 ppt
        #bindsym k resize grow height 10 px or 10 ppt
        #bindsym l resize shrink height 10 px or 10 ppt
        #bindsym odiaeresis resize grow width 10 px or 10 ppt

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

bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight - 10 #Decrease Brightness
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight + 10 #Increase Brightness
bindsym Shift+XF86MonBrightnessDown exec --no-startup-id xbacklight -set 1
bindsym ShiftXF86MonBrightnessUp exec --no-startup-id xbacklight -set 100

bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle #Mute
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -10% #Decrease Volume
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +10% #Increase Volume

bindsym XF86TouchpadToggle exec --no-startup-id ~/dotfiles/scripts/toggletouchpad #Toggle Touchpad

bindsym $mod+Tab workspace back_and_forth

bindsym $mod+t exec --no-startup-id sh -c 'i3-msg workspace $(~/dotfiles/scripts/get_workspaces.py | dmenu $dmenu-flags -p \\"switch workspace\\")'

bindsym $mod+Shift+t exec --no-startup-id sh -c 'i3-msg move container to workspace $(~/dotfiles/scripts/get_workspaces.py | dmenu $dmenu-flags -p \\"move to workspace\\")'

## mpd controls

bindsym $mod+comma exec --no-startup-id mpc prev
bindsym $mod+period exec --no-startup-id mpc next
bindsym $mod+space exec --no-startup-id mpc toggle

## looks

new_window pixel 3
gaps inner 18
#gaps outer 4
#smart_gaps on
smart_borders on

## colours

set $warning    #ff6600

#type                   border      background  text        indicator
client.focused          {{ level1_bg }}    {{ level1_bg }}    {{ level1_fg }}    {{ level1_bg }}
client.focused_inactive {{ level2_bg }}    {{ level2_bg }}    {{ level2_fg }}    {{ level2_bg }}
client.unfocused        {{ level2_bg }}    {{ level2_bg }}    {{ level2_bg }}    {{ level2_bg }}
client.urgent           {{ level1_bg_vis }} {{ level1_bg_vis }} {{ level1_fg_vis }} {{ level1_bg_vis }}
#client.urgent           $warning    $warning    $warning    $warning

# workspace-assignments

for_window[title="Chromium"] move workspace 1

for_window[title="^Scratch$"] move scratchpad
for_window[title="^Scratch$"] sticky enable

for_window[title="^Floaty$"] floating enable

# autostart

# bar
exec --no-startup-id powerline-daemon -q
exec --no-startup-id ~/dotfiles/scripts/bar.sh

exec --no-startup-id redshift


exec --no-startup-id /usr/bin/compton -b -c --config ~/.config/compton/config # transparency+shadows
exec_always --no-startup-id ~/.fehbg
exec --no-startup-id $terminal --title=Scratch -e "tmux new -A -s scratch"
exec --no-startup-id chromium --title=Chromium

exec_always --no-startup-id ibus-daemon -r

exec xinput set-prop 13 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 0.5  # trackpoint speed
