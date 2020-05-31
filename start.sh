#!/bin/bash
cd "${0%/*}"
xhost +local:root

source ./arg.sh

if [ "$(uname)" == "Darwin" ]
then
    export HOST_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    xhost +$HOST_IP
    export DISPLAY=$HOST_IP":0"
fi

docker rm -f evo

docker-compose rm -f

docker-compose build evo

docker-compose up -d evo

## normal docker command1
# docker build -t evo -f Dockerfile.rosmelodic .
# docker run --name evo evo
# docker exec -it evo bash

# docker stop evo
# docker container rm evo


# #test data and draw trajectory
# cd test/data
# evo_traj kitti KITTI_00_ORB.txt KITTI_00_SPTAM.txt --ref=KITTI_00_gt.txt -p --plot_mode=xz
# evo_traj bag ROS_example.bag  --all_topics -p --plot_mode=xz
