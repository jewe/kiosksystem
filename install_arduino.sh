# WIP

printf "\n------------\n"
echo "INSTALL ARDUINO 1.8.8"

export DISPLAY=:0.0


sudo wget https://downloads.arduino.cc/arduino-1.8.8-linux64.tar.xz
sudo tar -xf arduino* -C /opt/
sudo rm arduino*.tar.xz
cd /opt/arduino*
sh ./install.sh

# access to usb-ports
sudo usermod -a -G dialout user

# start
sh /usr/local/bin/arduino
