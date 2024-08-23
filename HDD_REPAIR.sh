#!/bin/bash

# Stop all Docker containers
echo "Stopping all Docker containers..."
sudo docker stop $(sudo docker ps -a -q)

# Stop Samba services
echo "Stopping Samba services..."
sudo systemctl stop smbd nmbd

# Stop OpenMediaVault engine
echo "Stopping OpenMediaVault engine..."
sudo systemctl stop openmediavault-engined

# Unmount /HDD2
echo "Unmounting /HDD2..."
sudo umount /HDD2
if [ $? -ne 0 ]; then
    echo "Regular unmount failed, trying lazy unmount..."
    sudo umount -l /HDD2
fi

# Unmount /dev/sda1
echo "Unmounting /dev/sda1..."
sudo umount /dev/sda1
if [ $? -ne 0 ]; then
    echo "Regular unmount failed, trying lazy unmount..."
    sudo umount -l /dev/sda1
fi

# Run fsck on /dev/sda1
echo "Running fsck on /dev/sda1..."
sudo fsck.ext4 -yfv /dev/sda1

# Remount /dev/sda1 to /HDD2
echo "Remounting /dev/sda1 to /HDD2..."
sudo mount /dev/sda1 /HDD2

# Start OpenMediaVault engine
echo "Starting OpenMediaVault engine..."
sudo systemctl start openmediavault-engined

# Start Samba services
echo "Starting Samba services..."
sudo systemctl start smbd nmbd

# Start Portainer
echo "Starting Portainer..."
sudo docker start portainer

# Check if services are running
echo "Checking if services are running..."
echo "OpenMediaVault engine status:"
sudo systemctl is-active openmediavault-engined
echo "Samba (smbd) status:"
sudo systemctl is-active smbd
echo "Samba (nmbd) status:"
sudo systemctl is-active nmbd
echo "Portainer status:"
sudo docker ps -a | grep portainer

# Check if /dev/sda1 is mounted
echo "Checking if /dev/sda1 is mounted:"
mount | grep /dev/sda1


# CHECK MOUNT
mount | grep sda1
lsof /HDD2

echo "Script completed."
