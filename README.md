# Ubuntu Kiosksystem
(for 16.04.2LTS Version see branch)

## Installation
Download Ubuntu MATE 18.04 LTS (Bionic)
http://cdimage.ubuntu.com/ubuntu-mate/releases/18.04/release/ubuntu-mate-18.04-desktop-amd64.iso

Minimal Installation
+Extras


Kiosk-System: 
```
sudo apt-get install -y openssh-server
```

Dev-System: 
```
ssh-copy-id -i ~/.ssh/id_rsa.pub user@IP
ssh user@IP
```



```
sudo apt install -y git
cd /opt
sudo mkdir tmp
sudo chmod 0777 tmp/
cd tmp/
git clone https://github.com/jewe/kiosksystem.git
cd kiosksystem
sh setup_system.sh
# sudo reboot
```

After Reboot login as kiosk@ip and:
```
cd /opt/tmp/kiosksystem/
sh setup_kiosk_user.sh
sh install_kiosk_software.sh
```

optional:

install developer tools (atom-editor ...)
```
sh install_dev_software.sh
```

install applications:
```
cd /opt/tmp/kiosksystem/
sh install_chromium-browser.sh
sh install_slideshow.sh

# mount ro etc.
sh lockdown.sh
```

## Slideshow

add images to
```
/home/kiosk/Pictures
```

config autostart-script:
```
sudo nano /opt/slideshow.sh
```

enable autostart (as user)
```
kioskctl enable slideshow
```

disable autostart (as user)
```
kioskctl disable slideshow
```


## Multiple Screens
compizconfig-settings-manager package needed
Control Center: Look and Feel: CompizConfig Settings Manager: General Options: Display Settings:
-> uncheck "Detect outputs"
-> remove all settings in "Outputs"
xrandr --output HDMI -pos 100x0


