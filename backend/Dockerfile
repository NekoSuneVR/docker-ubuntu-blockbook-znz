FROM ubuntu:22.04
LABEL maintainer="NekoSuneVR <nekosunevr@gmail.com>"

WORKDIR /root

RUN apt-get update -y

RUN apt-get install -y curl sudo

# Install Node.js
RUN sudo apt-get install -y build-essential

# Copy the pre-built .deb files
COPY ./backend/backend-znz*.deb backend-znz.deb

# Install the debs
RUN apt install -y ./backend-znz.deb

EXPOSE 8022

CMD ["/opt/coins/nodes/znz/bin/zenzod"]

