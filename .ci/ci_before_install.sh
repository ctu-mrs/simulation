#!/bin/bash
# author: Robert Penicka

set -e

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

echo "Starting install preparation" 
openssl aes-256-cbc -K $encrypted_f0fd3ee254e8_key -iv $encrypted_f0fd3ee254e8_iv -in ./.ci/deploy_key_github.enc -out ./.ci/deploy_key_github -d
eval "$(ssh-agent -s)"
chmod 600 ./.ci/deploy_key_github
ssh-add ./.ci/deploy_key_github
sudo apt-get update -qq
sudo apt-mark hold openssh-server
sudo apt -y upgrade --fix-missing
sudo apt-get install git # python-setuptools python3-setuptools python3-pip

echo "installing uav_core"
cd
git clone https://github.com/ctu-mrs/uav_core
cd uav_core
./installation/install.sh

echo "installing simulation"
cd
git clone https://github.com/ctu-mrs/simulation
cd simulation
./installation/install.sh

echo "creating workspace"
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
ln -s ~/simulation
source /opt/ros/$ROS_DISTRO/setup.bash
cd ~/catkin_ws
catkin init

echo "install part ended"
