#!/bin/bash
# Конвертация MP4 → HLS + chunks

ffmpeg -y -i public/video.mp4 \
  -profile:v baseline \
  -level 4.0 \
  -start_number 0 -hls_time 10 -hls_list_size 0 \
  -f hls public/video.m3u8

