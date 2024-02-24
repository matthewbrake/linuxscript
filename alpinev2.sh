#!/bin/ash
# ALPINE SETUP SCRIPT

set -e  # Exit immediately if a command exits with a non-zero status.

echo "Updating and upgrading the system..."
apk update
apk upgrade

echo "Installing Bash and its extensions..."
apk add bash bash-doc bash-completion

# Optionally, set Bash as the default shell for the new user
echo "Setting Bash as the default shell for the new user..."
echo "/bin/bash" >> /etc/shells

echo "Installing dependencies..."
apk add curl ca-certificates libseccomp

echo "Removing existing Docker packages..."
apk del docker docker-engine docker.io containerd runc || true  # Continue even if these packages are not found

echo "Installing Docker..."
apk add docker docker-compose
rc-update add docker boot
service docker start

echo "Installing and configuring OpenSSH..."
apk add openssh
rc-update add sshd
service sshd start

echo "Installing open-vm-tools..."
apk add open-vm-tools
rc-update add open-vm-tools boot
service open-vm-tools start

echo "Configuring the firewall for SSH..."
apk add iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
/etc/init.d/iptables save

echo "Creating a new user 'user' with sudo privileges..."
apk add sudo
adduser -D user
echo "user:password" | chpasswd
echo "user ALL=(ALL) ALL" >> /etc/sudoers

echo "Performing general system cleanup..."
apk cache clean

echo "Rebooting the system..."
reboot

echo "Setup complete!"
