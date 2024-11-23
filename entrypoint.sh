#!/bin/bash

# Start Zenzo backend
/opt/coins/nodes/znz/bin/zenzod \
  -datadir=/opt/coins/data/znz/backend \
  -conf=/opt/coins/nodes/znz/znz.conf \
  -pid=/run/zenzod.pid &

# Wait for the Zenzo backend to be ready
echo "Waiting for Zenzo backend to initialize..."
until curl -s http://localhost:8022 >/dev/null; do
    sleep 5
done

# Start Blockbook
/opt/coins/blockbook/znz/bin/blockbook \
  -blockchaincfg=/opt/coins/blockbook/znz/config/blockchaincfg.json \
  -datadir=/opt/coins/data/znz/blockbook/db \
  -sync \
  -internal=:9013 \
  -public=:9113 \
  -certfile=/opt/coins/blockbook/znz/cert/blockbook \
  -explorer= \
  -log_dir=/opt/coins/blockbook/znz/logs
