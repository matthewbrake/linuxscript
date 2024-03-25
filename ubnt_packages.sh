#!/bin/bash
# Ubuntu Configuration Script

# Update package index and upgrade system
echo "Updating package index and upgrading system..."
sudo apt update
sudo apt upgrade -y

# Utilities (50 packages)
echo "Installing utilities..."
sudo apt install -y \
    curl wget unzip git htop vim nano \
    build-essential make gcc g++ \
    software-properties-common \
    ncdu tree tmux screen \
    zip unzip rar unrar \
    neofetch figlet toilet \
    ranger nnn mc \
    apt-transport-https ca-certificates \
    gnupg-agent software-properties-common \
    dnsutils net-tools iputils-ping \
    man-db manpages-dev \
    ffmpeg vlc \
    ranger w3m elinks lynx \
    speedtest-cli nmap iperf \
    tcpdump wireshark \
    sysstat iotop htop atop \
    chrony ntp \
    dos2unix \
    neovim \
    jq \
    pandoc \
    xclip xsel \
    locate \
    rsync \
    dos2unix \
    bash-completion \
    fonts-powerline \
    libssl-dev libffi-dev python3-dev \
    python3-pip python3-venv \
    nodejs npm \
    ruby-full

# Storage (10 packages)
echo "Installing storage tools..."
sudo apt install -y \
    gparted ntfs-3g exfat-fuse exfat-utils \
    smartmontools testdisk \
    hdparm ddrescue \
    lvm2 \
    zfsutils-linux \
    btrfs-progs

# Tools (20 packages)
echo "Installing tools..."
sudo apt install -y \
    bmon nload iftop iotop iptraf-ng \
    tcpdump wireshark \
    lynis chkrootkit rkhunter \
    nmap nikto metasploit-framework \
    openssl openssh-client openssh-server \
    curl wget \
    git subversion \
    vim nano \
    tmux screen \
    tldr cheat \
    ffmpeg vlc \
    neofetch screenfetch

# Basics (20 packages)
echo "Installing basics..."
sudo apt install -y \
    net-tools iputils-ping dnsutils \
    apt-transport-https ca-certificates \
    gnupg-agent software-properties-common \
    zip unzip rar unrar \
    jq \
    xclip xsel \
    man-db manpages-dev \
    bash-completion \
    rsync \
    locate \
    sysstat iotop htop \
    cron anacron \
    chrony ntp \
    gnupg2 \
    dos2unix

# Dependencies (5 packages)
echo "Installing dependencies..."
sudo apt install -y \
    build-essential libssl-dev libffi-dev python3-dev \
    python3-pip python3-venv \
    nodejs npm \
    ruby-full \
    libpq-dev

# GUI Configuration (Uncomment as needed)
#echo "Configuring GUI..."
#sudo apt install -y ubuntu-desktop

# Web Admin Installation (Uncomment and customize)
#echo "Installing web admin..."
#curl -sSL https://example.com/install.sh | sudo bash

# Cockpit Installation (Uncomment and customize)
#echo "Installing Cockpit..."
#sudo apt install -y cockpit
#sudo systemctl enable --now cockpit.socket

# Optional Optimization Settings (Uncomment and customize)
#echo "Applying optimization settings..."
#sudo sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
#sudo locale-gen
#sudo update-locale LANG=en_US.UTF-8

# Reboot system
echo "Rebooting system..."
sudo reboot
