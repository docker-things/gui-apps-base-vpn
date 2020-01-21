#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# Where to store the communication pipes
FIFO_PATH="/tmp/docker-things/fifo"

# The name of the docker image
PROJECT_NAME="gui-apps-base-vpn"

# Meta to set in the .desktop file
APP_GENERIC_NAME="Web Browser"
APP_CATEGORIES="Network;WebBrowser;"
APP_MIME_TYPE="text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;"
APP_PARAM="%U"

# BUILD ARGS
BUILD_ARGS=(
    )

# LAUNCH ARGS
RUN_ARGS=(
    --memory="6g"
    --cpu-shares=1024
    --shm-size 2g

    # -v "`ls $(pwd)/vpn-config/*.ovpn | head -n 1`":/tmp/vpn-config.ovpn
    -v "$(pwd)/vpn-config/ch-18-tor.protonvpn.com.udp.ovpn":/opt/vpn/config.ovpn

    --cap-add=NET_ADMIN
    --device /dev/net/tun

    -e OPENVPN_USER=""
    -e OPENVPN_PASS=""

    --rm
    # -d
    -it
    )
