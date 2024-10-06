#!/bin/bash

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
sudo apt clean && \
sudo apt update && \
sudo apt dist-upgrade -y && \
sudo apt full-upgrade -y && \
sudo apt upgrade -y && \
sudo apt --fix-broken install && \
sudo dpkg --configure -a && \
sudo apt autoclean && \
sudo apt --purge autoremove -y

echo "-------- UBUNTU CORE UTILITIES --------"
sudo apt install -y \
    mc screen jq nmap netcat telnet redis-tools sysdig ethtool \
    iftop ngrep nload socat dnsutils netcat-openbsd strace ltrace \
    tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils \
    hwinfo htop glances bmon nmon powertop smem usbtop network-manager \
    bleachbit moreutils pv cut paste sed grep awk xargs rlwrap less \
    bat exa fd-find ripgrep sd silversearcher-ag zoxide ranger \
    bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m \
    links2 links nethogs speedtest-cli mtr filezilla ncdu glances \
    atop atopacct lnav lnav-extras hstr byobu tmux mosh asciinema \
    yt-dlp wget curl aria2 axel httpie procs psutil goaccess ccze sshpass net-tools \
    lolcat pv tree lnav bat exa fd-find ripgrep genisoimage \
    clonezilla p7zip-full mosh qemu-system qemu-utils xterm open-vm-tools id-utils \
    xauth x11-xserver-utils dbus-x11 libgl1-mesa-dri xserver-xorg-video-qxl x11-apps \
    extrepo snap flatpak debhelper gftp

# Debian 12
echo "-------- DEBIAN CORE UTILITIES --------"
sudo apt install -y \
    mc screen jq nmap netcat-openbsd telnet redis-tools sysdig ethtool \
    iftop ngrep nload socat dnsutils strace ltrace \
    tcpdump vnstat dstat iproute2 traceroute iotop usbutils \
    hwinfo htop glances bmon nmon powertop smem usbtop network-manager \
    bleachbit moreutils pv sed grep gawk rlwrap less \
    bat exa fd-find ripgrep sd silversearcher-ag zoxide ranger lsd \
    bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m \
    links2 links nethogs speedtest-cli filezilla ncdu \
    atop lnav byobu tmux mosh asciinema \
    yt-dlp wget curl aria2 axel httpie goaccess ccze sshpass net-tools \
    lolcat genisoimage \
    clonezilla p7zip-full qemu-system qemu-utils xterm open-vm-tools id-utils \
    xauth x11-xserver-utils dbus-x11 libgl1-mesa-dri xserver-xorg-video-qxl x11-apps \
    mtr

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
    iptables ufw unattended-upgrades apt-listchanges aptitude

echo "-------- STORAGE UTILITIES --------"
sudo apt install -y \
    parted udisks2 dmraid lvm2 cryptsetup sshfs nfs-common \
    nfs-kernel-server cifs-utils smbclient libsmbclient-dev \
    samba smartmontools mmc-utils hfsprogs ntfs-3g mtools \
    dosfstools gparted hdparm iotop sysstat lsscsi blktrace \
    btrfs-progs xfsprogs e2fsprogs jfsutils testdisk bleachbit \
    deborphan dislocker cfdisk ddrescue gddrescue partclone \
    gnome-disk-utility sg3-utils scsitools
# Debian/ubuntu
sudo apt install -y \
    gparted gnome-disk-utility baobab ncdu duf df du fdisk gdisk parted lsblk blkid smartmontools hdparm fio iotop \
    iftop nmon htop atop sysstat ioping bonnie++ ddrescue testdisk photorec extundelete foremost rclone rsync \
    grsync syncthing duplicity timeshift backintime-qt clonezilla fsarchiver partclone partimage p7zip-full rar \
    unrar zip unzip ark file-roller fdupes rdfind bleachbit secure-delete wipe shred cryptsetup ecryptfs-utils \
    encfs veracrypt smbclient cifs-utils samba nfs-common sg3-utils scsitools lsscsi sdparm nvme-cli mdadm lvm2 \
    thin-provisioning-tools xfsprogs btrfs-progs e2fsprogs dosfstools mtools ntfs-3g exfat-utils udftools \
    squashfs-tools f2fs-tools zfsutils-linux nbd-client iscsi-initiator-utils multipath-tools open-iscsi targetcli-fb

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
    aide apparmor apparmor-utils auditd clamav fail2ban nftables  \
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
    linux-tools-common ifconfig \
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
sudo apt --purge autoremove -y


echo "-------- AUTO APT UPDATE --------"
sudo apt-get update && \
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" && \
sudo apt-get autoremove -y && \
sudo apt-get autoclean

echo "--------  APT FAST INSTALL DEB --------"
# APT FAST
/bin/bash -c "$(curl -sL https://git.io/vokNn)"

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
echo "Add ssh to group Docker"
sudo usermod -aG docker ssh
newgrp
sudo systemctl status docker

echo "-------- INSTALLING XRDP --------"
wget -qO- github.com/matthewbrake/linuxscript/blob/main/start.sh | sudo bash

echo "-------- INSTALLING OMV + OMV EXTRAS --------"
wget -qO- https://raw.githubusercontent.com/matthewbrake/linuxscript/main/omv.sh | sudo bash

echo "-------- INSTALLING CASA OS --------"
wget -qO- https://get.casaos.io | sudo bash

echo "-------- INSTALLING WEBADMIN --------"
# Webadmin E: needs root 
sudo -i
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
sh setup-repos.sh && \
apt-get install webmin --install-recommends -y && \
sudo systemctl enable webdmin
sudo systemctl start webdmin
sudo systemctl status webdmin

echo "-------- INSTALLING X11 --------"
apt install cygutils-x11 dbus-x11 emacs-x11 gambas3-gb-desktop-x11 girepository-x11 gnuplot-x11 groff-x11 kwin libqt5x11extras-devel libqt5x11extras5 libx11-devel libx11-doc libx11-xcb-devel libx11-xcb1 libx11_6 \
pulseaudio-module-x11 pulseaudio-utils qt5-x11extras-doc t1lib-x11 x11perf x11vnc xorg-x11-fonts-cyrillic xorg-x11-fonts-dpi100 xorg-x11-fonts-dpi75 xorg-x11-fonts-ethiopic xorg-x11-fonts-misc xorg-x11-fonts-type1 -y
echo "-------- DOCKER CORE CONTAINERS --------"
# Docker Containers Core
# Portainer Server
docker create \
  --name portainer_server \
  -p 9000:9000 \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --restart=always \
  portainer/portainer-ce:latest && \

# Portainer Node
docker create \
  --name portainer_agent \
  -p 9001:9001 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  --restart=always \
  portainer/agent:2.20.3 && \

# File Browser
docker create \
  --name filebrowser \
  -p 8085:80 \
  -v filebrowser_data:/config \
  -v filebrowser_db:/database \
  -v /:/srv \
  --restart unless-stopped \
  filebrowser/filebrowser:v2.23.0 && \

# Watch Tower
docker create \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_CLEANUP=true \
  -e WATCHTOWER_INCLUDE_STOPPED=true \
  -e WATCHTOWER_POLL_INTERVAL=300000 \
  -e WATCHTOWER_REVIVE_STOPPED=false \
  --restart unless-stopped \
  containrrr/watchtower:latest && \

# Cloudflare Tunnel
docker create \
  --name cloudflare_tunnel \
  -e TUNNEL_EDGE_IP_VERSION=4 \
  -e TUNNEL_LOGLEVEL=debug \
  -e TUNNEL_METRICS=0.0.0.0:60123 \
  -e TUNNEL_TOKEN=eyJhIjoiZjBiMGZiNTIxZTk0ZTkxYTQzY2VmMmNlNjYxYTlhYWEiLCJ0IjoiYzEyOGQxYzktNjllZi00M2Y1LTgxNDYtMzhjNDA2NzZhYzQ5IiwicyI6Ik0yUTRPREJqTnpFdE5UTmpNaTAwWlRNd0xXSXhaamd0WXpjMVlUTTBaR0kyWVRnMCJ9 \
  -e TUNNEL_TRANSPORT_PROTOCOL=auto \
  --restart no \
  cloudflare/cloudflared:latest tunnel run \
&& \
  # Netdata Node
docker create \
  --name=netdata_node \
  --pid=host \
  --network=host \
  -v netdataconfig:/etc/netdata \
  -v netdatalib:/var/lib/netdata \
  -v netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  -v /var/log:/host/var/log:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --restart unless-stopped \
  --cap-add SYS_PTRACE \
  --cap-add SYS_ADMIN \
  --security-opt apparmor=unconfined \
  -e NETDATA_CLAIM_TOKEN=wZxBq8CQ_J8UZCwbKKvXyewyZwSkAdlnCu0K83K_GEU7iEu6ytoGJQ1JsKqleeqjq80zEt583UO0i2jnnoIZ3yvTAGx0ZzzYIq47xVUI3wp1fLWvQxRSbECnSNOrZhYxjaeaxIw \
  -e NETDATA_CLAIM_URL=https://app.netdata.cloud \
  -e NETDATA_CLAIM_ROOMS=6c47f021-fce6-478d-866e-25642c69e623 \
#-e= NETDATA_HOSTNAME=LNX
  --restart no \
  netdata/netdata:edge
# Docker Start containers
docker start portainer_server portainer_agent filebrowser watchtower cloudflare_tunnel netdata_node


