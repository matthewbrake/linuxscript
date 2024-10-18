sudo bash -c 'cat <<EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
EOF'
echo "-------- UBUNTU CORE UTILITIES --------"
sudo apt install -y \
    mc screen jq nmap netcat telnet redis-tools sysdig ethtool \
    iftop ngrep nload socat dnsutils netcat-openbsd strace ltrace \
    tcpdump vnstat dstat iproute2 traceroute mtr-tiny iotop usbutils \
    hwinfo htop glances bmon nmon powertop smem usbtop network-manager \
    bleachbit moreutils pv  sed grep gawk  rlwrap less \
    bat exa fd-find ripgrep silversearcher-ag zoxide ranger \
    bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m \
    links2 links nethogs speedtest-cli mtr filezilla ncdu glances \
    atop lnav hstr byobu tmux mosh asciinema \
    yt-dlp wget curl aria2 axel httpie  goaccess ccze sshpass net-tools \
    lolcat genisoimage \
    clonezilla p7zip-full qemu-system qemu-utils xterm open-vm-tools id-utils \
    xauth x11-xserver-utils dbus-x11 libgl1-mesa-dri xserver-xorg-video-qxl x11-apps \
    extrepo snap flatpak debhelper gftp grub-common grub-pc grub-customizer os-prober \
    unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller open-vm-tools-desktop

echo "-------- DEBIAN CORE UTILITIES --------" 
sudo apt install -y \
    mc screen jq nmap netcat-openbsd telnet redis-tools sysdig ethtool \
    iftop ngrep nload socat dnsutils strace ltrace \
    tcpdump vnstat dstat iproute2 traceroute iotop usbutils \
    hwinfo htop glances bmon nmon powertop smem usbtop network-manager \
    bleachbit moreutils pv sed grep gawk rlwrap less \
    bat exa fd-find ripgrep silversearcher-ag zoxide ranger lsd \
    bc tree wcalc units figlet toilet cmatrix aview elinks lynx w3m \
    links2 links nethogs speedtest-cli filezilla ncdu \
    atop lnav byobu tmux mosh asciinema \
    yt-dlp wget curl aria2 axel httpie goaccess ccze sshpass net-tools \
    lolcat genisoimage \
    clonezilla p7zip-full qemu-system qemu-utils xterm open-vm-tools id-utils \
    xauth x11-xserver-utils dbus-x11 libgl1-mesa-dri xserver-xorg-video-qxl x11-apps \
    mtr grub-common grub-pc os-prober \
    unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller


echo "-------- COMMON UTILITIES (Ubuntu/Debian) --------"
sudo apt install -y \
    openssh-server openssh-client sshfs \
    build-essential vim nano git curl wget htop tree \
    gnupg software-properties-common apt-transport-https \
    ca-certificates openssl jq dnsutils net-tools iputils-ping \
    tcpdump iptables traceroute uuid-runtime zip unzip tar gzip \
    bzip2 xz-utils file gnupg2 gawk gettext locales strace lsof \
    sysstat time watch whois zstd parallel multitail vnstat \
    make gcc g++ gdb linux-headers-$(uname -r) \
    python3 python3-pip python3-venv python3-dev \
    python3-setuptools python3-wheel \
    open-vm-tools lm-sensors fancontrol \
    iptables ufw unattended-upgrades apt-listchanges aptitude \
    parted udisks2 dmraid lvm2 cryptsetup nfs-common \
    nfs-kernel-server cifs-utils smbclient libsmbclient-dev \
    samba smartmontools mmc-utils hfsprogs ntfs-3g mtools \
    dosfstools gparted hdparm iotop sysstat lsscsi blktrace \
    btrfs-progs xfsprogs e2fsprogs jfsutils testdisk bleachbit \
    gnome-disk-utility sg3-utils scsitools \
    gparted gnome-disk-utility ncdu fdisk gdisk parted  smartmontools hdparm fio iotop \
    iftop nmon htop atop sysstat ioping bonnie++ testdisk  foremost rclone rsync \
    grsync syncthing duplicity timeshift backintime-qt clonezilla fsarchiver partclone partimage p7zip-full rar \
    unrar zip unzip ark file-roller fdupes rdfind bleachbit secure-delete wipe  cryptsetup ecryptfs-utils \
    encfs  smbclient cifs-utils samba nfs-common sg3-utils scsitools lsscsi sdparm nvme-cli mdadm lvm2 \
    thin-provisioning-tools xfsprogs btrfs-progs e2fsprogs dosfstools mtools ntfs-3g  udftools \
    squashfs-tools f2fs-tools zfsutils-linux nbd-client  multipath-tools open-iscsi targetcli-fb \
    exfat-fuse fuse3 rclone rclone-browser dosfstools \
    sg3-utils exfatprogs \
    arp-scan arptables bridge-utils ethtool iperf iperf3 \
    ipset iptstate mtr nmap openssh-client openssh-server btop \
    tcpdump tshark rsync \
    aide apparmor apparmor-utils auditd clamav fail2ban nftables \
    rkhunter unhide openssl \
    perl default-jre default-jdk gnupg2 dirmngr preload \
    libarchive-dev libcurl4-gnutls-dev liblzma-dev \
    qtbase5-dev qtbase5-dev-tools qtdeclarative5-dev libqt5svg5-dev qttools5-dev libgnutls28-dev \
    qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-templates2 qml-module-qtquick-window2 qml-module-qtgraphicaleffects

# Removed packages that caused errors or were duplicates.
# Added the new packages for archive management and Qt development.
sudo apt install -y \
    gparted gnome-disk-utility baobab ncdu duf fdisk gdisk parted \
    smartmontools hdparm fio iotop iftop nmon htop atop sysstat \
    gddrescue testdisk extundelete foremost rclone rsync grsync \
    clonezilla fsarchiver partclone partimage p7zip-full zip unzip \
    btrfs-progs xfsprogs e2fsprogs dosfstools mtools ntfs-3g exfatprogs \
    squashfs-tools f2fs-tools nbd-client open-iscsi targetcli-fb \
    lvm2 thin-provisioning-tools mdadm multipath-tools bcache-tools \
    zfsutils-linux zfs-fuse reiserfsprogs jfsutils hfsplus hfsprogs nilfs-tools \
    xfsdump fatresize fatsort exfat-fuse

  smbclient cifs-utils samba nfs-common nfs-kernel-server sshfs \
    bindfs archivemount fuse

    sudo apt install -y \
    util-linux coreutils dmraid dmsetup quota quotatool acl attr eiciel \
    inotify-tools incron logrotate mc (Midnight Commander) \
    stress stress-ng ethtool hwinfo lshw inxi \
    bleachbit secure-delete wipe cryptsetup ecryptfs-utils encfs \
    dar dar-static sleuthkit autopsy \
    tmux screen iotop blktrace

sudo apt update

sudo apt install -y \
    gparted gnome-disk-utility baobab ncdu duf fdisk gdisk parted smartmontools hdparm fio iotop \
    iftop nmon htop atop sysstat ioping bonnie++ gddrescue testdisk extundelete foremost rclone rsync \
    grsync syncthing duplicity timeshift backintime-qt clonezilla fsarchiver partclone partimage p7zip-full \
    zip unzip ark file-roller fdupes rdfind bleachbit secure-delete wipe cryptsetup ecryptfs-utils \
    encfs smbclient cifs-utils samba nfs-common sg3-utils scsitools lsscsi sdparm nvme-cli mdadm lvm2 \
    thin-provisioning-tools xfsprogs btrfs-progs e2fsprogs dosfstools mtools ntfs-3g exfatprogs udftools \
    squashfs-tools f2fs-tools nbd-client open-iscsi targetcli-fb util-linux coreutils \
    dmraid dmsetup multipath-tools bcache-tools zfs-fuse \
    reiserfsprogs jfsutils hfsplus hfsprogs nilfs-tools xfsdump \
    fatresize fatsort exfat-fuse \
    nwipe secure-delete wipe \
    sleuthkit autopsy \
    dar dar-static \
    sshfs bindfs archivemount \
    parted gpart \
    quota quotatool \
    acl attr eiciel \
    inotify-tools incron \
    logrotate \
    tmux screen \
    iotop blktrace \
    hwinfo lshw inxi \
    stress stress-ng fio \
    ethtool


sudo apt update

sudo apt update

sudo apt install -y \
  # Disk and Partition Management
  gparted gnome-disk-utility lsblk dd fdisk gdisk parted sfdisk cgdisk \
  smartmontools hdparm gddrescue testdisk ddrescue \
  lvm2 thin-provisioning-tools mdadm multipath-tools \
  clonezilla fsarchiver partclone partimage
  # Data Recovery and Backup 
sudo apt install -y \
  extundelete foremost rclone rsync grsync syncthing duplicity \
  timeshift backintime-qt photorec
  # Filesystem and Storage Utilities
sudo apt install -y \
  ncdu duf pv btrfs-progs xfsprogs e2fsprogs dosfstools mtools \
  ntfs-3g exfatprogs squashfs-tools f2fs-tools nbd-client \
  open-iscsi targetcli-fb bcache-tools zfsutils-linux \
  reiserfsprogs jfsutils hfsplus hfsprogs nilfs-tools xfsdump \
  fatresize fatsort exfat-fuse  \
  smbclient cifs-utils samba nfs-common nfs-kernel-server sshfs \
  bindfs archivemount \
  util-linux coreutils dmraid dmsetup quota quotatool acl attr \
  inotify-tools incron logrotate mc \
  p7zip-full zip unzip ark file-roller fdupes rdfind \
  bleachbit secure-delete wipe cryptsetup ecryptfs-utils encfs \
  dar dar-static sleuthkit autopsy \
  tmux screen iotop blktrace \
  stress stress-ng ethtool hwinfo lshw inxi fio
