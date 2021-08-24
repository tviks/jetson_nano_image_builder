#! /bin/bash

sudo apt-get update && apt-get upgrade -y

sudo apt install sudo git nano htop wget qemu-user-static -y


wget https://developer.nvidia.com/embedded/l4t/r32_release_v6.1/t210/jetson-210_linux_r32.6.1_aarch64.tbz2

wget http://cdimage.ubuntu.com/ubuntu-base/releases/18.04/release/ubuntu-base-18.04.5-base-arm64.tar.gz

tar xf jetson-210_linux_r32.6.1_aarch64.tbz2

sudo -E mv ubuntu-base-18.04.5-base-arm64.tar.gz ~/Linux_for_Tegra/rootfs/

cd ~/Linux_for_Tegra/


sed -i -e '/mknod -m 444/d' nv_tegra/nv-apply-debs.sh


cd ~/Linux_for_Tegra/rootfs/

sudo tar xpf ubuntu-base-18.04.5-base-arm64.tar.gz

rm -rf ubuntu-base-18.04.5-base-arm64.tar.gz

sudo mount --bind /dev dev/

sudo cp /usr/bin/qemu-aarch64-static usr/bin/

#sudo chmod 777 Linux_for_Tegra/rootfs/test.sh
#sudo chmod +x Linux_for_Tegra/rootfs/test.sh

sudo chroot . bin/bash -c "./test.sh"

cd ~/Linux_for_Tegra/

sudo ./apply_binaries.sh



