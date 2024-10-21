#!/bin/bash

# Define variables
read -p "Enter the directory path: " DIR_PATH
read -p "Enter the owner username: " OWNER
read -p "Enter the group name: " GROUP
read -p "Enter the permissions (e.g., 755 or 777): " PERMS

# Ensure the directory exists
mkdir -p "$DIR_PATH"

# Set ownership
chown -R "$OWNER:$GROUP" "$DIR_PATH"

# Set permissions
chmod -R "$PERMS" "$DIR_PATH"

# Set SGID bit to ensure new files inherit the group
chmod g+s "$DIR_PATH"

# Set default ACLs for new files and directories
setfacl -Rdm u::rwX,g::rwX,o::rX "$DIR_PATH"
setfacl -Rm u::rwX,g::rwX,o::rX "$DIR_PATH"

echo "Directory $DIR_PATH has been set up with owner $OWNER, group $GROUP, and permissions $PERMS"

################################### - Manual - #######################################
sudo chown -R user:user /HDD/cloudpioneers/media
sudo chmod -R 755 /HDD/cloudpioneers/media
sudo chmod g+s /HDD/cloudpioneers/media
sudo setfacl -Rdm u::rwx,g::rx,o::rx /HDD/cloudpioneers/media
sudo setfacl -Rm u::rwx,g::rx,o::rx /HDD/cloudpioneers/media
