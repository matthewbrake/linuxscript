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
    clonezilla p7zip-full mosh qemu-system qemu-utils xterm open-vm-tools \
    xauth x11-xserver-utils dbus-x11 libgl1-mesa-dri xserver-xorg-video-qxl

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
    ipset iptstate mtr nmap openssh-client openssh-server btop \
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

echo "-------- Additional requested packages --------"
sudo apt install -y \
    perl default-jre default-jdk gnupg2 dirmngr preload \
    zram-config ubuntu-restricted-extras linux-intel-iotg-tools-common \
    linux-tools-common ifconfig

echo "-------- ADDITIONAL GUI & TOOLS --------"
sudo apt install -y \
    bleachbit rclone rclone-browser gdebi-core synaptic gimp vlc audacity neovim wireshark \
    chromium firefox-esr thunderbird transmission-gtk deluge qbittorrent libreoffice calibre \
    gparted handbrake krita inkscape blender darktable shotwell geany codeblocks atom \
    virtualbox gnome-boxes steam lutris playonlinux snap

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

echo "-------- INSTALLING DOCKER --------"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install curl git
bash -c "$(curl -fsSL https://get.docker.com)"
sudo apt install docker-compose
echo "Enable Docker Service"
sudo systemctl enable docker.service && sudo systemctl enable containerd.service
echo "Add User to group Docker"
sudo usermod -aG docker user
echo "Add rdp to group Docker"
sudo usermod -aG docker rdp
newgrp

echo "-------- INSTALLING XRDP --------"
wget -qO- github.com/matthewbrake/linuxscript/blob/main/start.sh | sudo bash

echo "-------- INSTALLING OMV + OMV EXTRAS --------"
wget -qO- https://raw.githubusercontent.com/matthewbrake/linuxscript/main/omv.sh | sudo bash

echo "-------- INSTALLING CASA OS --------"
wget -qO- https://get.casaos.io | sudo bash
