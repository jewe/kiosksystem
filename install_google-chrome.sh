printf "\n------------\n"
echo "INSTALL GOOGLE CHROME"

export DISPLAY=:0.0

# google chrome (currently 59.0)
# TODO kiosk need write permission
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

# copy start-script
sudo cp ./opt/google-chrome.sh /opt/
sudo chmod +x /opt/google-chrome.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable google-chrome

# autostart 
sudo cp ./autostart/google-chrome.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/google-chrome.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/google-chrome.sh.desktop

# first run to configure
google-chrome &


# nginx
sudo apt-get update
sudo apt-get install -y nginx

# replace webroot index
sudo chown user /var/www/html
sudo rm /var/www/html/index.nginx-debian.html
sudo cp ./www/index.html /var/www/html/

# cleanup
sudo apt-get clean
sudo apt-get -y autoremove

echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable google-chrome"
echo "webroot: /var/www/html/"
echo "sudo nano /etc/nginx/nginx.conf"