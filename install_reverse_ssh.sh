printf "\n------------\n"
echo "INSTALL reverse ssh service"

export DISPLAY=:0.0
sudo apt-get -y install autossh

# copy start-script
sudo cp ./opt/reverse-ssh.sh /opt/
sudo chmod +x /opt/reverse-ssh.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable reverse-ssh

# autostart 
sudo cp ./autostart/reverse-ssh.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/reverse-ssh.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/reverse-ssh.sh.desktop

sudo cp ./autostart/reverse-ssh.sh.desktop /home/user/.config/autostart/
sudo chown user /home/user/.config/autostart/reverse-ssh.sh.desktop
sudo chmod +x /home/user/.config/autostart/reverse-ssh.sh.desktop

kioskdir

sudo mkdir /opt/logs/
sudo chmod 0777 /opt/logs/

echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable reverse-ssh"
echo "configure reverse-ssh in /opt/reverse-ssh.sh"