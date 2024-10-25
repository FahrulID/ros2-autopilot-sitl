# How To Start PX4-Autopilot SITL

```bash
DONT_RUN=1 make px4_sitl gazebo-classic
path/to/PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_multiple_run.sh [-m <model>] [-n <number_of_vehicles>] [-w <world>] [-s <script>] [-t <target>] [-l <label>]
# Example
./Tools/simulation/gazebo-classic/sitl_multiple_run.sh -m iris -n 4

# RPLidar
source Tools/simulation/gazebo-classic/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
make px4_sitl gazebo-classic_iris_rplidar

# Depth Camera
source Tools/simulation/gazebo-classic/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
make px4_sitl gazebo-classic_iris_depth_camera

# Run RQT
ros2 run rqt_gui rqt_gui
```

# Fix Topic for RPLidar

Edit PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_gazebo-classic/models/rplidar/model.sdf

Source from [here](https://github.com/ros-simulation/gazebo_ros_pkgs/wiki/ROS-2-Migration:-Ray-sensors)

```xml
<!-- <plugin name="laser" filename="libRayPlugin.so" /> -->
<!-- <plugin name="gazebo_ros_head_rplidar_controller" filename="libgazebo_ros_laser.so">
    <topicName>laser/scan</topicName>
    <frameName>rplidar_link</frameName>
</plugin> -->

<plugin name="gazebo_ros_head_hokuyo_controller" filename="libgazebo_ros_ray_sensor.so">
    <ros>
    <namespace>/laser</namespace>
    <remapping>~/out:=scan</remapping>
    </ros>
    <output_type>sensor_msgs/LaserScan</output_type>
</plugin>

```