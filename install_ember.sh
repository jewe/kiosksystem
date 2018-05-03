printf "\n------------\n"
echo "INSTALL EMBER"

export DISPLAY=:0.0

sudo apt -y install nodejs
sudo apt -y install npm

# FIXME
sudo chmod 0777 node_modules/

# https://ember-cli.com/user-guide/
node -v
npm -v

sudo npm install -g ember-cli
sudo npm install -g bower

# watchman
git clone https://github.com/facebook/watchman.git
cd watchman
git checkout v4.9.0  # the latest stable release
./autogen.sh
./configure
make
sudo make install

sudo npm install -g phantomjs-prebuilt



# nginx
sudo apt install -y nginx

# cleanup
sudo apt-get clean
sudo apt -y autoremove

echo "Installation complete"