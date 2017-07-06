printf "\n------------\n"
echo "INSTALL CHROMIUM"

export DISPLAY=:0.0

# chromium browser (currently 58.0)
sudo apt-get install -y chromium-browser 
sudo apt-get install -y chromium-browser-l10n chromium-codecs-ffmpeg unity-chromium-extension

# copy start-script
sudo cp ./opt/chromium-browser.sh /opt/
sudo chmod +x /opt/chromium-browser.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable chromium-browser

# autostart 
sudo cp ./autostart/chromium-browser.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/chromium-browser.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/chromium-browser.sh.desktop

# first run to configure
echo "wenn gleich chromium aufgeht, wieder schliessen (druecke enter)"
read X
chromium-browser --disable-sync-preferences


# nginx
sudo apt-get install -y nginx

# replace webroot index
sudo chown user /var/www/html
# TODO
  # show ip, dir, url in script

# cleanup
sudo apt-get clean
sudo apt-get -y autoremove
