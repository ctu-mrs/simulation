#!/bin/bash
# author: Robert Penicka
set -e

echo "Starting test build" 
cd ~/catkin_ws
source /opt/ros/melodic/setup.bash
catkin build -j1 --verbose
echo "Ended test build"
