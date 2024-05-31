# create kiosk user
printf "\n------------\n"
echo "Creating kiosk user"

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