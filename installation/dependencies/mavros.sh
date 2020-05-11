#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "Installing Mavros"

sudo apt -y install ros-melodic-mavros ros-melodic-mavros-extras

cd /opt/ros/melodic/lib/mavros
sudo ./install_geographiclib_datasets.sh
