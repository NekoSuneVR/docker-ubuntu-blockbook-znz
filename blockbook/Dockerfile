FROM ubuntu:22.04
MAINTAINER NekoSuneVR <nekosunevr@gmail.com>

WORKDIR /root

RUN apt-get update -y

RUN apt-get install -y curl sudo

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential
COPY ./dummyapp.js dummyapp.js

# Copy the pre-built .deb files
COPY ../debs/blockbook-znz*.deb blockbook-znz.deb

# Install the debs
RUN apt install -y ./blockbook-znz.deb

# Copy the config file
COPY ./blockchain_cfg.json /opt/coins/blockbook/znz/config/blockchaincfg.json

EXPOSE 9013 9113

VOLUME /opt/coins/data/znz/blockbook/db
VOLUME /opt/coins/blockbook/znz/logs

CMD ["/opt/coins/blockbook/znz/bin/blockbook"]

# Run this dummy app to keep the container running so that you can enter the
# container with `docker exec -it dev-bb bash` and debug the container from
# the inside.
#CMD node dummyapp.js
