# Ubuntu MATE 16.04.2

# UNINSTALL unneeded applications
printf "\n------------\n"
echo "UNINSTALL unneeded applications"

## check/update with
## apt list --installed
# FIXME: dpkg alle Pakete nach Größe sortieren
sudo apt-get remove -y firefox rhythmbox samba-common thunderbird galculator 
sudo apt-get remove -y transmission-common
sudo apt-get remove -y ubuntu-mate-libreoffice-draw-icons
sudo apt-get remove -y libreoffice-core
sudo apt-get remove -y libreoffice-common
sudo apt-get remove -y hexchat simple-scan pidgin brasero cheese
sudo apt-get remove -y account-plugin-facebook account-plugin-flickr deja-dup

sudo apt-get remove -y mate-icon-theme-faenza
sudo apt-get remove -y mate-screensaver 
sudo apt-get remove -y ubuntu-mate-wallpapers ubuntu-mate-welcome
# sudo apt-get remove -y update-notifier
# mac like dock
sudo apt-get remove -y plank
# screenreader
sudo apt-get remove -y gnome-orca


# remove unused locals
export DISPLAY=:0.0
# sudo apt-get install localepurge # FIXME


# UPDATE ALL PACKAGES
printf "\n------------\n"
echo "UPDATE ALL PACKAGES"
sudo apt-get update
sudo apt-get -y dist-upgrade


# SYSTEM CONFIG
printf "\n------------\n"
echo "SYSTEM CONFIG"
export DISPLAY=:0.0

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
# greeter
sudo mkdir /usr/share/backgrounds/ubuntu-mate-common
sudo cp ./backgrounds/WW_Wallpaper_HD.png /usr/share/backgrounds/ubuntu-mate-common/Ubuntu-Mate-Cold-lightdm.jpg

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

# autohide top panel (needs reboot)
dconf write /org/mate/panel/toplevels/top/auto-hide true

# autohide bottom panel
dconf write /org/mate/panel/toplevels/bottom/auto-hide true

# disable bluetooth
sudo systemctl disable bluetooth


# readonly filesystem
# https://wiki.ubuntuusers.de/Nur-Lesen_Root-Dateisystem/




# create kiosk user
printf "\n------------\n"
echo "Create kiosk user"

sudo adduser kiosk # FIXME
# autologin
# See LightDM "help" in: /usr/share/doc/lightdm/lightdm.conf.gz

sudo bash -c 'cat > /etc/lightdm/lightdm.conf.d/50-kiosk.conf' << EOF
[Seat:*]
autologin-user=kiosk
autologin-user-timeout=0
EOF

# Setting below options in only 99-kiosk.conf doesn't seem enough (conflicts on autologin-user).
sudo bash -c 'cat > /etc/lightdm/lightdm.conf' << EOF
[Seat:*]
autologin-guest=false
autologin-user=kiosk
autologin-user-timeout=0
EOF

# temporarily allow sudo for installation 
sudo adduser kiosk sudo

# cleanup home directory
sudo rmdir /home/user/Videos
sudo rmdir /home/user/Templates
#sudo rmdir /home/user/Pictures
sudo rmdir /home/user/Music
cp ./sample_Images/* /home/user/Pictures

# prepare /opt/
sudo mkdir /opt/kiosk
sudo mkdir /opt/kiosk/services
sudo mkdir /opt/kiosk/logs
sudo chmod -R 0777 /opt/kiosk/ # FIXME


# custom functions
sudo cp ./etc/rc.local /etc/
sudo cat ./opt/global_functions >> /etc/bash.bashrc


# cleanup
printf "\n------------\n"
echo "CLEANUP"
sudo apt-get clean
sudo apt-get -y autoremove
