#!/usr/bin/env bash

sudo apt-get install -y ros-melodic-realsense2-camera ros-melodic-mavros ros-melodic-mavros-extras ros-melodic-web-video-server

wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh

sudo bash ./install_geographiclib_datasets.sh  

cd ~/catkin_ws/src

git clone https://github.com/Auterion/VIO

git clone https://github.com/PX4/PX4-Avoidance

cd ~/catkin_ws

rosdep install --from-paths src --ignore-src --rosdistro melodic -y

#catkin_make

