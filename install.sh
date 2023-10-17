#!/bin/sh

# copy config files
mv ~/.config ~/.old_config
cp -rf config ~/.config
mv ~/.local ~/.old_local
cp -rf local ~/.local

mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Pictures/screenshots

# system setting
sudo ./system.sh $USER
sudo pacman --noconfirm -Syu

# hyprland
sudo pacman -S --noconfirm hyprland grim slurp wl-clipboard xdg-utils xdg-user-dirs xdg-desktop-portal-gtk xdg-desktop-portal-wlr vulkan-radeon libva-mesa-driver

# apps
sudo pacman -S --noconfirm zsh foot neovim htop lf zip unzip rustup waybar swaybg swayimg ncmpcpp mpd mpc mpv fuzzel flatpak

# flatpaks
sudo flatpak override --filesystem=xdg-data/themes
sudo flatpak override --env=GTK_THEME=Tokyonight

# firefox
mkdir -p ~/.var/app/org.mozilla.firefox/
cp -rf mozilla ~/.var/app/org.mozilla.firefox/.mozilla

sudo systemctl enable seatd.service
sudo systemctl mask backlight@.service
sudo systemctl mask --global at-spi-dbus-bus.service

# shell
chsh -s /bin/zsh

reboot
