#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

## | ----------------- trapping !=0 exitcodes ----------------- |

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

debian=`lsb_release -d | grep -i debian | wc -l`
[[ "$debian" -eq "1" ]] && ROS_DISTRO="noetic" && distro="20.04" && DEBIAN=true

## | ----------- go to the directory of this script ----------- |

cd "$MY_PATH"

## | ----------------------- install git ---------------------- |

sudo apt-get -y install git

## | ----------------------- install ROS ---------------------- |

$MY_PATH/dependencies/ros.sh

## | --------------------- install git lfs -------------------- |

$MY_PATH/dependencies/git_lfs.sh

## | --------------------- install gitman --------------------- |

$MY_PATH/dependencies/gitman.sh

## | ---------------- install gitman submodules --------------- |

gitman install --force

## | ---------------- install px4 dependencies ---------------- |

if [ -e /home/$USER/.local/lib ]; then
  sudo chown $USER /home/$USER/.local/lib -R
fi

[ ! $DEBIAN ] && $MY_PATH/../ros_packages/px4_firmware/Tools/setup/ubuntu.sh --no-nuttx --no-sim-tool
[ $DEBIAN ] && $MY_PATH/../ros_packages/px4_firmware/Tools/setup/debian.sh --no-nuttx --no-sim-tool

sudo apt-get -y update
#to fix mrs_gazebo_common_resources build on Ubuntu 20.04
sudo apt-get upgrade -y libignition-common3*

if [ "$distro" = "18.04" ]; then
  sudo -H pip install --user packaging toml
  sudo apt-get -y install python-packaging python-toml

  #hotfix for missing library in ubuntu 18.04 for mavlink_sitl_gazebo
  sudo apt-get -y update --fix-missing
  sudo apt-get -y install -f
  sudo apt-get -y install libignition-math4
  sudo apt-get -y upgrade libignition-math4

elif [ "$distro" = "20.04" ]; then
  sudo -H pip3 install --user packaging
  sudo apt-get -y install python3-packaging
else
  echo -e "\e[31mThis version of Ubuntu (${distro}) is untested. Modify this script accordingly.\e[0m"
  exit 1
fi

sudo apt-get -y install python3-toml
sudo -H pip3 install --user toml

# needed for the UAV spawner
# sudo -H pip3 install --user defusedxml

# [ "$distro" = "18.04" ] && sudo apt-get -y upgrade 'libignition-fuel-*' # this was needed after the first installation to fix the libignition-fuel-...

sudo apt-get -y install 'libgstreamer1.0-dev' # needed for sitl_gazebo

# # we need to find out why is this needed
# sudo apt-get -y install \
#   libignition-common3-graphics-dev

## | --------------- add ROS sourcing to .bashrc -------------- |

line="source /opt/ros/$ROS_DISTRO/setup.bash"

num=`cat ~/.bashrc | grep "$line" | wc -l`
if [ "$num" -lt "1" ]; then

  echo "Adding '$line' to your .bashrc"

  # set bashrc
  echo "
$line" >> ~/.bashrc

fi

## | ------------- add Gazebo sourcing to .bashrc ------------- |

line="source /usr/share/gazebo/setup.sh"

num=`cat ~/.bashrc | grep "$line" | wc -l`
if [ "$num" -lt "1" ]; then

  echo "Adding '$line' to your .bashrc"

  # set bashrc
  echo "
$line" >> ~/.bashrc

fi
