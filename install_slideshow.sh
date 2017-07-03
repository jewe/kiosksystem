printf "\n------------\n"
echo "INSTALL GTHUMB SLIDESHOW"

export DISPLAY=:0.0

# slideshow / image viewer
sudo apt-get install -y gthumb 
# config fade in Preferences - Viewer
#    - Slideshow Transition Effect - Fade in
#    - Restart wenn finished
# copy start-script

# copy start-script
sudo cp ./opt/slideshow.sh /opt/
sudo chmod +x /opt/slideshow.sh

. /opt/tmp/kiosksystem/opt/global_functions
kioskctl enable slideshow

# autostart 
sudo cp ./autostart/slideshow.sh.desktop /home/kiosk/.config/autostart/
sudo chown kiosk /home/kiosk/.config/autostart/slideshow.sh.desktop
sudo chmod +x /home/kiosk/.config/autostart/slideshow.sh.desktop

# sample images
sudo cp -R sample_Images/* /home/kiosk/Pictures/

