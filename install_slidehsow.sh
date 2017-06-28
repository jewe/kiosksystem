printf "\n------------\n"
echo "INSTALL GTHUMB SLIDESHOW"

export DISPLAY=:0.0

# slideshow / image viewer
sudo apt-get install -y gthumb 
# config fade in Preferences - Viewer
#    - Slideshow Transition Effect - Fade in
#    - Restart wenn finished
# copy start-script
sudo cp ./opt/slideshow.sh /opt/
sudo chmod +x /opt/slideshow.sh
sudo cp -R sample_Images/* /home/kiosk/Pictures/

