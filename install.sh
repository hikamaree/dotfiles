#!/bin/sh

mv ~/.config ~/old_config
cp -r config ~/.config
mv ~/.local ~/.old_local
cp -r local ~/.local

echo "Is this laptop? (Y/N): "
read LAPTOP

git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -si
cd ..
yay -Syu

# laptop
if [[ $LAPTOP == 'y' || $LAPTOP == 'Y' ]]
then 
    git clone https://github.com/CameronNemo/brillo.git
    cd brillo
    sudo make install.setgid
    cd ..
    yay -S --noconfirm auto-cpufreq
    sudo systemctl enable auto-cpufreq
fi

# packages
git clone https://github.com/hikamaree/suckless.git

yay -S --noconfirm xorg-xinit xorg-server xorg-xset libxft libx11 libxinerama webkit2gtk vim zsh htop neofetch lf ueberzugpp maim xclip ncmpcpp mpd mpv feh picom orchis-theme librewolf-bin discord steam pinta minecraft-launcher

yay --noconfirm -Yc

# librewolf
librewolf --headless &
sleep 10
pkill librewolf

PROFPATH=$(grep "Default=.*\.default*" "$HOME/.librewolf/profiles.ini" | cut -d"=" -f2)
mkdir -p ~/.librewolf/$PROFPATH/chrome

cp -r res/chrome $HOME/.librewolf/$PROFPATH/

echo -e "user_pref(\"toolkit.legacyUserProfileCustomizations.stylesheets\", true);" >> $HOME/.librewolf/$PROFPATH/prefs.js

# system
chsh -s /bin/zsh
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Pictures/screenshots
sudo ./system.sh $USER

reboot
