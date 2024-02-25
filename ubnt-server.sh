#!/bin/bash

# Update package list and upgrade the system
echo "Updating and upgrading the system..."
apt-get update && apt-get upgrade -y

# Add Docker repository and GPG key
echo "Adding Docker repository and GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install necessary packages for Docker, SSH, XRDP, and Desktop GUI
echo "Installing necessary packages for Docker, SSH, XRDP, and Desktop GUI..."
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git \
    wget \
    vim \
    net-tools \
    openssh-server \
    xrdp \
    ubuntu-desktop


# Install gotop for system monitoring
echo "Installing gotop for system monitoring..."
wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.1/gotop_v4.1.1_linux_amd64.deb -O /tmp/gotop.deb
dpkg -i /tmp/gotop.deb
rm /tmp/gotop.deb

# Add gotop to .bashrc to run at login for user
echo "Adding gotop to launch at every login for user 'user'..."
echo "gotop" >> /home/user/.bashrc

# Install Docker and its dependencies
echo "Installing Docker..."
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
systemctl enable docker

# Configure Docker group and shared folder
echo "Configuring Docker group and shared folder..."
groupadd docker
usermod -aG docker $USER
mkdir -p /home/docker/shared
chown $USER:docker /home/docker/shared

# Install Portainer for Docker management
echo "Installing Portainer..."
curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
docker stack deploy --compose-file=portainer-agent-stack.yml portainer

# Install and configure OpenSSH Server
echo "Configuring OpenSSH Server..."
systemctl enable ssh
systemctl start ssh

# Install XRDP for remote desktop access and enable it
echo "Configuring XRDP for remote desktop access..."
systemctl enable xrdp

# Create a new user with sudo privileges
echo "Creating a new user 'user' with sudo privileges..."
adduser user
usermod -aG sudo user
echo 'user:password' | chpasswd

# Clean up
echo "Performing system cleanup..."
apt-get autoremove -y
apt-get autoclean

# Reboot the system
echo "Rebooting the system..."
reboot

echo "Setup complete!"
