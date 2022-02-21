# Ubuntu MATE 16.04.2

# THIS FILE IS STEP 1


# UNINSTALL unneeded applications
printf "\n------------\n"
echo "UNINSTALL unneeded applications\n"

## check/update with
## apt list --installed
# FIXME: dpkg alle Pakete nach Größe sortieren
#sudo apt remove -y mate-screensaver # removes mate-core...?
#sudo apt remove -y ubuntu-mate-wallpapers 
#sudo apt remove -y synapse shotwell 

sudo apt remove -y ubuntu-mate-wallpapers-photos
sudo apt remove -y speech-dispatcher
#sudo apt remove -y sound-theme-freedesktop
#sudo apt remove -y printer-driver-hpcups printer-driver-brlaser printer-driver-c2esp printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-gutenprint printer-driver-hpcups printer-driver-m2300w printer-driver-min12xxw printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-ptouch/bionic
#sudo apt remove -y printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix 

# sudo apt-get remove -y update-notifier
# mac like dock
#sudo apt-get remove -y plank

sudo snap remove ubuntu-mate-welcome

# screenreader
#sudo apt remove -y gnome-orca

# keyring app (otherwise problems with chromium-browser)
sudo apt remove -y gnome-keyring

# remove unused locals
# sudo apt-get install localepurge # FIXME


# UPDATE ALL PACKAGES
printf "\n------------\n"
echo "UPDATE ALL PACKAGES\n"
sudo apt-get update
sudo apt-get -y dist-upgrade


# SYSTEM CONFIG
printf "\n------------\n"
echo "SYSTEM CONFIG\n"
export DISPLAY=:0.0

## check/update with: 
## gsettings list-recursively org.mate.background

# disable lock screen 
gsettings set org.mate.lockdown disable-lock-screen true

# screensaver
# gsettings set org.gnome.desktop.session idle-delay 0
# gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.mate.screensaver lock-enabled false
gsettings set org.mate.session idle-delay 0
gsettings set org.mate.screensaver idle-activation-enabled false

# set background
sudo rm -Rf /usr/share/backgrounds/*
sudo cp ./backgrounds/*.* /usr/share/backgrounds/
# greeter
sudo mkdir /usr/share/backgrounds/ubuntu-mate-common
sudo cp ./backgrounds/WW_Wallpaper_HD.png /usr/share/backgrounds/ubuntu-mate-common/Ubuntu-Mate-Cold-lightdm.jpg

gsettings set org.mate.background picture-filename /usr/share/backgrounds/WW_Wallpaper_HD.png

gsettings set org.mate.background primary-color '#555555'
gsettings set org.mate.background secondary-color '#444444'
gsettings set org.mate.background picture-opacity 100
gsettings set org.mate.background show-desktop-icons false
gsettings set org.mate.background picture-options 'centered'


# disable display going to sleep
gsettings set org.mate.power-manager sleep-display-ac 0
gsettings set org.mate.power-manager sleep-display-battery 0
gsettings set org.mate.power-manager sleep-display-ups 0
# display: disable dim
gsettings set org.mate.power-manager kbd-brightness-dim-by-on-idle 100


#update-manager
#sudo apt install gconf-editor
#dconf dump /

# autohide top panel (needs reboot)
dconf write /org/mate/panel/toplevels/top/auto-hide true

# autohide bottom panel
dconf write /org/mate/panel/toplevels/bottom/auto-hide true

dconf write /com/ubuntu/update-manager/no-show-notifications true

# disable bluetooth
sudo systemctl disable bluetooth # permanent?


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
sudo mkdir /home/user/Pictures
cp ./sample_Images/* /home/user/Pictures
sudo mkdir /home/user/.config/autostart

# create key (for git etc.)
echo "---"
echo "Press return to generate ssh-key without passphrase" 
ssh-keygen -t rsa -b 4096 -f /home/user/.ssh/id_rsa -N '' 


# disable syslog entries from ureadahead
sudo mkdir /etc/systemd/system/ureadahead.service.d/
sudo bash -c 'cat > /etc/systemd/system/ureadahead.service.d/quiet.conf' << EOF
[Service]
ExecStart=
ExecStart=/sbin/ureadahead -q
EOF


# TODO: disable telemetry


# config git
git config --global user.email "dummy@dummy.de"
git config --global user.name "J.W."



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
#sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.disabled"

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
# mate welcome
#sudo mv ubuntu-mate-welcome-autostart.desktop ubuntu-mate-welcome-autostart.desktop.disabled
sudo snap remove ubuntu-mate-welcome
# notifications

# disable common unix printing service
#sudo systemctl disable cupsd.service
#sudo systemctl disable cups-browsed.service

# disable avahi-daemon 
sudo systemctl disable avahi-daemon

# Disable HUD
#sudo chmod -x /usr/lib/x86_64-linux-gnu/hud/hud-service

# Disable evolution processes
#sudo mv /usr/lib/evolution-data-server /usr/lib/evolution-data-server-disabled
#sudo mv /usr/lib/evolution /usr/lib/evolution-disabled

# net-tools
sudo apt-get install -y net-tools

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


