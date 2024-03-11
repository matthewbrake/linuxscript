#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update system and install essential base packages
echo "Updating system and installing base packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential curl wget file git

# Uninstall Snap Docker
echo "Removing Snap Docker..."
sudo snap remove docker

# Docker installation
echo "Installing Docker from the official Docker repository..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Configure Docker user
echo "Configuring Docker user..."
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker run hello-world

# System tools and utilities installation
echo "Installing system tools and utilities..."
sudo apt install -y vim nano htop iotop iftop

# Networking and firewall utilities
echo "Installing networking and firewall utilities..."
sudo apt install -y net-tools iptables iptables-persistent firewall-config

# Install NFS client and server
echo "Installing NFS client and server..."
sudo apt install -y nfs-common nfs-kernel-server

# Install cockpit web manager
sudo apt-get install cockpit -y
sudo systemctl enable --now cockpit.socket
sudo usermod -aG sudo USER

# Install D-Bus for message bus system
echo "Installing D-Bus..."
sudo apt install -y dbus

# Install BusyBox utilities
echo "Installing BusyBox utilities..."
sudo apt install -y busybox

# Additional dependencies and useful packages
echo "Installing additional dependencies and useful packages..."
sudo apt install -y software-properties-common dirmngr apt-transport-https

# Cleanup
echo "Cleaning up..."
sudo apt autoremove -y

echo "Script execution completed. System is now configured with essential tools and Docker."
