# vim ft=dosini cms=#%s

[options]
font = Hack

[colors]
cursor = {{ green }}
cursor_foreground = #000000
#background = #121212
#background = rgba(18, 18, 18, 0.8)
#foreground = #ffffff

background = rgba(0x{{ background[1:3] }}, 0x{{ background[3:5] }}, 0x{{ background[5:] }}, 0.9)
foreground = {{ foreground }}

# black
color0 = {{ black }}
color8 = {{ alt_black }}

# red
color1 = {{ red }}
color9 = {{ alt_red }}

# green
color2 = {{ green }}
color10 = {{ alt_green }}

# yellow
color3 = {{ yellow }}
color11 = {{ alt_yellow }}

# blue
color4 = {{ blue }}
color12 = {{ alt_blue }}

# magenta
color5 = {{ magenta }}
color13 = {{ alt_magenta }}

# cyan
color6 = {{ cyan }}
color14 = {{ alt_cyan }}

# white
color7 = {{ white }}
color15 = {{ prompt }}
