# KIOSK HELPER
printf "\n------------\n"
echo "INSTALL KIOSK HELPER"

sudo apt-get install -y vim nano curl build-essential

# ?
#sudo apt-get install -y openssh-sftp-server

# swap to ram, enable for systems with <2MB RAM
#sudo apt-get install -y zram-config

# simulate keystrokes
sudo apt-get install -y xdotool

# screenshot from commandline
sudo apt-get install -y scrot

# hide mouse
sudo apt-get install -y unclutter

# vnc
sudo apt-get install -y xvnc

# nodejs
# currently v4.2.6
sudo apt-get install -y nodejs-legacy
# currently 3.5.2
sudo apt-get install -y npm
# node manager
sudo npm install -g n
# install (fixed 8.1.2)
sudo n 8.1.2



# cleanup
sudo apt-get clean
sudo apt-get -y autoremove
