printf "\n------------\n"
echo "INSTALL CUSTOM APP STARTER"

export DISPLAY=:0.0

# copy start-script
sudo cp ./opt/app.sh /opt/
sudo chmod +x /opt/app.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable app

# autostart kiosk
sudo mkdir -p /home/kiosk/.config/autostart/
sudo cp ./autostart/app.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/app.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/app.sh.desktop

# autostart user
sudo mkdir -p /home/user/.config/autostart/
sudo cp ./autostart/app.sh.desktop /home/user/.config/autostart/
sudo chown user /home/user/.config/autostart/app.sh.desktop
sudo chmod +x /home/user/.config/autostart/app.sh.desktop

echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable app"
echo "config /opt/app.sh"