# MRS gazebo simulation

Catkin-based gazebo simulation of the MRS system under ROS.

- Installation: add this repository into your ros workspace.

## ROS Packages 

- [mrs_simulation](https://mrs.felk.cvut.cz/gitlab/github/mrs_simulation) 
  - Support for spawning vehicles into gazebo simulation. 
  - For more detail instructions see [README](https://mrs.felk.cvut.cz/gitlab/github/mrs_simulation/README.md) 
   
- [mrs_gazebo_common_resources](https://mrs.felk.cvut.cz/gitlab/uav/gazebo_simulation/mrs_gazebo_common_resources) 
  - Common gazebo files (worlds, models and plugins) for the MRS system. 
  - For more details see [README](https://mrs.felk.cvut.cz/gitlab/uav/gazebo_simulation/mrs_gazebo_common_resources/README.md) 

- [px4](https://mrs.felk.cvut.cz/gitlab/uav/gazebo_simulation/firmware_simulation) - Pixhawk Firmware  
- [mavlink_sitl_gazebo](https://mrs.felk.cvut.cz/gitlab/uav/gazebo_simulation/sitl_gazebo) - PX4 gazebo files (worlds, models and plugins) for SITL with the Pixhawk 
 
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

