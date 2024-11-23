#!/bin/bash

# Start Zenzo backend
/opt/coins/nodes/znz/bin/zenzod \
  -datadir=/opt/coins/data/znz/backend \
  -conf=/opt/coins/nodes/znz/znz.conf \
  -pid=/run/zenzod.pid &

# Wait for the Zenzo backend to be ready
echo "Waiting for Zenzo backend to be available on port 8022..."
while ! nc -z 127.0.0.1 8022; do
    sleep 1
done
echo "Zenzo backend is ready!"

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
