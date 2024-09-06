#!/bin/bash

echo "-------- CORE UTILITIES --------"
sudo apt install -y mc screen jq nmap netcat telnet redis-tools memcached sysdig ethtool iptraf-ng iftop ngrep nload socat dnsmasq dnsutils netcat-openbsd strace ltrace tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils hwinfo htop glances bmon nmon powertop smem usbtop network-manager bleachbit moreutils pv cut paste sed grep awk xargs rlwrap less bat exa fd-find ripgrep sd silversearcher-ag zoxide ranger lsd \
bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m links2 links nethogs speedtest-cli mtr filezilla ncdu glances atop atopacct lnav lnav-extras glances hstr byobu tmux mosh asciinema asciinema-player youtube-dl yt-dlp \
wget curl aria2 axel httpie procs psutil glances atop iotop iftop nethogs bpytop bashtop glances goaccess ccze lolcat pv tree lnav bat exa fd-find ripgrep

echo "-------- DEVELOPMENT TOOLS --------"
sudo apt install -y build-essential busybox git curl wget vim nano htop tree gnupg software-properties-common apt-transport-https ca-certificates openssl jq dnsutils net-tools iputils-ping tcpdump iptables traceroute uuid-runtime zip unzip tar gzip bzip2 xz-utils file gnupg2 gawk gettext locales strace lsof sysstat time watch whois zstd parallel multitail vnstat \

echo "-------- PYTHON DEVELOPMENT --------"
sudo apt install -y python3 python3-pip python3-venv python3-dev python3-setuptools python3-wheel \

echo "-------- SYSTEM MANAGEMENT --------"
sudo apt install -y open-vm-tools lm-sensors fancontrol \

echo "-------- STORAGE UTILITIES --------"
sudo apt install -y parted udisks2 dmraid lvm2 cryptsetup sshfs nfs-common nfs-kernel-server cifs-utils smbclient libsmbclient-dev samba smartmontools mmc-utils hfsprogs ntfs-3g mtools dosfstools gparted hdparm iotop sysstat lsscsi blktrace btrfs-progs xfsprogs e2fsprogs jfsutils testdisk bleachbit deborphan dislocker cfdisk ddrescue gddrescue partclone \

echo "-------- FILE SYSTEM UTILITIES --------"
sudo apt install -y exfat-fuse fuse3 rclone rclone-browser dosfstools sg3-utils \

echo "-------- NETWORKING TOOLS --------"
sudo apt install -y arp-scan arptables bridge-utils ethtool iperf iperf3 ipset iptstate mtr nmap openssh-client openssh-server tcpdump tshark \

echo "-------- SECURITY TOOLS --------"
sudo apt install -y aide apparmor apparmor-utils auditd clamav fail2ban rkhunter unhide \

echo "-------- SYSTEM UPDATE AND UPGRADE --------"
sudo apt clean && \
sudo apt update && \
sudo apt dist-upgrade -y && \
sudo apt full-upgrade -y && \
sudo apt upgrade -y && \
sudo apt --fix-broken install && \
sudo apt autoclean && \
sudo apt autoremove -y

echo "-------- USER MANAGEMENT --------"
sudo useradd -m -s /bin/bash user && echo 'user:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker ssh
sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker ssh
sudo groupmod -g 1000 user
sudo usermod -u 1000 user
sudo usermod -g 1000 user
sed i " add user group NO PASSWord to sudoer file"
USER=user && \
GROUP=user && \
sudo groupadd -g 1000 $GROUP || sudo groupmod -g 1000 $GROUP && \
sudo useradd -u 1000 -g 1000 -m $USER || sudo usermod -u 1000 -g 1000 $USER

echo "-------- SSH KEY ADD --------"
$SSH_KEY=
$ROOT_SSH_KEY=

mkdir -p /home/root/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys && sudo chown -R user:user ~/.ssh && sudo chmod 700 ~/.ssh && sudo chmod 600 ~/.ssh/authorized_keys
mkdir -p /home/ssh/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys && sudo chown -R user:user home//.ssh && sudo chmod 700 ~/.ssh && sudo chmod 600 ~/.ssh/authorized_keys
mkdir -p /home/user/.ssh && touch /home/user/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys && sudo chown -R user:user ~/.ssh && sudo chmod 700 ~/.ssh && sudo chmod 600 ~/.ssh/authorized_keys
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart sshd
sudo systemctl restart ssh

echo "-------- Directories --------"
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

echo "-------- HOSTNAME --------"
newhostname="PI-SERVER"; echo $newhostname > /etc/hostname && echo "127.0.0.1 $newhostname localhost" > /etc/hosts && echo "::1  localhost ip6-localhost ip6-loopback" >> /etc/hosts
newhostname="PI-SERVER"; ip=$(hostname -I | awk '{print $1}'); echo $newhostname > /etc/hostname && echo "127.0.0.1 $newhostname localhost" > /etc/hosts && echo "::1  localhost ip6-localhost ip6-loopback" >> /etc/hosts && echo "$ip $newhostname" >> /etc/hosts

echo "-------- INSTALL DOCKER --------"
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install curl git
bash -c "$(curl -fsSL https://get.docker.com)"
sudo systemctl enable docker.service && sudo systemctl enable containerd.service
sudo usermod -aG docker user

echo "-------- DOCKER CORE CONTAINERS --------"
# Docker Containers Core
# Portainer Server
#docker run -d \
 # --name portainer_server \
  #-p 8000:8000 \
  #-p 9443:9443 \
  #-v /var/run/docker.sock:/var/run/docker.sock \
  #-v portainer_data:/data \
  #--restart=always \
  #portainer/portainer-ce:latest && \
# Portainer Node
docker run -d \
  --name portainer_agent \
  -p 9001:9001 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  --restart=always \
  portainer/agent:2.20.3 && \
  # File Browser
docker run -d \
  --name filebrowser \
  -p 8085:80 \
  -v filebrowser_data:/config \
  -v filebrowser_db:/database \
  -v /:/srv \
  --restart unless-stopped \
  filebrowser/filebrowser:v2.23.0 && \
  # Watch Tower
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_CLEANUP=true \
  -e WATCHTOWER_INCLUDE_STOPPED=true \
  -e WATCHTOWER_POLL_INTERVAL=300000 \
  -e WATCHTOWER_REVIVE_STOPPED=false \
  --restart unless-stopped \
  containrrr/watchtower:latest && \
  # Cloudflard Tunnel
docker run -d \
  --name cloudflare_tunnel \
  -e TUNNEL_EDGE_IP_VERSION=4 \
  -e TUNNEL_LOGLEVEL=debug \
  -e TUNNEL_METRICS=0.0.0.0:60123 \
  -e TUNNEL_TOKEN=eyJhIjoiZjBiMGZiNTIxZTk0ZTkxYTQzY2VmMmNlNjYxYTlhYWEiLCJ0IjoiYzEyOGQxYzktNjllZi00M2Y1LTgxNDYtMzhjNDA2NzZhYzQ5IiwicyI6Ik0yUTRPREJqTnpFdE5UTmpNaTAwWlRNd0xXSXhaamd0WXpjMVlUTTBaR0kyWVRnMCJ9 \
  -e TUNNEL_TRANSPORT_PROTOCOL=auto \
  --restart no \
  cloudflare/cloudflared:latest tunnel run && \
  # Netdata Node
docker run -d \
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


