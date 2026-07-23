mkdir -p /home/dmytro/.config
mkdir -p /home/dmytro/.local/bin
mkdir -p /etc/keyd
mkdir -p /etc/udev/hwdb.d
rm -rf /home/dmytro/.config/hypr/
rm -rf /home/dmytro/.config/waybar/
rm -rf /home/dmytro/.config/kitty/ 
rm -rf /home/dmytro/.config/nvim/ 
rm -rf /home/dmytro/.config/snappy-switcher/
rm -rf /home/dmytro/.config/fontconfig/
rm -rf /home/dmytro/.config/VSCodium/
rm -f /etc/keyd/default.conf
rm -f /home/dmytro/.local/bin/inputtoggle
cp -r ./dotfiles/config/hypr/ /home/dmytro/.config/
cp -r ./dotfiles/config/waybar/  /home/dmytro/.config/
cp -r ./dotfiles/config/kitty/  /home/dmytro/.config/
cp -r ./dotfiles/config/nvim/ /home/dmytro/.config/
cp -r ./dotfiles/config/snappy-switcher/ /home/dmytro/.config/
cp -r ./dotfiles/config/fontconfig/ /home/dmytro/.config/
cp -r ./dotfiles/config/VSCodium/ /home/dmytro/.config/
cp ./dotfiles/etc/keyd/default.conf /etc/keyd/default.conf
cp ./dotfiles/etc/udev/hwdb.d/99-touchpad-fuzz.hwdb /etc/udev/hwdb.d/99-touchpad-fuzz.hwdb
cp ./dotfiles/local/bin/inputtoggle /home/dmytro/.local/bin/inputtoggle
chmod +x /home/dmytro/.local/bin/inputtoggle
chown -R dmytro:dmytro /home/dmytro/.config/
chown dmytro:dmytro /home/dmytro/.local/bin/inputtoggle
chown dmytro:dmytro /etc/keyd/default.conf
hyprctl reload
keyd reload
systemd-hwdb update
udevadm trigger