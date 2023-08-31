#!/bin/sh

# copy config files
mv ~/.config ~/old_config
cp -r config ~/.config
mv ~/.local ~/.old_local
cp -r local ~/.local
mv ~/.librewolf ~/.old_librewolf
cp -r librewolf ~/.librewolf

mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Pictures/screenshots

echo "Install laptop utilities (y/N): "
read LAPTOP

sudo ./system.sh $USER

# AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd ..

yay --noconfirm -Syu

# hyprland
yay -S --noconfirm hyprland foot grim slurp waybar wl-clipboard swayimg fuzzel xdg-desktop-portal-gtk

# laptop
if [[ $LAPTOP == 'y' || $LAPTOP == 'Y' ]]
then
    yay -S --noconfirm go-md2man
    git clone https://github.com/CameronNemo/brillo.git
    cd brillo
    sudo make install.setgid
    cd ..
    yay -Rns --noconfirm go-md2man
fi

# apps
yay -S --noconfirm zsh neovim htop lf ncmpcpp mpd mpv libva-mesa-driver librewolf-bin discord

# GTK settings
gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Fluent-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Future-dark-cursors"
gsettings set org.gnome.desktop.interface font-name "Exo 2 12"

yay --noconfirm -Yc

chsh -s /bin/zsh

reboot
