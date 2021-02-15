#!/bin/bash
set -e

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

# get the path to this script
MY_PATH=`pwd`

echo "Starting install"

sudo apt-get -y install git

echo "installing uav_core"
cd
git clone https://github.com/ctu-mrs/uav_core
cd uav_core
./installation/install.sh

echo "installing simulation"
cd "$MY_PATH"
gitman install
./installation/install.sh

echo "creating workspace"
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
ln -s "$MY_PATH" simulation
ln -s ~/uav_core/ros_packages/mavros
ln -s ~/uav_core/ros_packages/mrs_msgs
source /opt/ros/$ROS_DISTRO/setup.bash
cd ~/catkin_ws
catkin init

echo "install part ended"
