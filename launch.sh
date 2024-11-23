#!/bin/bash

# Blockbook must be run from this directory
cd /opt/coins/blockbook/znz

# Start blockbook
/opt/coins/blockbook/znz/bin/blockbook -blockchaincfg=/opt/coins/blockbook/znz/config/blockchaincfg.json \
-datadir=/opt/coins/data/znz/blockbook/db -sync -internal=:9013 -public=:9113 \
-certfile=/opt/coins/blockbook/znz/cert/blockbook -explorer= -log_dir=/opt/coins/blockbook/znz/logs -workers=1

