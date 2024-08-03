
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
bleachbit \
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
dislocker \
cfdisk \
ddrescue \
gddrescue \
partclone \
linux-utils \
rsync \
lsblk \
exfat-fuse \
fuse3 \
rclone \
rclone-browser \
dosfstools \
sg3-utils

# Directories
newdir="/mnt/zima" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/docker" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"
newdir="/HDD2" && sudo mkdir -p "$newdir" && sudo chown -R 1000:1000 "$newdir" && sudo chmod -R 755 "$newdir" && ls -la "$newdir"

# Docker
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install curl git
bash -c "$(curl -fsSL https://get.docker.com)"
bash -c "$(curl -fsSL https://get.dockstarter.com)"
sudo systemctl enable docker.service && sudo systemctl enable containerd.service
sudo usermod -aG docker user



# Open Media Vault
sudo apt-get update
sudo apt-get upgrade -y
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/preinstall | sudo bash
