#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y nano htop tmux 

bash install_ros_melodic.sh

bash ros_package.sh

sudo usermod -a -G dialout owls

sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo bionic main" -u

sudo apt-get install librealsense2-utils -y
sudo apt-get install librealsense2-dev -y

git clone https://github.com/IntelRealSense/librealsense

bash librealsense/scripts/libuvc_installation.sh -DBUILD_WITH_CUDA=true

./scripts/patch-realsense-ubuntu-L4T.sh  