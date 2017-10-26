# Ubuntu MATE 16.04.2

# THIS FILE IS STEP 1


# UNINSTALL unneeded applications
printf "\n------------\n"
echo "UNINSTALL unneeded applications"

## check/update with
## apt list --installed
# FIXME: dpkg alle Pakete nach Größe sortieren
sudo apt-get remove -y firefox rhythmbox thunderbird galculator 
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

# keyring app (otherwise problems with chromium-browser)
sudo apt-get remove -y gnome-keyring

# remove unused locals
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
printf "\n------------\n"
echo "Readonly filesystem"
sudo apt-get install -y overlayroot
# prepare disabled config
sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.disabled"
sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak


# main user: user
# cleanup home directory
sudo rmdir /home/user/Videos
sudo rmdir /home/user/Templates
sudo rmdir /home/user/Music
cp ./sample_Images/* /home/user/Pictures

# create key (for git etc.)
echo "---"
echo "Press return to generate ssh-key without passphrase" 
ssh-keygen -t rsa -b 4096 -f /home/user/.ssh/id_rsa -N '' 

# create kiosk user
printf "\n------------\n"
echo "Create kiosk user"

#id -u kiosk &>/dev/null || 
sudo adduser --gecos "" kiosk 
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

# allow 'user' to access files from kiosk
sudo adduser user kiosk

# allow kiosk and user shutting down the computer
sudo -s -- <<EOF
grep -q ^'user ALL=NOPASSWD:/sbin/reboot' /etc/sudoers || echo 'user ALL=NOPASSWD:/sbin/reboot' >>/etc/sudoers
grep -q ^'user ALL=NOPASSWD:/sbin/shutdown' /etc/sudoers || echo 'user ALL=NOPASSWD:/sbin/shutdown' >>/etc/sudoers
grep -q ^'kiosk ALL=NOPASSWD:/sbin/reboot' /etc/sudoers || echo 'kiosk ALL=NOPASSWD:/sbin/reboot' >>/etc/sudoers
grep -q ^'kiosk ALL=NOPASSWD:/sbin/shutdown' /etc/sudoers || echo 'kiosk ALL=NOPASSWD:/sbin/shutdown' >>/etc/sudoers
EOF


# copy shutdown-script
sudo cp ./opt/shutdown.sh /opt/
sudo chmod +x /opt/shutdown.sh



printf "\n------------\n"
echo "Install kiosk scripts"

# prepare /opt/
sudo mkdir /opt/kiosk
sudo mkdir /opt/kiosk/services
sudo mkdir /opt/kiosk/logs
sudo chmod -R 0777 /opt/kiosk/ # FIXME


# custom functions
#sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.disabled"

sudo cp /opt/tmp/kiosksystem/etc/rc.local /etc/
# TODO prevent multiple executions
sudo -s -- <<EOF
cat /opt/tmp/kiosksystem/opt/global_functions >> /etc/bash.bashrc
EOF

# disable services in /etc/xdg/autostart/
# FIXME: change Autostart-enabled to false instead of renaming

cd /etc/xdg/autostart/
# bluetooth
sudo mv blueman.desktop blueman.desktop.disabled
# backup
sudo mv deja-dup-monitor.desktop deja-dup-monitor.desktop.disabled
# power manager
sudo mv mate-power-manager.desktop mate-power-manager.desktop.disabled
# screensaver
sudo mv mate-screensaver.desktop mate-screensaver.desktop.disabled
# screenreader
sudo mv orca-autostart.desktop orca-autostart.desktop.disabled
# updates
sudo mv update-notifier.desktop update-notifier.desktop.disabled
# mate welcome
sudo mv /home/kiosk/.config/autostart/ubuntu-mate-welcome.desktop /home/kiosk/.config/autostart/ubuntu-mate-welcome.desktop.disabled
# notifications
sudo mv /usr/share/dbus-1/services/org.freedesktop.mate.Notifications.service /usr/share/dbus-1/services/org.freedesktop.mate.Notifications.service.disabled 


# cleanup
printf "\n------------\n"
echo "CLEANUP"
sudo apt-get clean
sudo apt-get -y autoremove


# reboot
echo "Press return to reboot now and login as 'kiosk'"
read X
sudo reboot


