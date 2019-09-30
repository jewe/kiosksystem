
### 1. SSH-Reverse Tunnel to public accessible PC 
// execute on exhibit pc
// tunnel local 22 to remote 63001
ssh -R 63001:localhost:22 -p 63111 pi@wecld.zapto.org


### 2. SSH connection to the public accessible PC
// execute on control pc
// connect to 63001 -> 22 on exhibit
ssh -p 63001 jensweber@wecld.zapto.org


### on pi:
sudo nano /etc/ssh/sshd_config
GatewayPorts yes