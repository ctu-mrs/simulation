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

default=y
while true; do
  if [[ "$unattended" == "1" ]]
  then
    resp=$default
  else
    [[ -t 0 ]] && { read -t 10 -n 2 -p $'\e[1;32mInstall ROS? [y/n] (default: '"$default"$')\e[0m\n' resp || resp=$default ; }
  fi
  response=`echo $resp | sed -r 's/(.*)$/\1=/'`

  if [[ $response =~ ^(y|Y)=$ ]]
  then

    $MY_PATH/dependencies/ros.sh

    break
  elif [[ $response =~ ^(n|N)=$ ]]
  then
    break
  else
    echo " What? \"$resp\" is not a correct answer. Try y+Enter."
  fi
done

## | --------------------- install git lfs -------------------- |

$MY_PATH/dependencies/git_lfs.sh

## | --------------------- install gitman --------------------- |

$MY_PATH/dependencies/gitman.sh

## | ---------------- install gitman submodules --------------- |

gitman install --force

## | ---------------- install px4 dependencies ---------------- |

$MY_PATH/../ros_packages/px4/Tools/setup/ubuntu.sh
sudo apt -y upgrade # this was needed after the first installation to fix the libignition-fuel-...

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
