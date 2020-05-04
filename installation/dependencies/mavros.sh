#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?"' ERR

echo "Installing Mavros"

sudo apt -y install ros-melodic-mavros

cd /opt/ros/melodic/lib/mavros
sudo ./install_geographiclib_datasets.sh

exit 0
