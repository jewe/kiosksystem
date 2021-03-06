# KIOSK HELPER
printf "\n------------\n"
echo "INSTALL KIOSK HELPER"

sudo apt install -y curl build-essential

# ?
#sudo apt-get install -y openssh-sftp-server

# swap to ram, enable for systems with <2MB RAM
#sudo apt-get install -y zram-config

# simulate keystrokes
sudo apt install -y xdotool

# screenshot from commandline
sudo apt install -y scrot

# hide mouse
sudo apt install -y unclutter

# screen config
sudo apt install -y compizconfig-settings-manager

# vnc
sudo apt install -y x11vnc
# start with x11vnc -display :0 -noxrecord -noxfixes -noxdamage -forever -passwd 123456
# realvnc viewer mac

# system monitoring
sudo apt install -y lm-sensors cpustat fping

# nodejs
# currently v4.2.6
sudo apt install -y nodejs
# currently 3.5.2
sudo apt install -y npm
# node manager
sudo npm install -g n
# install (fixed 8.1.2)
#sudo n 8.1.2
sudo n lts

# cleanup
sudo apt-get clean
sudo apt-get -y autoremove

echo "Press return to install development tools or "
echo "ctrl-c to break"
read X
sh ./install_dev_software.sh