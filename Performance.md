## Browser Graphics Benchmark
https://browserbench.org/MotionMark



*** Shuttle xh110g

i5-7500 3.4x4
Motionmark 1.0

Firefox + AMD W2100 without drivers + HD
Motionmark: 160

Chromium + AMD W2100 without drivers + HD
Motionmark: 308

Chromium + AMD W2100 without drivers + 1280x1024@60
Motionmark: 435

--

Chromium + AMD W2100 WITH drivers + 1280x1024@60
Motionmark: 433

--


Chromium + onBoard Gfx + 4Kx30fps
Motionmark: 1 

Chromium + onBoard Gfx + 2560x1440x60fps
Motionmark: 200 

Chromium + onBoard Gfx + HDx60fps
Motionmark: 367

--- 12/2018

Chrome + AMD W2100 with drivers amdgpu-pro-18.30-674411-ubuntu-18.04 + 4K@60
Motionmark: 410

--- 12/2018

Chrome (all gpu-flags enabled) + AMD W2100 with drivers amdgpu-pro-18.30-674411-ubuntu-18.04 + 4K@60
Motionmark: 515
 


glmark2 --fullscreen #4K@60
=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   AMD FirePro W2100 (OLAND, DRM 3.26.0 AMD 18.30 , 4.15.0-42-generic, LLVM 6.0.1)
    GL_VERSION:    3.1 Mesa 18.1.0-rc4
=======================================================
                                  glmark2 Score: 83     
=======================================================


--- 12/2018
Shuttle xh110g onboard 4K@60 fullscreen
=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     Intel Open Source Technology Center
    GL_RENDERER:   Mesa DRI Intel(R) HD Graphics 630 (Kaby Lake GT2) 
    GL_VERSION:    3.0 Mesa 18.0.0-rc5
=======================================================
                                  glmark2 Score: 53 
=======================================================

Motionmark: 1

--- 12/2018
Shuttle xh110g Geforce GTX 1050 4K@60 fullscreen
glmark2 --fullscreen

=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     NVIDIA Corporation
    GL_RENDERER:   GeForce GTX 1050/PCIe/SSE2
    GL_VERSION:    4.6.0 NVIDIA 390.77
=======================================================
                                  glmark2 Score: 431 
=======================================================

Google Chrome 70
Motionmark: 546

Chromium 70
Motionmark: 570

*** Zotac VdV

AMD Dual-Core Processor E-450
AMD Radeon HD 6320
Chromium HD maximized

7.1
8.85 / 8.19 (liquorix)




*** Schiller Touchscreen 
1280x1024@60
Celeron CPU J1900 4x 1.99GHz
18.04 LTS

53 (liquorix)




*** Asus Vivo Mini UN45-VM014M C-N3000/HDGraphics/HDMI
1920x1080@60
Celeron N3000 @ 1.04GHz
Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller
18.04 LTS

Chrome

16-20









dpkg 
sudo apt install ampgpu-pro

That should be it, to check it installed
dpkg -l amdgpu-pro

To remove it
amdgpu-pro-uninstall

# gpu infos
sudo lshw

# opengl info
glxinfo

lspci -k | grep -EA3 'VGA|Display'



sudo cpupower frequency-set -g performance

Hyperthreading Manager
https://github.com/damentz/ht-manager


https://liquorix.net/
sudo add-apt-repository ppa:damentz/liquorix && sudo apt-get update
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64

# benchmark test

sudo apt install glmark2

# enable hardware acc in chrome
chrome://gpu
chrome://flags


https://askubuntu.com/questions/410860/how-to-permanently-set-cpu-power-management-to-the-powersave-governor