#!/bin/bash

# Step 1: Create users 'user' and 'ssh'
# Create 'user' with a home directory, bash shell, and set password
sudo useradd -m -s /bin/bash user && echo 'user:password' | sudo chpasswd && sudo usermod -aG root,sudo,docker user

# Create 'ssh' with a home directory, bash shell, and set password
sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && sudo usermod -aG root,sudo,docker ssh

# Step 2: Define target UID and GID for existing users and groups
TARGET_UID=1000  # Replace with your desired UID
TARGET_GID=1000  # Replace with your desired GID

# Step 3: Find existing user with target UID
existing_user=$(getent passwd | awk -F: -v uid="$TARGET_UID" '$3 == uid {print $1}')

# Step 4: Find existing group with target GID
existing_group=$(getent group | awk -F: -v gid="$TARGET_GID" '$3 == gid {print $1}')

# Step 5: If user exists and is NOT 'dietpi', change their UID 
if [ -n "$existing_user" ] && [ "$existing_user" != "dietpi" ]; then
    NEW_UID=65534  # Change to a high, unused UID
    sudo usermod -u "$NEW_UID" "$existing_user"
    echo "User '$existing_user' already had UID $TARGET_UID. Changed to $NEW_UID."
fi

# Step 6: If group exists, and it's not the 'user' group, change its GID
if [ -n "$existing_group" ] && [ "$existing_group" != "user" ]; then
    NEW_GID=65534  # Change to a high, unused GID
    sudo groupmod -g "$NEW_GID" "$existing_group"
    echo "Group '$existing_group' already had GID $TARGET_GID. Changed to $NEW_GID."
fi

# Step 7: Create or update 'user' group with target GID
if ! getent group user >/dev/null; then
    sudo groupadd -g "$TARGET_GID" user
else
    sudo groupmod -g "$TARGET_GID" user
fi

# Step 8: Check if 'user' user exists
if ! getent passwd user >/dev/null; then
    # 'user' doesn't exist, create it
    sudo useradd -m -s /bin/bash -g user -u "$TARGET_UID" -G root,sudo,docker user && echo 'user:password' | sudo chpasswd
else
    # 'user' exists, ensure it has the correct primary group and UID

    # 1. Change primary group if needed
    CURRENT_GID=$(id -g user)
    if [ "$CURRENT_GID" != "$TARGET_GID" ]; then
        sudo gpasswd -d user "$CURRENT_GID"  # Remove user from current primary group
        sudo gpasswd -a user user             # Add user to 'user' group (making it the primary group)
    fi

    # 2. Forcefully change UID if needed
    CURRENT_UID=$(id -u user)
    if [ "$CURRENT_UID" != "$TARGET_UID" ]; then
        sudo usermod -o -u "$TARGET_UID" user
    fi
fi

# Step 9: Check if 'ssh' user exists
if ! getent passwd ssh >/dev/null; then
    # 'ssh' doesn't exist, create it
    sudo useradd -m -s /bin/bash -g user -u 1002 -G root,sudo,docker ssh && echo 'ssh:password' | sudo chpasswd
else
    # 'ssh' exists, ensure it has the correct primary group and UID
    CURRENT_GID=$(id -g ssh)
    if [ "$CURRENT_GID" != "$TARGET_GID" ]; then
        sudo gpasswd -d ssh "$CURRENT_GID"  # Remove user from current primary group
        sudo gpasswd -a ssh user             # Add user to 'user' group (making it the primary group)
    fi
fi

echo "User and group setup complete."

echo "-------- SSH KEYS --------"
mkdir -p /home/root/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys && sudo chown -R user:user ~/.ssh && sudo chmod 700 ~/.ssh && sudo chmod 600 ~/.ssh/authorized_keys
mkdir -p /home/ssh/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys && sudo chown -R user:user home//.ssh && sudo chmod 700 ~/.ssh && sudo chmod 600 ~/.ssh/authorized_keys
mkdir -p /home/user/.ssh && touch /home/user/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys && sudo chown -R user:user ~/.ssh && sudo chmod 700 ~/.ssh && sudo chmod 600 ~/.ssh/authorized_keys
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart sshd
sudo systemctl restart ssh

echo "-------- DIRECTORTIES --------"
# Directories
newdir="/mnt/FS-OMV" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/sftp/sonicbit" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/gdrive-mbrake1994" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima/HDD2" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima/HDD3" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/docker" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/HDD" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/HDD2" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/HDD3" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
