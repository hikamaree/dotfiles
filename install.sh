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

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
yay --noconfirm -Syu

#wayland
echo "Install wayland (y/n): "
read WAYLAND
if [[ $WAYLAND == 'y' || $WAYLAND == 'Y' ]]
then
    yay -S --noconfirm hyprland foot grim slurp waybar-hyprland-git wl-clipboard swayimg bemenu-wayland
fi

#x11
echo "Install X11 (y/n): "
read X11
if [[ $X11 == 'y' || $X11 == 'Y' ]]
then
    yay -S --noconfirm xorg-xinit xorg-server xorg-xset libxft libx11 libxinerama webkit2gtk ueberzugpp maim xclip picom feh

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
fi

# laptop
echo "Install laptop utilities (y/n): "
read LAPTOP
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
    [[ $X11 == 'y' || $X11 == 'Y' ]] && sudo cp res/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
fi

yay -S --noconfirm nvim zsh htop lf wine-staging mingw-w64-make ncmpcpp mpd mpv libva-mesa-driver librewolf-bin webcord

gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Fluent-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Future-dark-cursors"
gsettings set org.gnome.desktop.interface font-name "Exo 2 12"

yay --noconfirm -Yc

chsh -s /bin/zsh

reboot
