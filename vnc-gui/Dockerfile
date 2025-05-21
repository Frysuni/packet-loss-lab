FROM dorowu/ubuntu-desktop-lxde-vnc

USER root

RUN rm -f /etc/apt/sources.list.d/google-chrome.list \
 && apt-get update \
 && apt-get install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    vlc \
    ffmpeg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
