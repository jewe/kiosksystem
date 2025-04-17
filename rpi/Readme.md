sudo nano /etc/xdg/autostart/myapp.desktop


sudo nano /etc/systemd/system/videokiosk.service

sudo systemctl enable videokiosk.service 
sudo systemctl start videokiosk.service
sudo journalctl -xfu videokiosk.service
sudo systemctl status videokiosk.service

https://www.raspberrypi.org/documentation/configuration/screensaver.md
sudo nano /boot/cmdline.txt

# WLAN
wpa_cli 

sudo iwconfig wlan0 txpower off
sudo ifconfig wlan0 down
sudo ifconfig wlan0 up

# set static ip for eth0
sudo nano /etc/dhcpcd.conf



# Shrink ISO image for smaler cards
pishrink
https://github.com/Drewsif/PiShrink 


# prevent from sleep
sudo raspi-config
> advanced

# overlay filesystem
sudo raspi-config
> advanced


# Disable screen blanking
To disable screen blanking, set consoleblank=0.
You can also use the raspi-config tool to disable screen blanking.


# Lightdm
cat /etc/lightdm/lightdm.conf


user@rpi-2024:~ $ xrandr
Screen 0: minimum 16 x 16, current 3000 x 1080, maximum 32767 x 32767
XWAYLAND0 connected 1080x1080+1920+0 (normal left inverted right x axis y axis) 480mm x 270mm
   1080x1080     59.91*+