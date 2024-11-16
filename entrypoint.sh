#!/bin/bash

sleep 2
cd ~
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Copy run.sh to /home/container
wget https://github.com/docker-mobile/Pterodactyl-VPS-Egg/raw/refs/heads/main/run.sh
cp ./run.sh "~/run.sh"

# Make run.sh executable.
chmod +x "~/run.sh"

# Run the VPS Installer
wget https://github.com/docker-mobile/Pterodactyl-VPS-Egg/raw/refs/heads/main/install.sh
bash ./install.sh
