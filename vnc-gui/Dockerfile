FROM ubuntu:22.04
ARG HOSTNAME

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
  software-properties-common \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

RUN add-apt-repository universe

RUN apt-get install -y \
  ubuntu-desktop-minimal \
  # xfce4 \
  # xfce4-goodies \
  tightvncserver \
  ffmpeg \ 
  vlc \
  gstreamer1.0-tools \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-ugly \
  net-tools

RUN apt-get remove --purge -y xfce4-power-manager

RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
RUN touch /root/.Xauthority

RUN echo vnc-gui > /etc/hostname

ENTRYPOINT ["/opt/app/start.sh"]
