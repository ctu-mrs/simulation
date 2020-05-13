# MRS Gazebo Simulation [![Build Status](https://travis-ci.com/ctu-mrs/simulation.svg?branch=master)](https://travis-ci.com/ctu-mrs/simulation)

![](.fig/thumbnail.jpg)

## Modules

| ROS Package                                                             | Ubuntu | Status                                                                                                                                      |
|-------------------------------------------------------------------------|--------|---------------------------------------------------------------------------------------------------------------------------------------------|
| [mrs_simulation](https://github.com/ctu-mrs/mrs_simulation)                     | Bionic | [![Build Status](https://travis-ci.com/ctu-mrs/mrs_simulation.svg?branch=master)](https://travis-ci.com/ctu-mrs/mrs_simulation)                     |
| [mrs_gazebo_common_resources](https://github.com/ctu-mrs/mrs_gazebo_common_resources)                     | Bionic | [![Build Status](https://travis-ci.com/ctu-mrs/mrs_gazebo_common_resources.svg?branch=master)](https://travis-ci.com/ctu-mrs/mrs_gazebo_common_resources)                     |

* [mrs_simulation](https://github.com/ctu-mrs/mrs_simulation)
  * Support for Gazebo simulation and spawning vehicles.

* [mrs_gazebo_common_resources](https://github.com/ctu-mrs/mrs_gazebo_common_resources)
  * MRS Gazebo files: worlds, models and plugins.

* [px4](https://github.com/ctu-mrs/px4_firmware) - Pixhawk firmware
* [mavlink_sitl_gazebo](https://github.com/ctu-mrs/px4_sitl_gazebo) - PX4 gazebo files (worlds, models and plugins) for SITL with the Pixhawk

## System requirements

Required OS is Ubuntu 18.04 LTS 64-bit or its flavors that can install ROS Melodic.
The suggested variant of OS installation is dual boot instead of virtualization that can be slow and can not handle well the simulation GUI.
We use [Gitman](https://github.com/jacebrowning/gitman) to manage the repository **submodules**.
The repository are supposed to be compiled by [catkin tools](https://catkin-tools.readthedocs.io).

## Examples of tmuxinator simulation sessions

Selected tmuxinator scripts:

- [example_tmux_scripts/one_drone_gps](example_tmux_scripts/one_drone_gps)
- [example_tmux_scripts/one_drone_gps_standalone](example_tmux_scripts/one_drone_gps_standalone)
- [example_tmux_scripts/one_drone_optic_flow](example_tmux_scripts/one_drone_optic_flow)
- [example_tmux_scripts/two_drones_gps](example_tmux_scripts/two_drones_gps)

Bare tmux script (similar to the one used on real UAVs):

- [example_tmux_scripts/just_flying_bare_tmux](example_tmux_scripts/just_flying_bare_tmux)

## Installing simulation

The recommended way is to install the whole [MRS UAV system](https://github.com/ctu-mrs/mrs_uav_system).
However, if you prefer to install only the *simulation*, you can do the following:

1. Clone this repository,
2. place it into your *catkin workspace*,
3. call ```installation/install.sh``` to install the dependencies,
4. build your workspace.

## Finishing your .bashrc

The `install.sh` script will add the following to your .bashrc:
```bash
source /opt/ros/melodic/setup.bash
source /usr/share/gazebo/setup.sh
```
