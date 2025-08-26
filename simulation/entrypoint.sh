#! /bin/bash 

echo "$(date +'[%Y-%m-%d %T]') Starting nginx server..."
set -x
nginx -g 'daemon off;'

cd ros2_ws
source ros2_ws/install/setup.bash 
ros2 launch rosbridge_server rosbridge_websocket_launch.xml