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

sudo pacman --noconfirm -Syu

# hyprland
sudo pacman -S --noconfirm hyprland grim slurp wl-clipboard xdg-utils xdg-desktop-portal-gtk vulkan-radeon libva-mesa-driver

# apps
sudo pacman -S --noconfirm zsh foot neovim btop lf zip unzip rustup waybar swaybg swayimg ncmpcpp mpd mpc mpv fuzzel flatpak

# flatpaks
flatpak install --noninteractive org.mozilla.firefox
flatpak install --noninteractive com.discordapp.Discord
flatpak install --noninteractive com.mojang.Minecraft
flatpak install --noninteractive org.winehq.Wine
flatpak install --noninteractive com.github.xournalpp.xournalpp

sudo flatpak override --filesystem=xdg-data/themes

# firefox
mkdir -p ~/.var/app/org.mozilla.firefox/
cp -rf mozilla ~/.var/app/org.mozilla.firefox/.mozilla

# system setting
sudo ./system.sh $USER

# shell
chsh -s /bin/zsh

reboot
