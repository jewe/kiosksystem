# Ubuntu Kiosksystem

## Installation
Download Ubuntu Mate
https://ubuntu-mate.org/download/#xenial
(16.04.2 LTS)


```
sudo cd /opt
sudo mkdir tmp
sudo chmod 0777 tmp/
cd tmp/
git clone https://github.com/jewe/kiosksystem.git
cd kiosksystem
sh setup_system.sh
sudo reboot
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
```
