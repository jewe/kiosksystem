printf "\n------------\n"
echo "INSTALL universal monitoring service"

export DISPLAY=:0.0


# copy start-script
sudo cp ./opt/monitoring.sh /opt/
sudo chmod +x /opt/monitoring.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable monitoring

# autostart 
sudo cp ./autostart/monitoring.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/monitoring.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/monitoring.sh.desktop

sudo cp ./autostart/monitoring.sh.desktop /home/user/.config/autostart/
sudo chown user /home/user/.config/autostart/monitoring.sh.desktop
sudo chmod +x /home/user/.config/autostart/monitoring.sh.desktop

kioskdir



echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable monitoring"
echo "configure monitoring in /opt/monitoring.sh"