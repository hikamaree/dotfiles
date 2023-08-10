echo -e "MAKEFLAGS=\"-j16\"" >> etc/makepkg.conf
echo "ZDOTDIR=/home/$1/.config/zsh" >> /etc/environment
echo "source /home/$1/.config/vim/vimrc" >> /etc/vimrc
