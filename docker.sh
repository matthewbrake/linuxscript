#!/bin/bash

echo "Installing Docker"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install curl git
bash -c "$(curl -fsSL https://get.docker.com)"
sudo apt install docker-compose

echo "Enable Docker Service"
sudo systemctl enable docker.service && sudo systemctl enable containerd.service

echo "Add User to group Docker"
sudo usermod -aG docker user

echo "Add rdp to group Docker"
sudo usermod -aG docker rdp
newgrp

# Docker intall script (docker and docker compose)
# curl -fsSL https://get.docker.com | sh
