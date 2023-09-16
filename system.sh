echo "ZDOTDIR=/home/$1/.config/zsh" >> /etc/environment
echo "$1 ALL=(ALL:ALL) NOPASSWD: /home/$1/.local/bin/cpuset" >> /etc/sudoers

usermod -a -G video $1
usermod -a -G seat $1

systemctl enable seatd.service
systemctl mask backlight@.service
systemctl mask --global at-spi-dbus-bus.service

