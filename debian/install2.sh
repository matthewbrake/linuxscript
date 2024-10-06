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
