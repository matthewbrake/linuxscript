
sudo apt clean && \
sudo apt update && \
sudo apt dist-upgrade -y && \
sudo apt upgrade && \
sudo apt --fix-broken install && \
sudo apt autoclean && \
sudo apt autoremove -y


sudo apt install -y \
build-essential \
busybox \
git \
curl \
wget \
vim \
nano \
htop \
tree \
gnupg \
software-properties-common \
apt-transport-https \
ca-certificates \
openssl \
jq \
dnsutils \
net-tools \
iputils-ping \
tcpdump \
iptables \
traceroute \
uuid-runtime \
zip \
unzip \
tar \
gzip \
bzip2 \
xz-utils \
file \
gnupg2 \
gawk \
gettext \
locales \
strace \
lsof \
sysstat \
time \
watch \
whois \
zstd \
parallel \
parted \
udisks2 \
dmraid \
lvm2 \
cryptsetup \
sshfs \
nfs-common \
nfs-kernel-server \
cifs-utils \
smbclient \
libsmbclient-dev \
samba \
smartmontools \
mmc-utils \
hfsprogs \
ntfs-3g \
mtools \
dosfstools \
gparted \
hdparm \
iotop \
sysstat \
lsscsi \
blktrace \
btrfs-progs \
xfsprogs \
e2fsprogs \
jfsutils \
testdisk \
bleachbit \
deborphan \
gddrescue \
partclone \
rsync \
exfat-fuse \
fuse3 \
rclone \
rclone-browser \
dosfstools \
sg3-utils


sudo useradd -m -s /bin/bash ssh && echo 'ssh:password' | sudo chpasswd && sudo usermod -aG root,ssh,sudo,docker ssh

echo "-------- SSH KEY ADD --------"
mkdir -p /home/ssh/.ssh && touch /home/ssh/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys
mkdir -p /home/user/.ssh && touch /home/user/.ssh/authorized_keys && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyUFXWCropvytbMVP6JNpm2zsdz5MOMYe3MaMNXbxYwdGemjcCeoQlnnhe3CbmDrKNZnkc/hPs9mwUsS6FijSdnXaC4+FELpPXMkRXw9b3KCAJc7xcOIJACTEp5gVdbHzBefWx8+sVqs7iRjwd8n5K9laPOjr4lyj7YC5tY4JzIHzjQBtrx2ZcvTFyzzy3SdapVm1+drBYUweh4BY6ANrDuQAJeYzUPYfWB6vPtSzE3hRbbkJ71SPJFB1aBNGbJbdM65f6VJ/BbMaOZKjE7zPk4VuHabhVAE7kKp6HUwWoVIwxCzUa3goT8gFvWlZXsyn3IM72Y5nyXoDMYu40+v6d rsa-key-20240325" > ~/.ssh/authorized_keys
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart sshd

# Directories
newdir="/mnt/zima" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/docker" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/HDD2" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"

newhostname="PI-SERVER"; echo $newhostname > /etc/hostname && echo "127.0.0.1 $newhostname localhost" > /etc/hosts && echo "::1  localhost ip6-localhost ip6-loopback" >> /etc/hosts
newhostname="PI-SERVER"; ip=$(hostname -I | awk '{print $1}'); echo $newhostname > /etc/hostname && echo "127.0.0.1 $newhostname localhost" > /etc/hosts && echo "::1  localhost ip6-localhost ip6-loopback" >> /etc/hosts && echo "$ip $newhostname" >> /etc/hosts
# Docker
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install curl git
bash -c "$(curl -fsSL https://get.docker.com)"
sudo systemctl enable docker.service && sudo systemctl enable containerd.service
sudo usermod -aG docker user

# Open Media Vault
sudo apt-get update
sudo apt-get upgrade -y
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/preinstall | sudo bash

wget https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install
chmod +x install
sudo ./install -n

# Casa OS Install 
wget -qO- https://get.casaos.io | sudo bash

# WebAdmin
sudo curl -fsSL -o ~/setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh && sudo sh ~/setup-repos.sh && apt-get install webmin --install-recommends


# Oled
sudo raspi-config nonint do_i2c 0

sudo apt update
sudo apt-get install -y python3-dev python3-pip i2c-tools git build-essential libi2c-dev lm-sensors

# Clone Luma and install
mkdir /home/user/drivers 
cd /home/user/drivers
git clone https://github.com/rm-hull/luma.oled.git
cd luma.oled
sudo python3 -m pip install -e .
cd ..

# Install psutil (for system info)
sudo python3 -m pip install psutil

# Clone luma.examples Repository (optional, for testing)
cd ~
git clone https://github.com/rm-hull/luma.examples.git /home/user/drivers
cd /home/user/drivers/luma.examples/examples
sudo python3 setup.py install

