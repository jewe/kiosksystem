# Serial Port

## search for usb device to find user group
ls -l /dev/tty*

(/dev/ttyUSB0)
add our user to the group

sudo usermod -a -G dialout $USER

sudo chmod a+rw /dev/ttyUSB0