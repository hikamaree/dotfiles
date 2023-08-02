cd suckless/dwm
make clean install

cd ../dwmblocks
make clean install

cd ../dmenu
make clean install

cd ../st
make clean insatll

cd ../..

cp res/lfrun /usr/bin/lfrun
cp res/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf

echo "ZDOTDIR=/home/$1/.config/zsh" >> /etc/environment
echo "source /home/$1/.config/vim/vimrc" >> /etc/vimrc
