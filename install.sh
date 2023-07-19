#!/bin/sh

cp -r config ~/.config

git clone https:/aur.archlinux.org/yay.git

cd yay
makepkg -si
yay -Syu
yay -S --noconfirm xorg-xinit xorg-xserver xorg-xset libxft libx11 libxinerama webkit2gtk vim git

git clone https://github.com/CameronNemo/brillo.git
git clone https:/github.com/hikamaree/suckless.git

cd ../brillo
sudo make install.setgid

cd ../suckless/dwm
sudo make clean install

cd ../dwmblocks
sudo make clean install

cd ../dmenu
sudo make clean install

cd ../st
sudo make clean insatll

cd ../..

yay -S --noconfirm zsh
USER=$(whoami)
sudo echo "ZDOTDIR=/home/$USER/.config/zsh"
chsh -s /bin/zsh

yay -S --noconfirm htop neofetch

yay -S --noconfirm lf ueberzugpp
cp lfrun /usr/bin/lfrun

yay -S --noconfirm auto-cpufreq
sudo systemctl enable auto-cpufreq

yay -S --noconfirm ncmpcpp mpd mpv feh firefox discord steam pinta
sudo systemctl enable mpd

yay -S --noconfirm picom ttf-sourcecodepro-nerd ttf-exo-2 fluent-icon-theme-git orchis-theme
mkdir ~/.local/share/icons
mkdir ~/.local/share/icons/default
touch ~/.local/share/icons/default/index.theme
echo "Inherits=Future-dark-cursors" > ~/.local/share/icons/default/index.theme
