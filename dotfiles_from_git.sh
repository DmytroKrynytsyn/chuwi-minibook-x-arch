rm -r /home/dmytro/.config/hypr/
rm -r /home/dmytro/.config/waybar/
rm -r /home/dmytro/.config/kitty/ 
rm -r /home/dmytro/.config/nvim/ 
rm -r /home/dmytro/.config/snappy-switcher/ 
rm -r /home/dmytro/.config/VSCodium/ 
rm /etc/keyd/default.conf
cp -r ./dotfiles/config/hypr/ /home/dmytro/.config/
cp -r ./dotfiles/config/waybar/  /home/dmytro/.config/
cp -r ./dotfiles/config/kitty/  /home/dmytro/.config/
cp -r ./dotfiles/config/nvim/ /home/dmytro/.config/
cp -r ./dotfiles/config/snappy-switcher/ /home/dmytro/.config/
cp -r ./dotfiles/config/VSCodium/ /home/dmytro/.config/
cp ./dotfiles/etc/keyd/default.conf /etc/keyd/default.conf
cp ./dotfiles/etc/udev/hwdb.d/99-touchpad-fuzz.hwdb /etc/udev/hwdb.d/99-touchpad-fuzz.hwdb
chown -R dmytro:dmytro /home/dmytro/.config/
chown dmytro:dmytro /etc/keyd/default.conf
hyprctl reload
keyd reload
systemd-hwdb update
udevadm trigger