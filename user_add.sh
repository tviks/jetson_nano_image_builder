


adduser --disabled-password --gecos "" owls

echo "owls:qweqwe2" | chpasswd
echo "root:qweqwe2" | chpasswd

usermod -aG sudo owls


echo "root    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "owls    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "127.0.0.1 ubuntu" >> /etc/hosts
