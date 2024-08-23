#!/bin/bash

# Function to list available drives
list_drives() {
    echo "Available drives:"
    lsblk -nlo NAME,SIZE,MOUNTPOINT | grep -v loop
}

# Function to get mount points for a given drive
get_mount_points() {
    drive=$1
    mount | grep "^$drive" | awk '{print $3}'
}

# List available drives
list_drives

# Ask user which drive to repair
read -p "Which drive would you like to repair? (e.g., sda1): " drive_name
drive="/dev/$drive_name"

# Verify the drive exists
if [ ! -b "$drive" ]; then
    echo "Error: $drive is not a valid block device."
    exit 1
fi

# Get mount points for the drive
mount_points=$(get_mount_points "$drive")

# Stop all Docker containers
echo "Stopping all Docker containers..."
sudo docker stop $(sudo docker ps -a -q)

# Stop Samba services
echo "Stopping Samba services..."
sudo systemctl stop smbd nmbd

# Stop OpenMediaVault engine
echo "Stopping OpenMediaVault engine..."
sudo systemctl stop openmediavault-engined

# Unmount all mount points for the drive
for mount_point in $mount_points; do
    echo "Unmounting $mount_point..."
    sudo umount "$mount_point"
    if [ $? -ne 0 ]; then
        echo "Regular unmount failed, trying lazy unmount..."
        sudo umount -l "$mount_point"
    fi
done

# Run fsck on the drive
echo "Running fsck on $drive..."
sudo fsck.ext4 -yfv "$drive"

# Remount the drive to its original mount points
for mount_point in $mount_points; do
    echo "Remounting $drive to $mount_point..."
    sudo mount "$drive" "$mount_point"
done

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

# Check if the drive is mounted
echo "Checking if $drive is mounted:"
mount | grep "$drive"

# CHECK MOUNT (Corrected to use the first mount point if available)
if [ ! -z "$mount_points" ]; then
  first_mount_point=$(echo "$mount_points" | awk '{print $1}')
  lsof "$first_mount_point"
else
  echo "No mount points found for $drive"
fi

echo "Script completed."
