printf "\n------------\n"
echo "INSTALL FIREFOX"

export DISPLAY=:0.0

sudo apt-get update

# firefox (currently 65.0)
sudo apt-get install -y firefox 
sudo apt install -y xdotool

# copy start-script
sudo cp ./opt/firefox.sh /opt/
sudo chmod +x /opt/firefox.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable firefox

# autostart kiosk
sudo cp ./autostart/firefox.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/firefox.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/firefox.sh.desktop

# autostart user
sudo cp ./autostart/firefox.sh.desktop /home/user/.config/autostart/
sudo chown user /home/user/.config/autostart/firefox.sh.desktop
sudo chmod +x /home/user/.config/autostart/firefox.sh.desktop

# first run to configure
firefox &


# nginx
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
echo "kioskctl disable firefox"
echo "webroot: /var/www/html/"
echo "sudo nano /etc/nginx/nginx.conf / "
echo "sudo nano /etc/nginx/sites-enabled/default"
echo "http://browserbench.org/MotionMark/"