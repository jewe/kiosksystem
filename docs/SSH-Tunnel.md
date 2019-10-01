
### 1. SSH-Reverse Tunnel to public accessible PC 
// execute on exhibit pc
// tunnel local 22 to remote 63001
ssh -R 63001:localhost:22 -p 63111 pi@wecld.zapto.org


### 2. SSH connection to the public accessible PC
// execute on control pc
// connect to 63001 -> 22 on exhibit
ssh -p 63001 user@wecld.zapto.org


### test on pi if connected
ssh -p 63111 pi@wecld.zapto.org
grep sshd /var/log/auth.log
// search for 
// Oct  1 09:42:38 homepi sshd[20976]: Accepted publickey for pi from 91.137.21.0 port 43830 ssh2: RSA a3:d9:b0:16:e9:0f:c9:73:c3:89:ab:51:57:d1:a5:27

### on pi:
sudo nano /etc/ssh/sshd_config
GatewayPorts yes






autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 63001:localhost:22 -p 63111 pi@wecld.zapto.org