# syntax=docker/dockerfile:experimental
FROM ubuntu:19.10

# https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md
RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache


RUN --mount=type=cache,id=apt_common,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=apt_common,sharing=locked,target=/var/lib/apt \
    apt-get update

RUN --mount=type=cache,id=apt_common,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=apt_common,sharing=locked,target=/var/lib/apt \
    apt-get install -y openvpn

# Build:
# DOCKER_BUILDKIT=1 docker build --rm=true -t docker_openvpn .

# Run:
# docker run -it --rm --volume=$HOME/Downloads/albova.ovpn:/openvpn_settings.ovpn:ro --cap-add=NET_ADMIN --device /dev/net/tun docker_openvpn /usr/sbin/openvpn --config /openvpn_settings.ovpn
