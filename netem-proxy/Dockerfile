FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    iproute2 \
    socat \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/start.sh"]
