
# UNINSTALL unneeded applications
## check/update with
## apt list --installed
sudo apt-get remove -y firefox
sudo apt-get remove -y rhythmbox
sudo apt-get remove -y samba-common
sudo apt-get remove -y seahorse
sudo apt-get remove -y thunderbird
sudo apt-get remove -y ubuntu-mate-libreoffice-draw-icons
sudo apt-get remove -y libreoffice-core
sudo apt-get remove -y hexchat
sudo apt-get remove -y simple-scan
sudo apt-get remove -y pidgin
sudo apt-get remove -y transmission
sudo apt-get remove -y brasero
sudo apt-get remove -y cheese
sudo apt-get remove -y rhythmbox

# remove unused locals
export DISPLAY=:0.0
sudo apt-get install localepurge


# UPDATE ALL PACKAGES
sudo apt-get update
# sudo apt-get dist-upgrade


# SYSTEM CONFIG
export DISPLAY=:0.0

## check/update with: 
## gsettings list-recursively org.mate.background

# disable lock screen 
gsettings set org.mate.lockdown disable-lock-screen true

# screensaver
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.mate.screensaver lock-enabled false

# set background
gsettings set org.mate.background primary-color '#555555'
gsettings set org.mate.background secondary-color '#444444'
gsettings set org.mate.background picture-opacity 0
gsettings set org.mate.background show-desktop-icons false

# what's the difference?
# org.gnome.desktop.background picture-opacity 0


# disable notifications
gsettings set com.ubuntu.update-notifier no-show-notifications true

# disable display going to sleep
gsettings set org.mate.power-manager sleep-display-ac 0
gsettings set org.mate.power-manager sleep-display-battery 0
gsettings set org.mate.power-manager sleep-display-ups 0
# display: disable dim
gsettings set org.mate.power-manager kbd-brightness-dim-by-on-idle 100

# hide top panel (needs reboot)
dconf write /org/mate/panel/toplevels/top/auto-hide true

# hide bottom panel
dconf write /org/mate/panel/toplevels/bottom/auto-hide true

# config all elements 
# dconf write /org/mate/panel/general/object-id-list [...]

# check this:
#org.mate.NotificationDaemon popup-location 'top_right'
#org.mate.gnome-main-menu.lock-down
#org.gnome.settings-daemon.plugins.power

#org.mate.panel.menubar icon-name 'start-here'
#org.mate.panel.menubar show-icon true
#org.mate.panel.menubar show-places true
#org.mate.panel.menubar show-desktop true
#org.mate.panel.menubar show-applications true


#org.gnome.desktop.lockdown disable-command-line false
#org.gnome.desktop.lockdown disable-application-handlers false
#org.gnome.desktop.lockdown disable-user-switching false
#org.gnome.desktop.lockdown user-administration-disabled false
#org.gnome.desktop.lockdown disable-printing false
#org.gnome.desktop.lockdown disable-log-out false
#org.gnome.desktop.lockdown disable-lock-screen false
#org.gnome.desktop.lockdown disable-print-setup false
#org.gnome.desktop.lockdown disable-save-to-disk false


# check and remove unneeded services
# systemctl list-units


# readonly filesystem


# create kiosk user
sudo adduser kiosk
# autologin


# platz machen
sudo apt-get clean
sudo apt-get autoremove
