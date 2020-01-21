FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabi.ionescu+dockerthings@protonmail.com>

COPY install /usr/bin/

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        openvpn \
        expect \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y \
 \
 && chmod +x \
        /usr/bin/openvpn-config \
        /usr/bin/with-vpn

# ENTRYPOINT
ENTRYPOINT ["/usr/bin/with-vpn","echo 'CONNECTION DONE' && whoami && sleep 5s"]
