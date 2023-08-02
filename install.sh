#!/bin/sh

mv ~/.config ~/old_config
cp -r config ~/.config

echo "Is this laptop? (Y/N): "
read LAPTOP

git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -si
cd ..
yay -Syu

if [[ $LAPTOP == 'y' || $LAPTOP == 'Y' ]]
then 
    git clone https://github.com/CameronNemo/brillo.git
    cd brillo
    sudo make install.setgid
    cd ..
    yay -S --noconfirm auto-cpufreq
    sudo systemctl enable auto-cpufreq
fi

git clone https://github.com/hikamaree/suckless.git

yay -S --noconfirm xorg-xinit xorg-server xorg-xset libxft libx11 libxinerama webkit2gtk vim zsh htop neofetch lf ueberzugpp maim xclip ncmpcpp mpd mpv feh picom ttf-sourcecodepro-nerd ttf-exo-2 fluent-icon-theme-git orchis-theme firefox discord steam pinta minecraft-launcher

yay --noconfirm -Yc

if [ ! -d "/home/$USER/.local/share/icons/default" ]
then
     mkdir -p /home/$USER/.local/share/icons/default
fi
cp -r res/Future-dark-cursors /home/$USER/.local/share/icons/Future-dark-cursors
echo "Inherits=Future-dark-cursors" >> /home/$USER/.local/share/icons/default/index.theme

chsh -s /bin/zsh
sudo ./system.sh $USER
