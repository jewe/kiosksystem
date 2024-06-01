#!/bin/bash

sudo apt install unclutter
sudo apt install wmctrl # multiple screens

# install videokiosk.service
cd /opt/ksw_bm_2020_scripts
sudo cp -n chromium.service /etc/systemd/system/videokiosk.service || true
sudo systemctl enable videokiosk.service
sudo systemctl start videokiosk.service

echo "\n"
echo "videokiosk.service enabled"
echo "sudo systemctl start videokiosk.service"
echo "\n"

# install screen.service
sudo cp -n screen.service /etc/systemd/system/screen.service || true
sudo systemctl enable screen.service
sudo systemctl start screen.service

echo "\n"
echo "screen.service enabled"
echo "sudo systemctl start screen.service"
echo "\n"



# sudo mkdir -p /opt/logs
# sudo chmod 0777 /opt/logs/
sudo mkdir -p /opt/video
sudo chmod 0777 /opt/video/


echo "\n"