rm -rf ./dotfiles/config/*
cp -r ~/.config/hypr ./dotfiles/config
cp -r ~/.config/waybar ./dotfiles/config
cp -r ~/.config/kitty ./dotfiles/config
cp -r ~/.config/nvim ./dotfiles/config
cp -r ~/.config/snappy-switcher ./dotfiles/config
cp -r ~/.config/fontconfig ./dotfiles/config

mkdir ./dotfiles/config/VSCodium
mkdir ./dotfiles/config/VSCodium/User
cp ~/.config/VSCodium/User/keybindings.json ./dotfiles/config/VSCodium/User
cp ~/.config/VSCodium/User/settings.json ./dotfiles/config/VSCodium/User

rm -rf ./dotfiles/etc/*
mkdir ./dotfiles/etc/keyd
cp /etc/keyd/default.conf ./dotfiles/etc/keyd

mkdir -p ./dotfiles/etc/udev
mkdir -p ./dotfiles/etc/udev/hwdb.d
cp /etc/udev/hwdb.d/99-touchpad-fuzz.hwdb ./dotfiles/etc/udev/hwdb.d

rm -rf ./dotfiles/local/*
mkdir -p ./dotfiles/local/bin
cp ~/.local/bin/* ./dotfiles/local/bin

mkdir -p ./dotfiles/home
cp ~/.gitconfig ./dotfiles/home