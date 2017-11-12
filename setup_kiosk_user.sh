# FIXME: warten bis apt process nicht mehr läuft oder vorher auto-update ausschalten

# SYSTEM CONFIG
printf "\n------------\n"
echo "SYSTEM CONFIG"
export DISPLAY=:0.0

# cleanup home directory
sudo rmdir /home/kiosk/Templates

sudo rm /home/kiosk/.config/autostart/ubuntu-mate-welcome.desktop

## check/update with: 
## gsettings list-recursively org.mate.background

# disable lock screen 
gsettings set org.mate.lockdown disable-lock-screen true

# screensaver
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.mate.screensaver lock-enabled false

# set background
sudo rm -Rf /usr/share/backgrounds/*
sudo cp ./backgrounds/WW_Wallpaper.png /usr/share/backgrounds/
sudo cp ./backgrounds/WW_Wallpaper_HD.png /usr/share/backgrounds/
gsettings set org.mate.background picture-filename /usr/share/backgrounds/WW_Wallpaper_HD.png

gsettings set org.mate.background primary-color '#555555'
gsettings set org.mate.background secondary-color '#444444'
gsettings set org.mate.background picture-opacity 100
gsettings set org.mate.background show-desktop-icons false
gsettings set org.mate.background picture-options 'centered'

# what's the difference here?
gsettings set org.gnome.desktop.background picture-uri /usr/share/backgrounds/WW_Wallpaper_HD.png

gsettings set org.gnome.desktop.background primary-color '#555555'
gsettings set org.gnome.desktop.background secondary-color '#444444'
gsettings set org.gnome.desktop.background picture-opacity 100
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.background picture-options 'centered'


# disable notifications (??? No such schema)
# gsettings set com.ubuntu.update-notifier no-show-notifications true

# disable display going to sleep
gsettings set org.mate.power-manager sleep-display-ac 0
gsettings set org.mate.power-manager sleep-display-battery 0
gsettings set org.mate.power-manager sleep-display-ups 0
# display: disable dim
gsettings set org.mate.power-manager kbd-brightness-dim-by-on-idle 100

# hide top panel (needs reboot)
dconf write /org/mate/panel/toplevels/top/auto-hide true

# hide bottom panel
dconf write /org/mate/panel/toplevels/bottom/auto-hide true

# config all elements 
# dconf write /org/mate/panel/general/object-id-list [...]

# check this:
#org.mate.NotificationDaemon popup-location 'top_right'
#org.mate.gnome-main-menu.lock-down
#org.gnome.settings-daemon.plugins.power

# dconf write /org/mate/panel/menubar/show-icon false
# dconf write /org/mate/panel/menubar/show-places false
# dconf write /org/mate/panel/menubar/show-desktop false
#dconf write /org/mate/panel/menubar/show-applications false

#org.gnome.desktop.lockdown disable-command-line false
#org.gnome.desktop.lockdown disable-application-handlers false
#org.gnome.desktop.lockdown disable-user-switching false
#org.gnome.desktop.lockdown user-administration-disabled false
#org.gnome.desktop.lockdown disable-printing false
# org.gnome.desktop.lockdown disable-log-out false
#org.gnome.desktop.lockdown disable-lock-screen false
#org.gnome.desktop.lockdown disable-print-setup false
#org.gnome.desktop.lockdown disable-save-to-disk false


# check and remove unneeded services
# systemctl list-units

# bluetooth off
sudo systemctl disable bluetooth



# export DISPLAY=:0.0
# gsettings set org.mate.background picture-filename /usr/share/backgrounds/WW_Wallpaper_4K.png
# gsettings set org.gnome.desktop.background picture-uri /usr/share/backgrounds/WW_Wallpaper_4K.png

echo "Please check resolution for background image"
echo "export DISPLAY=:0.0"
echo "gsettings set org.mate.background picture-filename /usr/share/backgrounds/WW_Wallpaper_HD.png"
echo ""
echo "Press return to install kiosk software or "
echo "ctrl-c to break"
read X
sh ./install_kiosk_software.sh

