echo "\nConfigure Desktop\n"

# gsettings list-recursively org.mate.background
# dconf dump /org/mate/panel/objects/object-0/

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
# dconf write /org/mate/panel/toplevel/background/color "rgba(0,0,0,1)"
gsettings set org.mate.interface gtk-theme 'Yaru-bark-dark'
# /usr/share/themes/Yaru-bark-dark/gtk-3.0/

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
source /etc/bash.bashrc

# caja
dconf load /org/mate/panel/objects/caja-applet/ << EOF
[/]
launcher-location='/usr/share/applications/caja-browser.desktop'
object-type='launcher'
position=200
toplevel-id='top'
EOF

# terminal
dconf load /org/mate/panel/objects/terminal-applet/ << EOF
[/]
launcher-location='/usr/share/applications/mate-terminal.desktop'
object-type='launcher'
position=250
toplevel-id='top'
EOF

# chromium
dconf load /org/mate/panel/objects/chromium-applet/ << EOF
[/]
launcher-location='/var/lib/snapd/desktop/applications/chromium_chromium.desktop'
object-type='launcher'
position=300
toplevel-id='top'
EOF

# ip-applet
dconf load /org/mate/panel/objects/ip-applet/ << EOF
[/]
applet-iid='CommandAppletFactory::CommandApplet'
toplevel-id='top'
position=400
object-type='applet'
panel-right-stick=false
[prefs]
interval=60
EOF
dconf write /org/mate/panel/objects/ip-applet/prefs/command "'echo \"$(\. /etc/bash.bashrc && myip4)\"'"

# mount-applet
dconf load /org/mate/panel/objects/mount-applet/ << EOF
[/]
applet-iid='CommandAppletFactory::CommandApplet'
toplevel-id='top'
position=550
object-type='applet'
panel-right-stick=false
[prefs]
interval=60
EOF
dconf write /org/mate/panel/objects/mount-applet/prefs/command "'echo \"$(print_mount_status)\"'"

# disk-applet for avail space
dconf load /org/mate/panel/objects/disk-applet/ << EOF
[/]
applet-iid='CommandAppletFactory::CommandApplet'
toplevel-id='top'
position=600
object-type='applet'
panel-right-stick=false
[prefs]
interval=60
EOF
dconf write /org/mate/panel/objects/disk-applet/prefs/command "'echo \"$(df -h / | awk 'NR==2 {print $4}')\"'"

# system monitor
# dconf load /org/mate/panel/objects/system-monitor-applet/ << EOF
# [/]
# applet-iid='MultiLoadAppletFactory::MultiLoadApplet'
# object-type='applet'
# position=650
# toplevel-id='top'
# EOF

gsettings set org.mate.panel object-id-list "['briskmenu', 'firefox', 'notification-area', 'indicatorappletcomplete', 'show-desktop', 'window-list', 'disk-applet', 'ip-applet', 'mount-applet', 'caja-applet', 'terminal-applet', 'chromium-applet']"

# caja bookmarks
mkdir /home/user/.config/gtk-3.0
sudo bash -c 'cat > /home/user/.config/gtk-3.0/bookmarks' << EOF
file:///var/www/html/
file:///opt/
EOF

sudo service lightdm restart