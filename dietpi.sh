#!/bin/bash

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y 

echo "-------- ESSENTIAL UTILITIES --------"
apt-get install -y mc screen jq nmap netcat telnet redis-tools memcached sysdig ethtool iptraf-ng iftop ngrep nload socat dnsmasq dnsutils netcat-openbsd strace ltrace tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils hwinfo htop glances bmon nmon powertop smem usbtop network-manager bleachbit

echo "-------- ESSENTIAL DEVELOPMENT TOOLS --------"
apt-get install -y build-essential busybox git curl wget vim nano htop tree gnupg software-properties-common apt-transport-https ca-certificates openssl jq dnsutils net-tools iputils-ping tcpdump iptables traceroute uuid-runtime zip unzip tar gzip bzip2 xz-utils file gnupg2 gawk gettext locales strace lsof sysstat time watch whois zstd parallel multitail vnstat

echo "-------- PYTHON DEVELOPMENT --------"
apt-get install -y python3 python3-pip python3-venv python3-dev python3-setuptools python3-wheel

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y

echo "-------- STORAGE UTILITIES --------"
apt-get install -y parted udisks2 dmraid lvm2 cryptsetup sshfs nfs-common nfs-kernel-server cifs-utils smbclient libsmbclient-dev samba smartmontools mmc-utils hfsprogs ntfs-3g mtools dosfstools gparted hdparm iotop sysstat lsscsi blktrace btrfs-progs xfsprogs e2fsprogs jfsutils testdisk bleachbit deborphan dislocker cfdisk ddrescue gddrescue partclone

echo "-------- NEW USER --------"
sudo useradd -m -s /bin/bash user && echo 'user:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker user
sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker ssh

echo "-------- OH MY ZSH CONFIGURATION --------"
apt-get install -y zsh
sed -i 's#:/bin/bash#:/bin/zsh#' /etc/passwd 
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/user/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/user/.zsh/zsh-syntax-highlighting
echo 'source /home/user/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> /home/user/.zshrc
echo 'source /home/user/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> /home/user/.zshrc



echo "-------- SSH KEY ADD --------"
mkdir -p /home/ssh/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys
mkdir -p /home/user/.ssh && touch /home/user/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys

echo "-------- SERVICES ADD --------"
systemctl enable docker.service
systemctl enable containerd.service
usermod -aG docker $USER  # $USER instead of hardcoded 'user'


echo "-------- OMV Preinstall --------"
sudo apt-get update
sudo apt-get upgrade -y
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/preinstall | sudo bash



sudo apt update
sudo apt-get install -y python3-dev python3-pip i2c-tools git build-essential libi2c-dev lm-sensors
sudo usermod -a -G i2c pi

mkdir /drivers
cd /drivers
# Clone and Install luma.oled Library
git clone https://github.com/rm-hull/luma.oled.git
cd luma.oled
sudo python3 -m pip install -e .
cd ..

# Clone luma.examples Repository (optional, for testing)
git clone https://github.com/rm-hull/luma.examples.git

# Install psutil (for system info)
sudo python3 -m pip install psutil


