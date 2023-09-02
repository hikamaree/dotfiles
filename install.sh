#!/bin/sh

# copy config files
cp -rf config ~/.config
cp -rf local ~/.local
cp -rf mozilla ~/.mozilla

mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Pictures/screenshots

echo "Install laptop utilities (y/N): "
read LAPTOP

sudo ./system.sh $USER

sudo pacman --noconfirm -Syu

# hyprland
sudo pacman -S --noconfirm hyprland foot grim slurp waybar wl-clipboard swayimg fuzzel xdg-desktop-portal-wlr vulkan-radeon libva-mesa-driver

# laptop
if [[ $LAPTOP == 'y' || $LAPTOP == 'Y' ]]
then
    sudo pacman -S --noconfirm go-md2man
    git clone https://github.com/CameronNemo/brillo.git
    cd brillo
    sudo make install.setgid
    cd ..
    sudo pacman -Rns --noconfirm go-md2man
fi

# apps
sudo pacman -S --noconfirm zsh neovim htop lf ncmpcpp mpd mpv xournalpp firefox discord

chsh -s /bin/zsh

reboot
