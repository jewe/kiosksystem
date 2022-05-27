# WIP

printf "\n------------\n"
echo "INSTALL PROCESSING 3.4"

export DISPLAY=:0.0

sudo wget https://github.com/processing/processing4/releases/download/processing-1283-4.0b8/processing-4.0b8-linux-x64.tgz
# sudo wget http://download.processing.org/processing-3.4-linux64.tgz
sudo tar -xzf processing-*-x64.tgz -C /opt/

sudo rm processing-*-x64.tgz

sudo sh /opt/processing-*/ install.sh

# sudo su -c "ln -s /opt/processing-*/processing /usr/local/bin/processing"

# sudo su -c "ln -s /opt/processing-*/processing-java /usr/local/bin/processing-java"

# # see http://www.artsnova.com/processing/installing-processing-ubuntu-linux-tutorial.html
# # and https://forum.processing.org/two/discussion/1523/shortcut-for-processing-in-ubuntu-13-10-and-unity

# sudo bash -c 'cat > /usr/share/applications/processing.desktop' << EOF
# [Desktop Entry]
# Version=2.1
# Name=Processing
# Comment=Processing 
# Exec=processing
# Icon=/opt/processing/lib/icons/pde-256.png
# Terminal=false
# Type=Application
# Categories=AudioVideo;Video;Graphics;
# EOF

# sudo bash -c 'cat > /usr/share/mime/packages/processing.xml' << EOF
# <?xml version="1.0" encoding="UTF-8"?>
# <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
# <mime-type type="text/x-processing">
# <comment>Proecssing PDE sketch file</comment>
# <sub-class-of type="text/x-csrc"/>
# <glob pattern="*.pde"/>
# </mime-type>
# </mime-info>
# EOF

# sudo update-mime-database /usr/share/mime

# sudo bash -c 'cat >> /usr/share/applications/defaults.list' << EOF
# text/x-processing=processing.desktop
# EOF

# start
sh /usr/local/bin/processing

echo "sh /usr/local/bin/processing"