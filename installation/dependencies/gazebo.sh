#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "Installing Gazebo"

sudo apt install -y python-jinja2 python-pip python3-pip

sudo pip install numpy toml
sudo apt -y install python-toml

# update Gazebo to latest version for gpu-ray fixes
# sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
# wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
# sudo apt -y update
# sudo apt -y upgrade gazebo9 gazebo9-common gazebo9-plugin-base libgazebo9 libgazebo9-dev libignition-cmake-dev libignition-common libignition-common-dev libignition-fuel-tools1-1 libignition-fuel-tools1-dev libsdformat6 libsdformat6-dev sdformat-sdf
