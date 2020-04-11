# syntax=docker/dockerfile:experimental
FROM ubuntu:19.10

# https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md
RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache


RUN --mount=type=cache,id=apt_common,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=apt_common,sharing=locked,target=/var/lib/apt \
    apt-get update && apt-get dist-upgrade -y

RUN --mount=type=cache,id=apt_common,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=apt_common,sharing=locked,target=/var/lib/apt \
    apt-get install -y openvpn

RUN --mount=type=cache,id=apt_common,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=apt_common,sharing=locked,target=/var/lib/apt \
    apt-get install -y x11-apps remmina

COPY start.sh /

# Build:
# DOCKER_BUILDKIT=1 docker build --rm=true -t docker_openvpn .

# Run
#   mkdir -p ~/docker-remote.config
#   mkdir -p ~/docker-remote.local
#   xhost +
#   docker run -it --rm --env=DISPLAY \
#              --volume /tmp/.X11-unix:/tmp/.X11-unix \
#              --volume=$HOME/.Xauthority:/root/.Xauthority:rw \
#              --volume=$HOME/docker-remote.config:/root/.config \
#              --volume=$HOME/docker-remote.local:/root/.local \
#              --volume=$HOME/Downloads/albova.ovpn:/openvpn_settings.ovpn:ro \
#              --cap-add=NET_ADMIN --device /dev/net/tun \
#              docker_openvpn /start.sh
