# CPU performance

alias cpugetavail='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors'
alias cpushowcurrent='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpusethigh='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'





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



--- 10/2020 Ubuntu Mate 20.04

Shuttle xh110g AMD W2100 4K@60 fullscreen
Motionmark 1

=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   AMD OLAND (DRM 2.50.0, 5.4.0-48-generic, LLVM 10.0.0)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 20.0.8
=======================================================
                                  glmark2 Score: 164 
=======================================================







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


*** ZBOX-E MAGNUS ER51060-BE AMD Ryzen

Motionmark 4K@60 




*** Shuttle XPC slim Barebone DH02U5 Intel Core i5-7200U GTX 1050

Motionmark: Google Chrome 4k@60
250

bunny-mark: Google Chrome 4k@60 100.000
4.8.6: 19fps
5rc1: 16fps


=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     NVIDIA Corporation
    GL_RENDERER:   GeForce GTX 1050/PCIe/SSE2
    GL_VERSION:    4.6.0 NVIDIA 390.77
=======================================================
                                  glmark2 Score: 391 
=======================================================



*** Shuttle DS77 ***
(VKI GRH 2019)
i5-7200
HD Graphics 620
8GB

Motionmark 178 HD@60 Chromium

glmark2 --fullscreen
=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     Intel Open Source Technology Center
    GL_RENDERER:   Mesa DRI Intel(R) HD Graphics 620 (Kaby Lake GT2) 
    GL_VERSION:    3.0 Mesa 18.0.0-rc5
                                  glmark2 Score: 156 
=======================================================






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
glmark2 --fullscreen

# Pixijs Performance
https://pixijs.io/bunny-mark/


# enable hardware acc in chrome
chrome://gpu
chrome://flags


# Problems with vertical Stripes (tearing)
Open Nvidia X Server Settings GUI > X Server Display Configuration > choose ‘advanced’ > enable ‘Force Composition Pipeline’
(https://www.reddit.com/r/linuxquestions/comments/8fb9oj/how_to_fix_screen_tearing_ubuntu_1804_nvidia_390/)






https://askubuntu.com/questions/410860/how-to-permanently-set-cpu-power-management-to-the-powersave-governor




# zbox neues museum 2021
nvidia gtx 1060 3gb
glmark score 1677 4k@60





# shuttle 2021 gtx 1030
GeForce GT1030 2GB GDDR5
i5-7500
4GB RAM
SSD
4K@60fps
Chromium Fullscreen
motionmark score 470 4K@60 chromium



# ZBOX Magnus
ZBOX-ECM73070C/53060C
Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz

=======================================================
    glmark2 2021.02
=======================================================
    OpenGL Information
    GL_VENDOR:     NVIDIA Corporation
    GL_RENDERER:   NVIDIA GeForce RTX 3060/PCIe/SSE2
    GL_VERSION:    4.6.0 NVIDIA 470.74
=======================================================

Motionmark 621 HD@60 chromium




# Shuttle TUM Rechner 
with ChromeOS Flex 2022-07
Motionsmark 1.2
HD@60 without graphics card
666

4K@60
1

# Futuro
Celeron J4105 1.5GHz 4x
Mesa Intel UHD Graphics 600 GLK2
Motionmark 
Chrome 
HD@60 internal 
164 (1.0)
211 (1.2)


# Shuttle DS6012 (GSA)
i7 12700
Mesa UHD 770
Motionmark 1.3
Chromium HD@60
1386@60fps

glmark2 1056


# NSD 2025
Motionmark: 898
Chromium @4K fullscreen

Chrome 

glmark2 Score: 27




# ZOTAC ZBOX ERP74070C
Machine:
  Type: Desktop System: ZOTAC product: ZBOX-ERP74070C/ERP74070W/ERP54060C/ERP54060W v: XX
    serial: <superuser required>
  Mobo: N/A model: N/A serial: <superuser required> UEFI: American Megatrends LLC. v: 5.27
    date: 12/01/2023
CPU:
  Info: 16-core (8-mt/8-st) model: 13th Gen Intel Core i7-13700 bits: 64 type: MST AMCP cache:
    L2: 24 MiB
  Speed (MHz): avg: 992 min/max: 800/5100:5200:4100 cores: 1: 801 2: 800 3: 800 4: 800 5: 1035
    6: 800 7: 1372 8: 800 9: 1400 10: 800 11: 1753 12: 800 13: 800 14: 800 15: 1315 16: 800 17: 800
    18: 800 19: 800 20: 800 21: 1069 22: 1400 23: 1670 24: 800
Graphics:
  Device-1: Intel Raptor Lake-S GT1 [UHD Graphics 770] driver: i915 v: kernel
  Device-2: NVIDIA AD104 [GeForce RTX 4070] driver: nvidia v: 535.183.01
  Display: x11 server: X.org v: 1.21.1.11 driver: X: loaded: modesetting,nouveau
    unloaded: fbdev,vesa failed: nvidia dri: iris gpu: nvidia,nvidia-nvswitch tty: 163x26
    resolution: 1: 3840x2160
  API: EGL v: 1.5 drivers: iris,nvidia,swrast platforms: gbm,surfaceless,device
  API: OpenGL v: 4.6.0 compat-v: 4.5 vendor: mesa v: 24.2.8-1ubuntu1~24.04.1
    note: console (EGL sourced) renderer: Mesa Intel Graphics (RPL-S), NVIDIA GeForce RTX
    4070/PCIe/SSE2, llvmpipe (LLVM 19.1.1 256 bits)

## NVIDIA
Chromium
Motionmark: 2527  4K@60fps
GL_VENDOR:      NVIDIA Corporation
    GL_RENDERER:    NVIDIA GeForce RTX 4070/PCIe/SSE2
    GL_VERSION:     4.6.0 NVIDIA 535.183.01
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   3840x2160 fullscreen
glmark2 Score: 4453 

## Intel
Chromium
Motionmark: 1193
    OpenGL Information
    GL_VENDOR:      Intel
    GL_RENDERER:    Mesa Intel(R) Graphics (RPL-S)
    GL_VERSION:     4.6 (Compatibility Profile) Mesa 24.2.8-1ubuntu1~24.04.1
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   3840x2160 fullscreen

glmark2 Score: 215 


# NSD Lenovo 2025

## NVIDIA T1000
Motionmark:   3460x1080@30fps Chromium

## NVIDIA RTX 3060
Motionmark: 3882  3460x1080@60fps Chromium

glmark 2023