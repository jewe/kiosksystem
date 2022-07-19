# KIOSK HELPER
printf "\n------------\n"
echo "INSTALL KIOSK HELPER"

# sudo apt-get remove -y pluma

# atom editor
# sudo add-apt-repository -y ppa:webupd8team/atom
# sudo apt-get update
# sudo apt install -y atom

# gedit
sudo apt-get -y install gedit 

# configure caja
#dconf write /org/mate/caja/


# add some caja bookmarks
sudo bash -c 'cat > /home/user/.gtk-bookmarks' << EOF
file:///opt/
file:///opt/tmp/kiosksystem
file:///opt/kiosk
file:///var/www/html/
EOF

# cleanup
sudo apt-get clean
sudo apt-get -y autoremove
