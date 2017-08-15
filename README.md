# Ubuntu Kiosksystem

## Installation
Download Ubuntu Mate
https://ubuntu-mate.org/download/#xenial
(16.04.2 LTS)


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


