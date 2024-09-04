```bash
echo "-------- CORE UTILITIES --------"
sudo apt install -y mc screen jq nmap netcat telnet redis-tools sysdig ethtool iptraf-ng iftop ngrep nload socat dnsutils netcat-openbsd strace ltrace tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils hwinfo htop glances bmon nmon powertop smem usbtop network-manager bleachbit moreutils pv cut paste sed grep awk xargs rlwrap less bat exa fd-find ripgrep sd silversearcher-ag zoxide ranger lsd \
bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m links2 links nethogs speedtest-cli mtr filezilla ncdu glances atop atopacct lnav lnav-extras glances hstr byobu tmux mosh asciinema asciinema-player youtube-dl yt-dlp \
wget curl aria2 axel httpie procs psutil glances atop iotop iftop nethogs bpytop bashtop glances goaccess ccze lolcat pv tree lnav bat exa fd-find ripgrep genisoimage clonezilla p7zip-full \
  
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

```bash
# User Management
echo "-------- USER MANAGEMENT --------"

# Add user and set password
sudo useradd -m -s /bin/bash user && echo 'user:password' | sudo chpasswd && \
  sudo usermod -aG root,ssh,sudo,docker user

# Add ssh user and set password
sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && \
  sudo usermod -aG root,ssh,sudo,docker ssh

# Set group ID for user
sudo groupmod -g 1000 user
sudo usermod -u 1000 user
sudo usermod -g 1000 user

# Add entry to sudoers file to avoid password prompt for users in group 'user'
sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%user ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

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

```
