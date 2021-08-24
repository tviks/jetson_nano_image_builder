#! /bin/bash

echo "nameserver 8.8.8.8" | tee /etc/resolv.conf > /dev/null

apt-get update 

apt list --upgradable

apt-get upgrade -y

apt --fix-broken install

apt-get install sudo nano -y



