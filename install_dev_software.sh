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

# nodejs
sudo apt  install curl
cd ~
# curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
# sudo bash nodesource_setup.sh
# sudo apt install nodejs


# or nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v16.14.0


node -v
sudo apt install npm



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
