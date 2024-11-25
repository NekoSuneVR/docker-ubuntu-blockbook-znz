#!/bin/bash
docker container run --name blockbook-mainnet --rm \
-v /mnt/blockbook_mainnet_nyc1/data:/opt/coins/data/znz/blockbook/db \
-v /mnt/blockbook_mainnet_nyc1/logs:/opt/coins/blockbook/znz/logs \
-p 9130:9130 -p 9030:9030 \
-it blockbook-mainnet /bin/bash
