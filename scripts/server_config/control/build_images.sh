#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo -e "Usage: build_images.sh TAG Ex. build_images.sh feb18"
    echo -e "That will lead to building  quicker/quicker:feb18 "
    exit 1
fi

TAG=$1

cd ../../docker_setup
sudo docker build --no-cache -t quicker/quicker:$TAG main/ # add  --no-cache in between to force full rebuild 
sudo docker tag quicker/quicker:$TAG quicker/quicker:latest