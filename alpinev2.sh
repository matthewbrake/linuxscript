#!/bin/ash

# Update package list and upgrade the system
echo "Updating and upgrading the system..."
apk update
apk upgrade

# Install necessary dependencies for Docker
echo "Installing dependencies..."
apk add curl ca-certificates libseccomp

# Remove existing Docker packages if they exist
echo "Removing existing Docker packages..."
apk del docker docker-engine docker.io containerd runc

# Install Docker and its dependencies
echo "Installing Docker..."
apk add docker docker-compose

# Configure Docker to start on boot
echo "Configuring Docker to start on boot..."
rc-update add docker boot

# Start the Docker service
echo "Starting Docker service..."
service docker start

# Install OpenSSH and ensure it starts on boot
echo "Installing and configuring OpenSSH..."
apk add openssh

# Configure OpenSSH to start on boot
echo "Configuring OpenSSH to start on boot..."
rc-update add sshd

# Start the OpenSSH service
echo "Starting OpenSSH service..."
service sshd start

# Install open-vm-tools for VMware virtual machines
echo "Installing open-vm-tools for VMware virtual machines..."
apk add open-vm-tools

# Configure open-vm-tools to start on boot
echo "Configuring open-vm-tools to start on boot..."
rc-update add open-vm-tools boot

# Start the open-vm-tools service
echo "Starting open-vm-tools service..."
service open-vm-tools start

# Configure the firewall (assuming you're using iptables)
echo "Configuring the firewall for SSH..."
apk add iptables

# Allow SSH traffic through the firewall
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Save the firewall rules
/etc/init.d/iptables save

# Create a new user with sudo privileges
echo "Creating a new user 'user' with sudo privileges..."
apk add sudo

# Add a new user 'user'
adduser -D user

# Set password for the new user 'user'
echo "user:password" | chpasswd

# Grant sudo privileges to the new user 'user'
echo "user ALL=(ALL) ALL" >> /etc/sudoers

# Optimize the system for Docker (Add any specific optimizations here)
#echo "Optimizing the system for Docker..."

# Perform general system cleanup
echo "Performing general system cleanup..."
apk cache clean

echo "Setup complete!"
