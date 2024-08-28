#!/bin/bash

# Function to add a mount point to fstab if it doesn't exist
add_to_fstab() {
    if ! grep -q "$1" /etc/fstab; then
        echo "$1" | sudo tee -a /etc/fstab > /dev/null
        echo "Added: $1"
    else
        echo "Already exists: $1"
    fi
}

# Add mount entries
add_to_fstab "//10.0.0.53/fs-omv /mnt/fs-omv cifs username=user,password=password,uid=1000,gid=1000,nofail 0 0"
add_to_fstab "//10.0.0.150/HDD2 /mnt/zima/HDD2 cifs username=user,password=password,uid=1000,gid=1000,nofail 0 0"
add_to_fstab "//10.0.0.150/HDD3 /mnt/zima/HDD3 cifs username=user,password=password,uid=1000,gid=1000,nofail 0 0"
add_to_fstab "//10.0.0.150/zima_sftp_sonicbit /mnt/zima/sonicbit-sftp cifs username=user,password=password,uid=1000,gid=1000,nofail 0 0"
add_to_fstab "//10.0.0.150/zima_gdrive_mbrake1994 /mnt/zima/gdrive-mbrake1994 cifs username=user,password=password,uid=1000,gid=1000,nofail 0 0"

echo "Finished adding mounts to /etc/fstab. Please review the file to ensure correctness."
