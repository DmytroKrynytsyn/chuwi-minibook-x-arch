rm -rf ./dotfiles/config/*
cp -r ~/.config/hypr ./dotfiles/config
cp -r ~/.config/waybar ./dotfiles/config
cp -r ~/.config/kitty ./dotfiles/config
cp -r ~/.config/nvim ./dotfiles/config
cp -r ~/.config/snappy-switcher ./dotfiles/config
mkdir ./dotfiles/config/VSCodium
mkdir ./dotfiles/config/VSCodium/User
cp ~/.config/VSCodium/User/* ./dotfiles/config/VSCodium/User
cp /etc/keyd/default.conf ./dotfiles/etc/keyd
mkdir -p ./dotfiles/etc/udev/hwdb.d
cp /etc/udev/hwdb.d/99-touchpad-fuzz.hwdb ./dotfiles/etc/udev/hwdb.d