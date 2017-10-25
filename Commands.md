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


##loginas
Usage:
loginas kiosk


# Other
##login as new user
mate-session-save --logout-dialog

## start VNC session
start with 
x11vnc -display :0 -noxrecord -noxfixes -noxdamage -forever -passwd 123456

use realvnc viewer on osx