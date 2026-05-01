# Arch Linux config for Chuwi MiniBook X

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
GRUB_TIMEOUT=0

Then run:

grub-mkconfig -o /boot/grub/grub.cfg

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



### pacstrap
pacstrap -K /mnt \
  base base-devel \
  linux linux-firmware \
  nano vim \
  networkmanager \
  grub efibootmgr \
  sof-firmware \
  gnome \
  gnome-tweaks \
  wayland \
  xorg-xwayland \
  mesa \
  intel-media-driver \
  vulkan-intel \
  pipewire pipewire-pulse pipewire-alsa wireplumber \
  iwd \
  sudo \
  git \
  python-dbus