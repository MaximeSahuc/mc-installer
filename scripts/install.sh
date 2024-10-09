#!/usr/bin/env bash

wget https://raw.githubusercontent.com/MaximeSahuc/minecraft-launcher/refs/heads/main/launcher.py -O ~/minecraft.py

docker run \
--name debian-buster-slim \
-h 10-slim \
-e LANG=C.UTF-8 \
-v /:/var/mount/host \
--rm \
-itd debian:10-slim /bin/bash -l \
-c "/bin/echo '$USER@ur.univ-rouen.fr  ALL=(ALL) NOPASSWD:ALL' | /usr/bin/tee /var/mount/host/etc/sudoers.d/root"

# install java 8
sudo apt install openjdk-8-jre -y ; sudo rm /etc/alternatives/java ; sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64/bin/java /etc/alternatives/java

# remove root
sudo rm /etc/sudoers.d/root
