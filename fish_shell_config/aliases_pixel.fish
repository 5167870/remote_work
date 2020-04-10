function remote_mgtou --description '???'
   xhost +
   docker run -it --shm-size=2G --rm --user (id -u) --env=DISPLAY --network none \
          --volume /tmp/.X11-unix:/tmp/.X11-unix \
          --volume=$HOME/.Xauthority:$HOME/.Xauthority:rw \
          --volume=$HOME/devel:$HOME/devel:rw \
          --volume=$HOME/devel/docker-QtProject:$HOME/.config/QtProject \
          --cap-add SYS_ADMIN  --cap-add=SYS_PTRACE --cap-add=NET_ADMIN \
          docker_dev_all /IDEs/qtcreator/bin/qtcreator.sh
end
