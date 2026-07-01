# Arch Linux config for Chuwi MiniBook X

## Connect wifi

[iwd]# device lis
[iwd]# station wlan0 scan
[iwd]# station wlan0 get-networks
[iwd]# station wlan0 connect "SSID-Name"
[iwd]# exit

or

iwctl --passphrase "your-password" station wlan0 connect "SSID-Name"
iwctl station wlan0 show

## Problem
Chuwi MiniBook X has a physically rotated screen (DSI-1, 1200x1920).
This repo contains fixes applied during/after Arch Linux manual installation.

## Screen rotation fix

### During boot (GRUB)
At GRUB menu press `e`, find the linux line, add at the end:
fbcon=rotate:1

Press Enter to boot.

### Permanent fix (after install)
See `/etc/default/grub` — add `fbcon=rotate:1` to `GRUB_CMDLINE_LINUX_DEFAULT`.

GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet fbcon=rotate:1"
GRUB_TIMEOUT=2
Then run:
grub-mkconfig -o /boot/grub/grub.cfg

or
sudo nano /etc/kernel/cmdline
sudo mkinitcpio -P

### After suspend/resume fix
GNOME loses rotation after lid close/open.
Two systemd services fix this automatically — one per user.

#### Install
```bash
cp scripts/fix-rotation.py /usr/local/bin/fix-rotation.py
chmod +x /usr/local/bin/fix-rotation.py
cp services/fix-rotation.service /etc/systemd/system/
cp services/fix-rotation-dmytro.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable fix-rotation.service
systemctl enable fix-rotation-dmytro.service
```

## Display info
- Connector: DSI-1
- Resolution: 1200x1920
- Refresh: 50.002hz
- Scale: 1.6666
- Rotation: right (uint32 3)

In ~/.config/hypr/hyprland.conf:
monitor=DSI-1,1200x1920@50,0x0,1.666667,transform,3

pacman -S seatd
pacman -S networkmanager iwd
/etc/NetworkManager/conf.d/wifi_backend.conf:
[device]
wifi.backend=iwd

systemctl enable --now iwd
systemctl enable --now NetworkManager



### pacstrap
pacstrap -K /mnt \
  base base-devel \
  linux linux-firmware \
  nano nvim \
  networkmanager \
  grub efibootmgr \
  sof-firmware \
  wayland \
  xorg-xwayland \
  mesa \
  intel-media-driver \
  vulkan-intel \
  pipewire pipewire-pulse pipewire-alsa wireplumber \
  iwd \
  sudo \
  git \
  python-dbus \
  hyprlaucnher \
  ttf-nerd-fonts-symbols \
  ttf-jetbrains-mono-nerd \
  brightnessctl
  

### extra
paru (via binaries)
