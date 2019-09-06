printf "\n------------\n"
echo "INSTALL processing service"

export DISPLAY=:0.0


# copy start-script
sudo cp ./opt/processing.sh /opt/
sudo chmod +x /opt/processing.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable processing

# autostart 
sudo cp ./autostart/processing.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/processing.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/processing.sh.desktop

sudo cp ./autostart/processing.sh.desktop /home/user/.config/autostart/
sudo chown user /home/user/.config/autostart/processing.sh.desktop
sudo chmod +x /home/user/.config/autostart/processing.sh.desktop

kioskdir

sudo mkdir /opt/logs/
sudo chmod 0777 /opt/logs/

echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable processing"
echo "configure processing in /opt/processing.sh"