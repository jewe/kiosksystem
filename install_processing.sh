# WIP

printf "\n------------\n"
echo "INSTALL PROCESSING 3.3.5"

export DISPLAY=:0.0


sudo wget http://download.processing.org/processing-3.3.5-linux64.tgz
sudo tar -xzf processing-3.3.5-linux64.tgz -C /opt/

sudo su -c "ln -s /opt/processing-3.3.5/processing /usr/local/bin/processing"

# see http://www.artsnova.com/processing/installing-processing-ubuntu-linux-tutorial.html
# and https://forum.processing.org/two/discussion/1523/shortcut-for-processing-in-ubuntu-13-10-and-unity

