printf "\n------------\n"
echo "INSTALL GOOGLE CHROME"

# google chrome (currently 59.0)
# TODO kiosk need write permission
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb


# first run to configure
echo "ween gleich chrome aufgeht, konfigurieren / alle haken entfernen und wieder schliessen (druecke enter)"
read X
google-chrome
