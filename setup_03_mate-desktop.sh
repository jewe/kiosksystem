echo "\nConfigure Desktop\n"

# settings desktop
export DISPLAY=:0.0
gsettings set org.mate.lockdown disable-lock-screen true
gsettings set org.mate.screensaver lock-enabled false
gsettings set org.mate.screensaver idle-activation-enabled false
gsettings set org.mate.session idle-delay 0

# desktop design
gsettings set org.mate.background primary-color '#555555'
gsettings set org.mate.background secondary-color '#444444'
gsettings set org.mate.background picture-opacity 100
gsettings set org.mate.background show-desktop-icons false
gsettings set org.mate.background picture-options 'centered'
gsettings set org.mate.background show-desktop-icons false

# background
sudo rm -Rf /usr/share/backgrounds/*
sudo cp ./backgrounds/*.* /usr/share/backgrounds/
gsettings set org.mate.background picture-filename /usr/share/backgrounds/WW_Wallpaper_HD.png

# bars  
dconf write /org/mate/panel/toplevels/top/auto-hide true
dconf write /org/mate/panel/toplevels/top/auto-hide-size 0
dconf write /org/mate/panel/toplevels/bottom/auto-hide true
dconf write /org/mate/panel/toplevels/bottom/auto-hide-size 0
# gsettings set org.mate.panel object-id-list "['briskmenu', 'firefox', 'notification-area', 'indicatorappletcomplete', 'show-desktop', 'window-list', 'workspace-switcher', 'trashapplet']"
gsettings set org.mate.panel toplevel-id-list "['top']" # disable bottom bar


# configure mate panel with custom applets
dconf load /org/mate/panel/objects/ip-applet/ << EOF
[/]
applet-iid='CommandAppletFactory::CommandApplet'
toplevel-id='top'
position=200
object-type='applet'
panel-right-stick=false

[prefs]
interval=60
command='echo $( myip4 )'
EOF

dconf write /org/mate/panel/objects/ip-applet/prefs/command "'echo \$( myip4 )'"


dconf load /org/mate/panel/objects/mount-applet/ << EOF
[/]
applet-iid='CommandAppletFactory::CommandApplet'
toplevel-id='top'
position=330
object-type='applet'
panel-right-stick=false

[prefs]
interval=60
command='echo $( print_mount_status )'
EOF

dconf write /org/mate/panel/objects/ip-applet/prefs/command "'echo \$( print_mount_status )'"


gsettings set org.mate.panel object-id-list "['briskmenu', 'firefox', 'notification-area', 'indicatorappletcomplete', 'show-desktop', 'window-list', 'ip-applet', 'mount-applet']"


# dconf load /org/mate/panel/general/ << EOF
# [/]
# object-id-list=['briskmenu', 'firefox', 'notification-area', 'indicatorappletcomplete', 'clock', 'show-desktop', 'window-list', 'workspace-switcher',  'ip-applet', 'mount-applet']
# toplevel-id-list=['top', 'bottom']
# EOF