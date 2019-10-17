printf "\n------------\n"
echo "INSTALL Flashplayer"

export DISPLAY=:0.0



# copy start-script
sudo cp ./opt/flash.sh /opt/
sudo chmod +x /opt/flash.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable flash

# autostart 
sudo cp ./autostart/flash.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/flash.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/flash.sh.desktop



# install flashplayer
cd /home/kiosk/

wget https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux64/flash_player_sa_linux.x86_64.tar.gz
# old: https://fpdownload.macromedia.com/pub/flashplayer/updaters/27/flash_player_sa_linux.x86_64.tar.gz -O flash_player_sa_linux.x86_64.tar.gz
tar xvzf flash_player_sa_linux.x86_64.tar.gz
rm flash_player_sa_linux.x86_64.tar.gz

cd ~/.local/share/applications
echo "[Desktop Entry]" >> flashplayer.desktop
echo "Encoding=UTF-8" >> flashplayer.desktop
echo "Version=1.0" >> flashplayer.desktop
echo "Type=Application" >> flashplayer.desktop
echo "Exec=/home/ubuntu/executable/flashplayer %f" >> flashplayer.desktop
echo "Name=flashplayer" >> flashplayer.desktop
echo "Comment=Custom definition for flashplayer" >> flashplayer.desktop
echo "NoDisplay=true" >> flashplayer.desktop


echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable flash"
echo "configure flash in /opt/flash.sh"