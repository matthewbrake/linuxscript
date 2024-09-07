#!/bin/bash

echo "-------- CORE UTILITIES --------"
sudo apt install -y \
    mc screen jq nmap netcat telnet redis-tools sysdig ethtool \
    iftop ngrep nload socat dnsutils netcat-openbsd strace ltrace \
    tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils \
    hwinfo htop glances bmon nmon powertop smem usbtop network-manager \
    bleachbit moreutils pv cut paste sed grep awk xargs rlwrap less \
    bat exa fd-find ripgrep sd silversearcher-ag zoxide ranger lsd \
    bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m \
    links2 links nethogs speedtest-cli mtr filezilla ncdu glances \
    atop atopacct lnav lnav-extras hstr byobu tmux mosh asciinema \
    yt-dlp wget curl aria2 axel httpie procs psutil goaccess ccze \
    lolcat pv tree lnav bat exa fd-find ripgrep genisoimage \
    clonezilla p7zip-full mosh qemu-system qemu-utils

echo "-------- DEVELOPMENT TOOLS --------"
sudo apt install -y \
    build-essential busybox git curl wget vim nano htop tree \
    gnupg software-properties-common apt-transport-https \
    ca-certificates openssl jq dnsutils net-tools iputils-ping \
    tcpdump iptables traceroute uuid-runtime zip unzip tar gzip \
    bzip2 xz-utils file gnupg2 gawk gettext locales strace lsof \
    sysstat time watch whois zstd parallel multitail vnstat \
    make gcc g++ gdb 

echo "-------- PYTHON DEVELOPMENT --------"
sudo apt install -y \
    python3 python3-pip python3-venv python3-dev \
    python3-setuptools python3-wheel pipx

echo "-------- SYSTEM MANAGEMENT --------"
sudo apt install -y \
    open-vm-tools lm-sensors fancontrol \
    iptables ufw unattended-upgrades apt-listchanges

echo "-------- STORAGE UTILITIES --------"
sudo apt install -y \
    parted udisks2 dmraid lvm2 cryptsetup sshfs nfs-common \
    nfs-kernel-server cifs-utils smbclient libsmbclient-dev \
    samba smartmontools mmc-utils hfsprogs ntfs-3g mtools \
    dosfstools gparted hdparm iotop sysstat lsscsi blktrace \
    btrfs-progs xfsprogs e2fsprogs jfsutils testdisk bleachbit \
    deborphan dislocker cfdisk ddrescue gddrescue partclone \
    gnome-disk-utility

echo "-------- FILE SYSTEM UTILITIES --------"
sudo apt install -y \
    exfat-fuse fuse3 rclone rclone-browser dosfstools \
    sg3-utils exfatprogs

echo "-------- NETWORKING TOOLS --------"
sudo apt install -y \
    arp-scan arptables bridge-utils ethtool iperf iperf3 \
    ipset iptstate mtr nmap openssh-client openssh-server \
    tcpdump tshark rsync

echo "-------- SECURITY TOOLS --------"
sudo apt install -y \
    aide apparmor apparmor-utils auditd clamav fail2ban \
    rkhunter unhide openssl

echo "-------- Additional requested packages --------"
sudo apt install -y \
    perl default-jre default-jdk gnupg2 dirmngr preload \
    zram-config ubuntu-restricted-extras linux-intel-iotg-tools-common \
    linux-tools-common ifconfig

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
sudo apt clean && \
sudo apt update && \
sudo apt dist-upgrade -y && \
sudo apt full-upgrade -y && \
sudo apt upgrade -y && \
sudo apt --fix-broken install && \
sudo dpkg --configure -a && \
sudo apt autoclean && \
sudo apt autoremove -y

# User Management
echo "-------- USER MANAGEMENT --------"

#!/bin/bash

TARGET_UID=1000
TARGET_GID=1000

# Find existing user with target UID
existing_user=$(getent passwd | awk -F: -v uid="$TARGET_UID" '$3 == uid {print $1}')

# Find existing group with target GID
existing_group=$(getent group | awk -F: -v gid="$TARGET_GID" '$3 == gid {print $1}')

# If user exists and is NOT 'dietpi', change their UID 
if [ -n "$existing_user" ] && [ "$existing_user" != "dietpi" ]; then
    NEW_UID=65534  # Change to a high, unused UID
    sudo usermod -u "$NEW_UID" "$existing_user"
    echo "User '$existing_user' already had UID $TARGET_UID. Changed to $NEW_UID."
fi

# If group exists, and it's not the 'user' group, change its GID
if [ -n "$existing_group" ] && [ "$existing_group" != "user" ]; then
    NEW_GID=65534  # Change to a high, unused GID
    sudo groupmod -g "$NEW_GID" "$existing_group"
    echo "Group '$existing_group' already had GID $TARGET_GID. Changed to $NEW_GID."
fi

# Create or update 'user' group with target GID
if ! getent group user >/dev/null; then
  sudo groupadd -g "$TARGET_GID" user
else
  sudo groupmod -g "$TARGET_GID" user
fi

# Check if 'user' user exists
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

# Add entry to sudoers file to avoid password prompt for users in group 'user'
sudo sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
# Alternative method using visudo (recommended)
# visudo -f /etc/sudoers -c 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%user ALL=(ALL) NOPASSWD: ALL/'

# SSH Key Addition
echo "-------- SSH KEY ADD --------"

# Define SSH keys
SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325"
ROOT_SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325"

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
echo "$ROOT_SSH_KEY" > /root/.ssh/authorized_keys
sudo chown -R root:root /root/.ssh
sudo chmod 700 /root/.ssh
sudo chmod 600 /root/.ssh/authorized_keys

# Restart SSH service
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Restart SSH service (if necessary)
sudo systemctl restart ssh

