# Setup mavros for ROS2 Foxy
find ./ros2_ws/src/mavros -type f -exec sed -i 's/tf2_eigen\.hpp/tf2_eigen\.h/g' {} +

rosdep install --from-paths ./ros2_ws/src --ignore-src -r -y