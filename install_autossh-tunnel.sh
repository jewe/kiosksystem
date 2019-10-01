printf "\n------------\n"
echo "INSTALL reverse ssh service"

export DISPLAY=:0.0
sudo apt-get -y install autossh

sudo cp services/autossh-tunnel.service /etc/systemd/system/autossh-tunnel.service 
sudo systemctl daemon-reload
sudo systemctl start autossh-tunnel.service
sudo systemctl enable autossh-tunnel.service

kioskdir

echo "Installation complete"
echo "Service enabled - disable with:"
echo "sudo systemctl disable autossh-tunnel.service"
echo "sudo systemctl status autossh-tunnel"
echo "---"
echo 'autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 63001:localhost:22 -p 63111 pi@wecld.zapto.org'