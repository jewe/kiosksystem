# Ubuntu MATE 24.04.1
# THIS FILE IS STEP 1

# cleanup user dir
echo "\nCleanup user dir\n"
rmdir /home/user/Music 
rmdir /home/user/Templates 
rmdir /home/user/Videos 

# remove software
sudo apt remove --purge libreoffice* -y
sudo apt remove --purge mate-utils mate-calc -y
sudo apt autoremove -y

sudo journalctl --vacuum-time=14d
ubuntu-report -f send no
export DISPLAY=:0.0

# prevent standby
gsettings set org.mate.power-manager sleep-display-ac 0
gsettings set org.mate.power-manager sleep-display-battery 0
gsettings set org.mate.power-manager sleep-display-ups 0
gsettings set org.mate.power-manager sleep-computer-ac 0
gsettings set org.mate.power-manager sleep-computer-battery 0
gsettings set org.mate.power-manager kbd-brightness-dim-by-on-idle 100

# notifications
gsettings set org.mate.caja.preferences show-notifications false 
gsettings set org.gnome.desktop.notifications show-banners false
sudo mv /usr/share/dbus-1/services/org.freedesktop.mate.Notifications.service /usr/share/dbus-1/services/org.freedesktop.mate.Notifications.service.disabled

# disable services
sudo systemctl disable bluetooth
sudo systemctl disable apport.service 
sudo systemctl disable avahi-daemon

# readonly filesystem
printf "\n------------\n"
echo "Readonly filesystem"
# prepare disabled config
sudo /bin/su -c "echo 'overlayroot="tmpfs:swap=1,recurse=0"' >> /etc/overlayroot.local.conf.enabled"
sudo /bin/su -c "echo 'overlayroot=""' >> /etc/overlayroot.local.conf.disabled"
sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak

# other
mkdir /home/user/.config/autostart
sed -i '/^HISTSIZE=/c\HISTSIZE=10000' ~/.bashrc
sed -i '/^HISTFILESIZE=/c\HISTFILESIZE=20000' ~/.bashrc

# create key (for git etc.)
ssh-keygen -t ed25519 -C "mail@kiosksystem.jewe.net" -f /home/user/.ssh/id_rsa -N '' 
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa

# config git
git config --global user.email "dummy@dummy.de"
git config --global user.name "J.W."

# gitlab
ssh-add ~/.ssh/id_rsa
sudo bash -c 'cat > /home/user/.ssh/config' << EOF
# GitLab.com server
Host gitlab.com
RSAAuthentication yes
IdentityFile ~/.ssh/id_rsa
EOF

# autologin
sudo bash -c 'cat > /etc/lightdm/lightdm.conf.d/10-user-autologin.conf' << EOF
[Seat:*]
autologin-guest=false
autologin-user=user
autologin-user-timeout=0
EOF


# disable syslog entries from ureadahead
sudo mkdir /etc/systemd/system/ureadahead.service.d/
sudo bash -c 'cat > /etc/systemd/system/ureadahead.service.d/quiet.conf' << EOF
[Service]
ExecStart=
ExecStart=/sbin/ureadahead -q
EOF

# node
yes | curl -L https://bit.ly/n-install | bash

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

sudo cp /opt/tmp/kiosksystem/etc/rc.local /etc/
chmod +x /etc/rc.local

# TODO prevent multiple executions
sudo -s -- <<EOF
cat /opt/tmp/kiosksystem/opt/global_functions >> /etc/bash.bashrc
EOF

# display all hidden apps
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

sh setup_02_kiosk-user.sh

bash setup_03_mate-desktop.sh

# disable services in /etc/xdg/autostart/
# FIXME: change Autostart-enabled to false instead of renaming
cd /etc/xdg/autostart/
# bluetooth
#sudo sed -i 's/Autostart=false/Autostart=true/g' blueman.desktop
# sudo mv blueman.desktop blueman.desktop.disabled
# sudo systemctl disable blueman
# power manager
# sudo mv mate-power-manager.desktop mate-power-manager.desktop.disabled
# screensaver
sudo mv mate-screensaver.desktop mate-screensaver.desktop.disabled
# screenreader
sudo mv orca-autostart.desktop orca-autostart.desktop.disabled
# updates
sudo mv update-notifier.desktop update-notifier.desktop.disabled


# performance, cpu-power etc...
sudo cp services/cpupower.service /etc/systemd/system/ 
sudo cp services/energy_performance.service /etc/systemd/system/ 

# screenshot from commandline
sudo apt install -y scrot

# reboot
echo "Press return to reboot now and login as 'kiosk'"
read X
sudo reboot