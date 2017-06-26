# HELPER

sudo apt-get install -y vim
sudo apt-get install -y nano
sudo apt-get install -y curl
sudo apt-get install -y build-essential
sudo apt-get install -y dropbear
sudo apt-get install -y openssh-sftp-server
sudo apt-get install -y zram-config
#sudo apt-get install -y 
#sudo apt-get install -y 
# hide mouse
sudo apt-get install -y unclutter

# SOFTWARE PACKAGES


# nginx
sudo apt-get install nginx


# chromium browser
sudo apt-get install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
# or https://www.google.com/chrome/browser/desktop/
# disable keyring window

# copy start-script
sudo mv ./opt/chrome.sh /opt/
sudo chmod +x /opt/chrome.sh

# copy service
sudo mv ./system/chrome.service /etc/systemd/system/
sudo systemctl enable chrome 




# nodejs
# currently v4.2.6
sudo apt-get install nodejs-legacy
# currently 3.5.2
sudo apt-get install npm
# node manager
sudo npm install -g n
# install currently 8.1.2
sudo n latest







# platz machen
sudo apt-get clean
sudo apt-get autoremove
