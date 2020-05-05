#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

## | ----------------- trapping !=0 exitcodes ----------------- |

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?"' ERR

## | ----------------------- install git ---------------------- |

sudo apt-get -y install git

## | ------------------- unattanded install? ------------------ |

unattended=0
subinstall_params=""
for param in "$@"
do
  echo $param
  if [ $param="--unattended" ]; then
    echo "installing in unattended mode"
    unattended=1
    subinstall_params="--unattended"
  fi
done

## | ----------------------- install ROS ---------------------- |

$MY_PATH/dependencies/ros.sh

## | --------------------- install git lfs -------------------- |

$MY_PATH/dependencies/git_lfs.sh

## | --------------------- install gitman --------------------- |

$MY_PATH/dependencies/gitman.sh

## | ---------------- install gitman submodules --------------- |

gitman install --force

## | ---------------- install px4 dependencies ---------------- |

$MY_PATH/../ros_packages/px4/Tools/setup/ubuntu.sh --no-nuttx --no-sim-tool
sudo apt -y upgrade # this was needed after the first installation to fix the libignition-fuel-...

## | --------------------- install gazebo --------------------- |

$MY_PATH/dependencies/gazebo.sh

## | --------------------- install mavros --------------------- |

$MY_PATH/dependencies/mavros.sh

## | --------------- add ROS sourcing to .bashrc -------------- |

line="source /opt/ros/melodic/setup.bash"

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

exit 0
