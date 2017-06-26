
# UPDATE ALL PACKAGES
sudo apt-get update
# sudo apt-get dist-upgrade

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

# SYSTEM CONFIG
## check/update with: 
## gsettings list-recursively org.mate.background

# disable lock screen
gsettings set org.gnome.desktop.screensaver lock-enabled false 
gsettings set org.mate.lockdown disable-lock-screen true
gsettings set org.mate.screensaver lock-enabled false

# set background
export DISPLAY=:0.0
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

# hide top panel (not working)
dconf write /org/mate/panel/toplevels/top/auto-hide true

# hide bottom panel (ok)
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

# remove unused locals
sudo apt-get install localepurge

# INSTALL SOFTWARE

# hide mouse
sudo apt-get install -y unclutter


sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt-get install -y build-essential
sudo apt-get install -y dropbear
sudo apt-get install -y openssh-sftp-server
sudo apt-get install -y zram-config
sudo apt-get install -y nano
#sudo apt-get install -y 
#sudo apt-get install -y 

# chromium browser
sudo apt-get install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
# or https://www.google.com/chrome/browser/desktop/

# nodejs
# currently v4.2.6
sudo apt-get install nodejs-legacy
# currently 3.5.2
sudo apt-get install npm
# node manager
sudo npm install -g n
# install currently 8.1.2
sudo n latest



# platz machen
sudo apt-get clean
sudo apt-get autoremove
