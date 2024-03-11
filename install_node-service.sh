# KIOSK HELPER
printf "\n------------\n"
echo "INSTALL node-service"

sh install_nodejs.sh

# copy start-script
sudo cp ./opt/node-service.sh /opt/
sudo chmod +x /opt/node-service.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable node-service

# autostart 
sudo cp ./autostart/node-service.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/node-service.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/node-service.sh.desktop

sudo cp ./autostart/node-service.sh.desktop /home/user/.config/autostart/
sudo chown user /home/user/.config/autostart/node-service.sh.desktop
sudo chmod +x /home/user/.config/autostart/node-service.sh.desktop

sh /opt/node-service.sh &

echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable node-service"
echo "nano /opt/node-service.sh"