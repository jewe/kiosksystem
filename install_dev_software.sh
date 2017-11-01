# KIOSK HELPER
printf "\n------------\n"
echo "INSTALL KIOSK HELPER"

sudo apt-get remove -y vim pluma

# atom editor
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt install atom


# cleanup
sudo apt-get clean
sudo apt-get -y autoremove
