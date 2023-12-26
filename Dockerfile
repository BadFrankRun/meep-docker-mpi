
FROM ubuntu:noble

# Nimbix image-common desktop
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install curl && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash -s -- --setup-nimbix-desktop

# Meep Build From Source
RUN mkdir -p /usr/local/meep
RUN cd /usr/local/meep
RUN wget https://raw.githubusercontent.com/NanoComp/meep/master/contrib/build-meep.sh
RUN chmod +x build-meep.sh
RUN ./build-meep.sh

# add terminal
RUN x-terminal-emulator -e 

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22

# for standalone use
EXPOSE 5901
EXPOSE 443
