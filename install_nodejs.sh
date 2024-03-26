# NODEJS
printf "\n------------\n"
echo "INSTALL NODE JS"

cd ~

curl -sL https://deb.nodesource.com/setup_21.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install -y nodejs
node -v

# https://github.com/tj/n
curl -L https://bit.ly/n-install | bash
