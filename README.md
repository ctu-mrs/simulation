# MRS gazebo simulation

Catkin-based gazebo simulation of the MRS system under ROS.

- Installation: add this repository into your ros workspace.

### Status Ros Melodic
[![Build Status](https://travis-ci.com/ctu-mrs/simulation.svg?branch=master)](https://travis-ci.com/ctu-mrs/simulation)

## ROS Packages

- [mrs_simulation](https://github.com/ctu-mrs/mrs_simulation)
  - Support for spawning vehicles into gazebo simulation.

- [mrs_gazebo_common_resources](https://github.com/ctu-mrs/mrs_gazebo_common_resources)
  - Common gazebo files (worlds, models and plugins) for the MRS system.

- [px4](https://github.com/ctu-mrs/px4_firmware) - Pixhawk Firmware
- [mavlink_sitl_gazebo](https://github.com/ctu-mrs/px4_sitl_gazebo) - PX4 gazebo files (worlds, models and plugins) for SITL with the Pixhawk

## Prepared examples

Tmuxinator scripts:

- [example_tmux_scripts/one_drone_gps](example_tmux_scripts/one_drone_gps)
- [example_tmux_scripts/one_drone_gps_standalone](example_tmux_scripts/one_drone_gps_standalone)
- [example_tmux_scripts/one_drone_gps_custom_configs](example_tmux_scripts/one_drone_gps_custom_configs)
- [example_tmux_scripts/one_drone_hector_slam](example_tmux_scripts/one_drone_hector_slam)
- [example_tmux_scripts/one_drone_optic_flow](example_tmux_scripts/one_drone_optic_flow)
- [example_tmux_scripts/two_drones_gps](example_tmux_scripts/two_drones_gps)
- [example_tmux_scripts/three_drones_gps](example_tmux_scripts/three_drones_gps)
- [example_tmux_scripts/three_drones_optic_flow](example_tmux_scripts/three_drones_optic_flow)
- [example_tmux_scripts/three_drones_benchmark](example_tmux_scripts/three_drones_benchmark)
- [example_tmux_scripts/many_drones_gps](example_tmux_scripts/many_drones_gps)

Bare tmux scripts:

- [example_tmux_scripts/just_flying_bare_tmux](example_tmux_scripts/just_flying_bare_tmux)
