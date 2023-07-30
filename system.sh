cd ../suckless/dwm
make clean install

cd ../dwmblocks
make clean install

cd ../dmenu
make clean install

cd ../st
make clean insatll

cd ../..

cp lfrun /usr/bin/lfrun

echo "ZDOTDIR=/home/$1/.config/zsh" >> /etc/environment

echo "source /home/$1/.config/vim/vimrc" >> /etc/vimrc

systemctl enable mpd
