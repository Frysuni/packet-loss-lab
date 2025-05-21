#!/bin/bash

rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1 /root/.vnc/*.pid

mkdir -p /root/.vnc

cat /run/secrets/vnc_password | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

USER=root tightvncserver :1 -geometry 1280x800 -depth 24

tail -f /dev/null