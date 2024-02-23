#!/bin/bash

# Update package list and upgrade the system
echo "Updating and upgrading the system..."
apt-get update
apt-get upgrade -y

# Install necessary dependencies for Docker
echo "Installing dependencies for Docker..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Remove existing Docker packages if they exist
echo "Removing existing Docker packages..."
apt-get remove -y docker docker-engine docker.io containerd runc

# Install Docker and its dependencies
echo "Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Enable Docker to start on boot
systemctl enable docker

# Install and configure OpenSSH Server
echo "Installing and configuring OpenSSH Server..."
apt-get install -y openssh-server
systemctl enable ssh
systemctl start ssh

# Install XRDP for remote desktop access
echo "Installing XRDP for remote desktop access..."
apt-get install -y xrdp
systemctl enable xrdp

# Install Ubuntu Desktop or another desktop environment of your choice
echo "Installing Ubuntu Desktop GUI..."
apt-get install -y ubuntu-desktop

# Install Tailscale for secure networking
echo "Installing Tailscale for secure networking..."
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list
apt-get update
apt-get install -y tailscale

# Configure Tailscale to start on boot
systemctl enable tailscaled
systemctl start tailscaled

# Install Docker Compose if not already included with Docker installation
if ! command -v docker-compose &> /dev/null; then
    echo "Installing Docker Compose..."
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# Create a new user with sudo privileges
echo "Creating a new user 'user' with sudo privileges..."
adduser user
usermod -aG sudo user
echo 'user:password' | chpasswd

# Perform system cleanup
echo "Performing system cleanup..."
apt-get autoremove -y
apt-get autoclean

echo "Setup complete!"
