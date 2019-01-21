# WIP

printf "\n------------\n"
echo "INSTALL ARDUINO 1.8.8"

export DISPLAY=:0.0


sudo wget https://www.arduino.cc/download_handler.php?f=/arduino-1.8.8-linux64.tar.xz
sudo tar -xzf arduino* -C /opt/
sudo rm arduino*.tgz
cd /opt/arduino*
sh ./install.sh

# access to usb-ports
sudo usermod -a -G dialout user

# start
sh /usr/local/bin/arduino
