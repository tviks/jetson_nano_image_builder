#! /bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo $PWD

WORK_DIR=$PWD

sudo apt-get update && apt-get upgrade -y

sudo apt install sudo git nano htop wget qemu-user-static libxml2-utils -y


wget -nc https://developer.nvidia.com/embedded/l4t/r32_release_v6.1/t210/jetson-210_linux_r32.6.1_aarch64.tbz2

wget -nc http://cdimage.ubuntu.com/ubuntu-base/releases/18.04/release/ubuntu-base-18.04.5-base-arm64.tar.gz

tar xf jetson-210_linux_r32.6.1_aarch64.tbz2

sudo -E mv ubuntu-base-18.04.5-base-arm64.tar.gz $WORK_DIR/Linux_for_Tegra/rootfs/

cd $WORK_DIR/Linux_for_Tegra/


sed -i -e '/mknod -m 444/d' nv_tegra/nv-apply-debs.sh


cd $WORK_DIR/Linux_for_Tegra/rootfs/

sudo tar xpf ubuntu-base-18.04.5-base-arm64.tar.gz

sudo rm -rf ubuntu-base-18.04.5-base-arm64.tar.gz

sudo cp $WORK_DIR/rootfs.sh .

sudo mount --bind /dev dev/

sudo cp /usr/bin/qemu-aarch64-static usr/bin/

sudo chmod 777 $WORK_DIR/Linux_for_Tegra/rootfs/rootfs.sh
sudo chmod +x $WORK_DIR/Linux_for_Tegra/rootfs/rootfs.sh

sudo chroot . bin/bash -c "./rootfs.sh"

cd $WORK_DIR/Linux_for_Tegra/

cd $WORK_DIR/Linux_for_Tegra/
sudo ./apply_binaries.sh

cd $WORK_DIR/Linux_for_Tegra/rootfs/
sudo chroot $WORK_DIR/Linux_for_Tegra/rootfs/ bin/bash -c "apt --fix-broken install -y && exit"

cd $WORK_DIR/Linux_for_Tegra/
sudo ./apply_binaries.sh

cd $WORK_DIR/Linux_for_Tegra/rootfs/
sudo chroot . bin/bash -c "apt --fix-broken install -y && exit"

cd $WORK_DIR/Linux_for_Tegra/
sudo ./apply_binaries.sh

sudo .$WORK_DIR/Linux_for_Tegra/tools/jetson-disk-image-creator.sh -o jetson.img -b jetson-nano -r 300

