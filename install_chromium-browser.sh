printf "\n------------\n"
echo "INSTALL CHROMIUM"

export DISPLAY=:0.0

# chromium browser (currently 58.0)
sudo apt-get install -y chromium-browser 
sudo apt-get install -y chromium-browser-l10n chromium-codecs-ffmpeg unity-chromium-extension
sudo apt-get install -y webaccounts-chromium-extension

# copy start-script
sudo cp ./opt/chromium-browser.sh /opt/
sudo chmod +x /opt/chromium-browser.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable chromium-browser

# autostart 
sudo cp ./autostart/chromium-browser.sh.desktop /home/kiosk/.config/autostart/
sudo chmod +x /home/kiosk/.config/autostart/chromium-browser.sh.desktop

# first run to configure
echo "wenn gleich chromium aufgeht, wieder schliessen (druecke enter)"
read X
chromium-browser --disable-sync-preferences

# nginx
sudo apt-get install -y nginx


# cleanup
sudo apt-get clean
sudo apt-get autoremove
