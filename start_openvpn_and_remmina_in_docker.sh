#!/bin/bash

# https://support.google.com/pixelbook/thread/708306?hl=en

mkdir -p ~/docker-remote.config
mkdir -p ~/docker-remote.local
xhost +
docker run -it --rm --env=DISPLAY \
           --volume /tmp/.X11-unix:/tmp/.X11-unix \
           --volume=$HOME/.Xauthority:/root/.Xauthority:rw \
           --volume=$HOME/docker-remote.config:/root/.config \
           --volume=$HOME/docker-remote.local:/root/.local \
           --volume=$HOME/Downloads/albova.ovpn:/openvpn_settings.ovpn:ro \
           --cap-add=NET_ADMIN --device /dev/net/tun \
           docker_openvpn /start.sh
