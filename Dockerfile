FROM ubuntu:22.04
LABEL maintainer="NekoSuneVR <nekosunevr@gmail.com>"

WORKDIR /root

RUN apt-get update -y

RUN apt-get install -y curl sudo netcat

# Install Node.js
RUN sudo apt-get install -y build-essential

# Copy the pre-built .deb files
COPY ./debs/blockbook-znz*.deb ./blockbook-znz.deb
COPY ./debs/backend-znz*.deb ./backend-znz.deb

# Install the debs
RUN apt install -y ./backend-znz.deb
RUN apt install -y ./blockbook-znz.deb

# Create necessary directories for data and logs
RUN mkdir -p /opt/coins/data/znz/blockbook/db \
             /opt/coins/data/znz/backend \
             /opt/coins/blockbook/znz/logs \
             /opt/coins/blockbook/znz/cert

# Copy the config file
COPY ./configs/blockchain_cfg.json /opt/coins/blockbook/znz/config/blockchaincfg.json
COPY ./configs/znz.conf /opt/coins/nodes/znz/znz.conf

EXPOSE 9013 9113 8022

VOLUME /opt/coins/data/znz/blockbook/db
VOLUME /opt/coins/blockbook/znz/logs

COPY ./entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/root/entrypoint.sh"]

