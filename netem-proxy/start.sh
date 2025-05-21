#!/usr/bin/env bash

set -e

case "$NETEM_PROFILE" in
  3g)
    DELAY="300ms"
    LOSS="2%"
    RATE="750kbit"
    ;;
  wifi)
    DELAY="40ms"
    LOSS="0.1%"
    RATE="12mbit"
    ;;
  lte)
    DELAY="70ms"
    LOSS="0.5%"
    RATE="5mbit"
    ;;
  fiber)
    DELAY="5ms"
    LOSS="0%"
    RATE="100mbit"
    ;;
  broken)
    DELAY="1000ms"
    LOSS="50%"
    RATE="56kbit"
    ;;
  *)
    echo "Unknown or missing NETEM_PROFILE: '$NETEM_PROFILE', using fallback to wifi"
    DELAY="40ms"
    LOSS="0.1%"
    RATE="12mbit"
    ;;
esac

tc qdisc add dev eth1 root netem delay $DELAY loss $LOSS rate $RATE
echo "Applied profile '$NETEM_PROFILE': delay=$DELAY, loss=$LOSS, rate=$RATE"

echo "Starting socat proxy..."
exec socat TCP-LISTEN:8080,reuseaddr,fork TCP:nginx-hls-streamer:80

