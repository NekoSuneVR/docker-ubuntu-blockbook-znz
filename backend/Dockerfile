FROM ubuntu:22.04
MAINTAINER NekoSuneVR <nekosunevr@gmail.com>

WORKDIR /root

RUN apt-get update -y

RUN apt-get install -y curl sudo

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential
COPY dummyapp.js dummyapp.js

# Copy the pre-built .deb files
COPY debs/backend-znz*.deb backend-znz.deb

# Install the debs
RUN apt install -y ./backend-znz.deb

EXPOSE 8022

CMD ["/opt/coins/nodes/znz/bin/zenzod"]

