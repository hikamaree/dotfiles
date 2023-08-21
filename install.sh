#!/bin/sh

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

sudo ./system.sh $USER

echo "Is this laptop? (Y/N): "
read LAPTOP

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
yay --noconfirm -Syu

# packages

yay -S --noconfirm xorg-xinit xorg-server xorg-xset libxft libx11 libxinerama webkit2gtk ueberzugpp maim xclip picom
yay -S --noconfirm hyprland foot grim slurp waybar-hyprland-git tofi wl-clipboard
yay -S --noconfirm vim zsh htop lf wine-staging mingw-w64-make ncmpcpp mpd mpv feh orchis-theme librewolf discord

git clone https://github.com/hikamaree/suckless.git
cd suckless/dwm
sudo make clean install
cd ../dwmblocks
sudo make clean install
cd ../dmenu
sudo make clean install
cd ../st
sudo make clean install
cd ../..

sudo cp res/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf

sudo systemctl --global enable mpd

# laptop
if [[ $LAPTOP == 'y' || $LAPTOP == 'Y' ]]
then
    yay -S --noconfirm go-md2man
    git clone https://github.com/CameronNemo/brillo.git
    cd brillo
    sudo make install.setgid
    cd ..
    yay -Rns --noconfirm go-md2man
    yay -S --noconfirm auto-cpufreq
    sudo systemctl enable auto-cpufreq
    sudo cp res/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
fi

yay --noconfirm -Yc

chsh -s /bin/zsh

reboot
