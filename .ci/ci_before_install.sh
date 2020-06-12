#!/bin/bash
# author: Robert Penicka

set -e

echo "Starting install preparation" 
openssl aes-256-cbc -K $encrypted_f0fd3ee254e8_key -iv $encrypted_f0fd3ee254e8_iv -in ./.ci/deploy_key_github.enc -out ./.ci/deploy_key_github -d
eval "$(ssh-agent -s)"
chmod 600 ./.ci/deploy_key_github
ssh-add ./.ci/deploy_key_github
sudo apt-get update -qq
sudo apt-get install dpkg git expect python-setuptools python3-setuptools python3-pip

echo "installing uav_core"
git clone https://github.com/ctu-mrs/uav_core
cd uav_core
./installation/install.sh

echo "run the main install.sh"
cd $TRAVIS_BUILD_DIR
./installation/install.sh

echo "creating workspace"
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
ln -s $TRAVIS_BUILD_DIR
source /opt/ros/melodic/setup.bash
cd ~/catkin_ws
catkin init

echo "install part ended"
