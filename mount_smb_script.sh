#!/bin/bash

# Prompt the user for input
read -p "Enter the SMB share IP: " share_ip
read -p "Enter the SMB share name: " share_name
read -p "Enter the folder path to mount the SMB share to: " mount_path

# Optional: Prompt for username and password
read -p "Enter username (optional): " username
read -sp "Enter password (optional): " password
echo

# Optional: Prompt for uid, gid, file_mode, dir_mode
read -p "Enter UID (optional): " uid
read -p "Enter GID (optional): " gid
read -p "Enter file mode (optional, default=): " file_mode
read -p "Enter directory mode (optional, default=): " dir_mode

# Construct the mount options string
mount_options=""

if [ -n "$username" ]; then
    mount_options+="username=$username,"
fi

if [ -n "$password" ]; then
    mount_options+="password=$password,"
fi

if [ -n "$uid" ]; then
    mount_options+="uid=$uid,"
fi

if [ -n "$gid" ]; then
    mount_options+="gid=$gid,"
fi

if [ -n "$file_mode" ]; then
    mount_options+="file_mode=$file_mode,"
fi

if [ -n "$dir_mode" ]; then
    mount_options+="dir_mode=$dir_mode,"
fi

# Trim trailing comma if present
mount_options="${mount_options%,}"

# Construct the mount string
mount_string="//${share_ip}/${share_name} ${mount_path} cifs ${mount_options} 0 0"

# Echo and append to /etc/fstab
echo "Adding the following line to /etc/fstab:"
echo "$mount_string" | sudo tee -a /etc/fstab

# Remount the filesystem
sudo mount -a

# Show the mounted filesystems
df -h | grep "$mount_path"

echo "SMB share mounted successfully!"
