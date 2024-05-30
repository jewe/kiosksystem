# Ubuntu MATE 24.04.1
# THIS FILE IS STEP 1

## check/update with
## apt-get list --installed
# remove packages
apt-get remove -y ubuntu-mate-wallpapers-common ubuntu-mate-wallpapers-noble firefox libreoffice-common libreoffice-core
apt-get update
apt-get autoremove -y --purge && apt-get -y clean

# cleanup user dir
echo "cleanup user dir"
rmdir /home/user/Music 
rmdir /home/user/Pictures 
rmdir /home/user/Templates 
rmdir /home/user/Video 
journalctl --vacuum-time=14d

# settings desktop
export DISPLAY=:0.0
sudo gsettings set org.mate.lockdown disable-lock-screen true
sudo gsettings set org.mate.screensaver lock-enabled false
sudo gsettings set org.mate.screensaver idle-activation-enabled false
sudo gsettings set org.mate.session idle-delay 0

# desktop design
sudo gsettings set org.mate.background primary-color '#555555'
sudo gsettings set org.mate.background secondary-color '#444444'
sudo gsettings set org.mate.background picture-opacity 100
sudo gsettings set org.mate.background show-desktop-icons false
sudo gsettings set org.mate.background picture-options 'centered'

rm -Rf /usr/share/backgrounds/*
cp ./backgrounds/*.* /usr/share/backgrounds/
# greeter
mkdir /usr/share/backgrounds/ubuntu-mate-common
cp ./backgrounds/WW_Wallpaper_HD.png /usr/share/backgrounds/ubuntu-mate-common/Ubuntu-Mate-Cold-lightdm.jpg
gsettings set org.mate.background picture-filename /usr/share/backgrounds/WW_Wallpaper_HD.png

# desktop layout 
dconf write /org/mate/panel/toplevels/top/auto-hide true
dconf write /org/mate/panel/toplevels/top/auto-hide-size 0
dconf write /org/mate/panel/toplevels/bottom/auto-hide true
dconf write /org/mate/panel/toplevels/bottom/auto-hide-size 0
# gsettings set org.mate.panel object-id-list ['briskmenu']
gsettings set org.mate.panel toplevel-id-list ['top']

# standby
gsettings set org.mate.power-manager sleep-display-ac 0
gsettings set org.mate.power-manager sleep-display-battery 0
gsettings set org.mate.power-manager sleep-display-ups 0
gsettings set org.mate.power-manager kbd-brightness-dim-by-on-idle 100

# notifications
gsettings set org.mate.caja.preferences show-notifications false 
gsettings set org.gnome.desktop.notifications show-banners false
mv /usr/share/dbus-1/services/org.freedesktop.mate.Notifications.service /usr/share/dbus-1/services/org.freedesktop.mate.Notifications.service.disabled

# disable services
systemctl disable bluetooth
systemctl disable apport.service

# readonly filesystem
printf "\n------------\n"
echo "Readonly filesystem"
# prepare disabled config
sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.enabled"
sudo /bin/su -c "echo 'overlayroot=""' >> /etc/overlayroot.local.conf.disabled"
sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak

# other
mkdir /home/user/.config/autostart
# chmod -R 0777 /opt

# create key (for git etc.)
ssh-keygen -t ed25519 -C "mail@kiosksystem.jewe.net" -f /home/user/.ssh/id_rsa -N '' 
ubuntu-report -f send no
ssh-add ~/.ssh/id_rsa

# gitlab
ssh-add ~/.ssh/id_rsa
sudo bash -c 'cat > /home/user/.ssh/config' << EOF
# GitLab.com server
Host gitlab.com
RSAAuthentication yes
IdentityFile ~/.ssh/id_rsa
EOF

# allow clone to /opt
sudo chmod 0777 /opt

# disable syslog entries from ureadahead
sudo mkdir /etc/systemd/system/ureadahead.service.d/
sudo bash -c 'cat > /etc/systemd/system/ureadahead.service.d/quiet.conf' << EOF
[Service]
ExecStart=
ExecStart=/sbin/ureadahead -q
EOF

# create kiosk user
printf "\n------------\n"
echo "Create kiosk user"

# id -u kiosk &>/dev/null || 
sudo adduser --gecos "" kiosk 

# node
curl -L https://bit.ly/n-install | bash

# autologin
# See LightDM "help" in: /usr/share/doc/lightdm/lightdm.conf.gz

# sudo bash -c 'cat > /etc/lightdm/lightdm.conf' << EOF
# [Seat:*]
# autologin-guest=false
# autologin-user=kiosk
# autologin-user-timeout=0
# EOF

# temporarily allow sudo for installation 
sudo adduser kiosk sudo

# allow 'user' to access files from kiosk
sudo adduser user kiosk


# ssh keys from user
sudo cp -r /home/user/.ssh/ /home/kiosk/.ssh
sudo chown kiosk:kiosk -R /home/kiosk/.ssh/


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
echo "Install kiosk scripts\n"

# prepare /opt/
sudo mkdir /opt/kiosk
sudo mkdir /opt/kiosk/services
sudo mkdir /opt/kiosk/logs
sudo chmod -R 0777 /opt/kiosk/ # FIXME


# custom functions
sudo /bin/su -c "echo 'overlayroot=""' >> /etc/overlayroot.local.conf.disabled"
sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.enabled"

sudo cp /opt/tmp/kiosksystem/etc/rc.local /etc/
chmod +x /etc/rc.local

# TODO prevent multiple executions
sudo -s -- <<EOF
cat /opt/tmp/kiosksystem/opt/global_functions >> /etc/bash.bashrc
EOF

# disable services in /etc/xdg/autostart/
# FIXME: change Autostart-enabled to false instead of renaming

# display all hidden apps
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop




# keyring app (otherwise problems with chromium-browser)
# sudo apt-get remove -y gnome-keyring

# remove unused locals
# sudo apt-get install localepurge # FIXME

## check/update with: 
## gsettings list-recursively org.mate.background

#update-manager
#sudo apt-get install gconf-editor
#dconf dump /

# create key (for git etc.)
echo "---"
echo "Press return to generate ssh-key without passphrase" 
# ssh-keygen -t rsa -b 4096 -f /home/user/.ssh/id_rsa -N '' 
ssh-keygen -t ed25519 -C "mail@kiosksystem.jewe.net" -f /home/user/.ssh/id_rsa -N '' 



# config git
git config --global user.email "dummy@dummy.de"
git config --global user.name "J.W."

# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git-lfs install

# gitlab
ssh-add ~/.ssh/id_rsa
sudo bash -c 'cat > /home/user/.ssh/config' << EOF
# GitLab.com server
Host gitlab.com
RSAAuthentication yes
IdentityFile ~/.ssh/id_rsa
EOF

# allow clone to /opt
sudo chmod 0777 /opt


# create kiosk user
printf "\n------------\n"
echo "Create kiosk user"

# id -u kiosk &>/dev/null || 
sudo adduser --gecos "" kiosk 
# autologin
# See LightDM "help" in: /usr/share/doc/lightdm/lightdm.conf.gz

# sudo bash -c 'cat > /etc/lightdm/lightdm.conf' << EOF
# [Seat:*]
# autologin-guest=false
# autologin-user=kiosk
# autologin-user-timeout=0
# EOF

# temporarily allow sudo for installation 
sudo adduser kiosk sudo

# allow 'user' to access files from kiosk
sudo adduser user kiosk


# ssh keys from user
sudo cp -r /home/user/.ssh/ /home/kiosk/.ssh
sudo chown kiosk:kiosk -R /home/kiosk/.ssh/


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
echo "Install kiosk scripts\n"

# prepare /opt/
sudo mkdir /opt/kiosk
sudo mkdir /opt/kiosk/services
sudo mkdir /opt/kiosk/logs
sudo chmod -R 0777 /opt/kiosk/ # FIXME


# custom functions
sudo /bin/su -c "echo 'overlayroot=""' >> /etc/overlayroot.local.conf.disabled"
sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.enabled"

sudo cp /opt/tmp/kiosksystem/etc/rc.local /etc/
chmod +x /etc/rc.local

# TODO prevent multiple executions
sudo -s -- <<EOF
cat /opt/tmp/kiosksystem/opt/global_functions >> /etc/bash.bashrc
EOF

# disable services in /etc/xdg/autostart/
# FIXME: change Autostart-enabled to false instead of renaming

# display all hidden apps
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

cd /etc/xdg/autostart/
# bluetooth
#sudo sed -i 's/Autostart=false/Autostart=true/g' blueman.desktop
sudo mv blueman.desktop blueman.desktop.disabled
# power manager
sudo mv mate-power-manager.desktop mate-power-manager.desktop.disabled
# screensaver
sudo mv mate-screensaver.desktop mate-screensaver.desktop.disabled
# screenreader
sudo mv orca-autostart.desktop orca-autostart.desktop.disabled
# updates
sudo mv update-notifier.desktop update-notifier.desktop.disabled
# disable avahi-daemon 
sudo systemctl disable avahi-daemon

# performance, cpu-power etc...
sudo cp services/cpupower.service /etc/systemd/system/ 
sudo cp services/energy_performance.service /etc/systemd/system/ 


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

dconf load /org/mate/panel/general/ << EOF
[/]
object-id-list=['briskmenu', 'firefox', 'notification-area', 'indicatorappletcomplete', 'clock', 'show-desktop', 'window-list', 'workspace-switcher',  'ip-applet', 'mount-applet']
toplevel-id-list=['top', 'bottom']
EOF





# cleanup
printf "\n------------\n"
echo "CLEANUP"
sudo apt-get clean
sudo apt-get -y autoremove


# reboot
echo "Press return to reboot now and login as 'kiosk'"
read X
sudo reboot


