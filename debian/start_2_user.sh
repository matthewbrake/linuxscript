#!/bin/bash

# Change Root password 
sudo sh -c 'echo "root:password" | chpasswd'
# Create 'user' with a home directory, bash shell, and set password
sudo useradd -m -s /bin/bash user && echo 'user:password' | sudo chpasswd && sudo usermod -aG root,sudo,docker user
# Create 'ssh' with a home directory, bash shell, and set password
sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && sudo usermod -aG root,sudo,docker ssh

# Sudo group no password when running sudo command
echo "%sudo ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/nopasswd_sudo && sudo chmod 440 /etc/sudoers.d/nopasswd_sudo
########################################################   V2 USER / GROUP 1000 CHECK and CREATE ########################################################
#!/bin/bash

# Function to create or update a user
create_or_update_user() {
    local username=$1
    local uid=$2
    local primary_group=$3
    local password=$4

    if id "$username" &>/dev/null; then
        sudo usermod -u "$uid" -g "$primary_group" "$username"
    else
        sudo useradd -m -s /bin/bash -u "$uid" -g "$primary_group" "$username"
    fi
    echo "$username:$password" | sudo chpasswd
    sudo usermod -aG root,sudo,docker "$username"
}

# Find current user with UID 1000
current_user=$(id -nu 1000 2>/dev/null)

# If a user with UID 1000 exists and it's not 'user', change its UID
if [ -n "$current_user" ] && [ "$current_user" != "user" ]; then
    new_uid=$(sudo cat /etc/passwd | awk -F: '{print $3}' | sort -n | tail -n 1)
    new_uid=$((new_uid + 1))
    sudo usermod -u "$new_uid" "$current_user"
    echo "Changed UID of $current_user from 1000 to $new_uid"
fi

# Find current group with GID 1000
current_group=$(getent group 1000 | cut -d: -f1)

# If a group with GID 1000 exists and it's not 'user', change its GID
if [ -n "$current_group" ] && [ "$current_group" != "user" ]; then
    new_gid=$(getent group | awk -F: '{print $3}' | sort -n | tail -n 1)
    new_gid=$((new_gid + 1))
    sudo groupmod -g "$new_gid" "$current_group"
    echo "Changed GID of $current_group from 1000 to $new_gid"
fi

# Create or update 'user' group with GID 1000
if getent group user >/dev/null; then
    sudo groupmod -g 1000 user
else
    sudo groupadd -g 1000 user
fi

# Create or update 'user' with UID 1000 and primary group 'user'
create_or_update_user "user" 1000 "user" "password"

# Create or update 'ssh' user with UID 1002 and primary group 'user'
create_or_update_user "ssh" 1002 "user" "password"


# Add home to bashrc for user
echo 'cd ~' >> /home/user/.bashrc
echo 'cd ~' >> /home/ssh/.bashrc
echo 'cd ~' >> /root/.bashrc
echo "User and group setup complete."
########################################################   V2 USER / GROUP 1000 CHECK and CREATE ########################################################



########################################################   V1 USER / GROUP 1000 CHECK and CREATE ########################################################

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
########################################################   V1 USER / GROUP 1000 CHECK and CREATE ########################################################



# Add entry to sudoers file to avoid password prompt for users in group 'user'
sudo sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
# Alternative method using visudo (recommended)
# visudo -f /etc/sudoers -c 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%user ALL=(ALL) NOPASSWD: ALL/'

# SSH Key Addition
echo "-------- SSH KEY ADD --------"

# Define SSH keys
SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325"
ROOT_SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325"

# Root
su root
# Add SSH keys to authorized_keys files
mkdir -p /home/user/.ssh
echo "$SSH_KEY" > /home/user/.ssh/authorized_keys
sudo chown -R user:user /home/user/.ssh
sudo chmod 700 /home/user/.ssh
sudo chmod 600 /home/user/.ssh/authorized_keys

mkdir -p /home/ssh/.ssh
echo "$SSH_KEY" > /home/ssh/.ssh/authorized_keys
sudo chown -R ssh:ssh /home/ssh/.ssh
sudo chmod 700 /home/ssh/.ssh
sudo chmod 600 /home/ssh/.ssh/authorized_keys

# Add root's SSH key to authorized_keys file (if needed)
mkdir -p /root/.ssh
echo "$SSH_KEY" > /root/.ssh/authorized_keys
sudo chown -R root:root /root/.ssh
sudo chmod 700 /root/.ssh
sudo chmod 600 /root/.ssh/authorized_keys

# Restart SSH service
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
# Restart SSH service (if necessary)
sudo systemctl restart ssh

echo "-------- HOSTNAME --------"
newhostname="PI-SERVER"; echo $newhostname > /etc/hostname && echo "127.0.0.1 $newhostname localhost" > /etc/hosts && echo "::1  localhost ip6-localhost ip6-loopback" >> /etc/hosts
newhostname="PI-SERVER"; ip=$(hostname -I | awk '{print $1}'); echo $newhostname > /etc/hostname && echo "127.0.0.1 $newhostname localhost" > /etc/hosts && echo "::1  localhost ip6-localhost ip6-loopback" >> /etc/hosts && echo "$ip $newhostname" >> /etc/hosts



echo "-------- DIRECTORTIES --------"
sudo chown -R root:users /mnt && sudo chmod -R 0777 /mnt
# Directories
newdir="/mnt/fs-omv" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima/sftp/sonicbit" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima/gdrive-mbrake1994" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/mnt/zima/HDD" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/docker" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/HDD" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
