#!/bin/bash

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y 

echo "-------- ESSENTIAL UTILITIES --------"
apt-get install -y mc screen jq nmap netcat telnet redis-tools memcached sysdig ethtool iptraf-ng iftop ngrep nload socat dnsmasq dnsutils netcat-openbsd strace ltrace tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils hwinfo htop glances bmon nmon powertop smem usbtop network-manager

echo "-------- ESSENTIAL DEVELOPMENT TOOLS --------"
apt-get install -y build-essential busybox git curl wget vim nano htop tree gnupg software-properties-common apt-transport-https ca-certificates openssl jq dnsutils net-tools iputils-ping tcpdump iptables traceroute uuid-runtime zip unzip tar gzip bzip2 xz-utils file gnupg2 gawk gettext locales strace lsof sysstat time watch whois zstd parallel multitail vnstat

echo "-------- PYTHON DEVELOPMENT --------"
apt-get install -y python3 python3-pip python3-venv python3-dev python3-setuptools python3-wheel

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y

echo "-------- STORAGE UTILITIES --------"
apt-get install -y parted udisks2 dmraid lvm2 cryptsetup sshfs nfs-common nfs-kernel-server cifs-utils smbclient libsmbclient-dev samba smartmontools mmc-utils hfsprogs ntfs-3g mtools dosfstools gparted hdparm iotop sysstat lsscsi blktrace btrfs-progs xfsprogs e2fsprogs jfsutils testdisk bleachbit deborphan dislocker cfdisk ddrescue gddrescue partclone

echo "-------- OH MY ZSH CONFIGURATION --------"
apt-get install -y zsh
sed -i 's#:/bin/bash#:/bin/zsh#' /etc/passwd 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
source ~/.zshrc

echo "-------- NEW USER --------"
sudo useradd -m -s /bin/bash user && echo 'user:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker user
sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker ssh

echo "-------- SSH KEY ADD --------"
mkdir -p /home/ssh/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys
mkdir -p /home/user/.ssh && touch /home/user/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys

echo "-------- DOCKER INSTALLATION --------"
apt-get install -y curl git
bash -c "$(curl -fsSL https://get.docker.com)"
systemctl enable docker.service
systemctl enable containerd.service
usermod -aG docker $USER  # $USER instead of hardcoded 'user'
