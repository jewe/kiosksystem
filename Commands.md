## kioskctl
Enable/disable autostart for service/application
Status is saved in /opt/kiosk/services/

Usage: 
kioskctl enable chromium-browser


## kioskstatus
prints information about services and logs

Usage:
kioskstatus


## kioskmount ro|rw
mount ssd read-only or read-write

Usage:
kioskmount ro|rw


## kiosktest
prints debug infos about screensaver status etc.

Usage:
kiosktest


## kiosklogsclear
remove all logs in /opt/kiosk/logs


## kioskdir


## kioskhelp


## logout
logout and login as other user


## autologinas
Usage:
loginas kiosk

## startvnc
Password: 123456



# Other
##login as new user
mate-session-save --logout-dialog

## start VNC session
start with 
x11vnc -display :0 -noxrecord -noxfixes -noxdamage -forever -passwd 123456

use realvnc viewer on osx


## Multitouch
check if kernel module hid-multitouch loaded
modprobe hid-multitouch

get vendor:
lsusb

see 
    https://wiki.archlinux.org/index.php/Multitouch_displays
    https://www.chalk-elec.com/?p=2028
    https://wiki.ubuntuusers.de/Kernelmodule/

/sys/module/hid_multitouch/drivers/hid\:hid-multitouch

use uname -a to determine your kernel version number. 


# change user in terminal
su - user

# Detect platform
uname -a
Linux user-nano 4.15.0-23-generic #25-Ubuntu SMP Wed May 23 18:02:16 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

# Detect graphic
sudo lshw -c display


