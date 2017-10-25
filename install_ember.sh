printf "\n------------\n"
echo "INSTALL GOOGLE CHROME"

export DISPLAY=:0.0


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

npm install -g phantomjs-prebuilt



# nginx
sudo apt-get install -y nginx

# cleanup
sudo apt-get clean
sudo apt-get -y autoremove

echo "Installation complete"