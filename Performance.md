## Browser Graphics Benchmark
https://browserbench.org/MotionMark



*** Shuttle xh110g

i5-7500 3.4x4
Motionmark 1.0

Firefox + AMD W2100 without drivers + HD
160

Chromium + AMD W2100 without drivers + HD
308

Chromium + AMD W2100 without drivers + 1280x1024@60
435

--

Chromium + AMD W2100 WITH drivers + 1280x1024@60
433

--


Chromium + onBoard Gfx + 4Kx30fps
1 

Chromium + onBoard Gfx + 2560x1440x60fps
200 

Chromium + onBoard Gfx + HDx60fps
367








*** Zotac VdV

AMD Dual-Core Processor E-450
AMD Radeon HD 6320
Chromium HD maximized

7.1
8.85 / 8.19 (liquorix)







dpkg 
sudo apt install ampgpu-pro

That should be it, to check it installed
dpkg -l amdgpu-pro

To remove it
amdgpu-pro-uninstall







sudo cpupower frequency-set -g performance

Hyperthreading Manager
https://github.com/damentz/ht-manager


https://liquorix.net/
sudo add-apt-repository ppa:damentz/liquorix && sudo apt-get update
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64





https://askubuntu.com/questions/410860/how-to-permanently-set-cpu-power-management-to-the-powersave-governor