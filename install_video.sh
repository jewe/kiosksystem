printf "\n------------\n"
echo "INSTALL VLC Video"

export DISPLAY=:0.0


# copy start-script
sudo cp ./opt/video.sh /opt/
sudo chmod +x /opt/video.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable video

# autostart 
sudo cp ./autostart/video.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/video.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/video.sh.desktop

# sample images
sudo cp -R sample_Images/*.mov /home/kiosk/Pictures/

# start to configure
vlc &

echo "Installation complete"
echo "Service enabled - disable with:"
echo "kioskctl disable video"
echo "configure video in /opt/video.sh"