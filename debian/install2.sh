Package aufs-tools is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

Package exfat-utils is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

Package curlftpfs is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'exfat-utils' has no installation candidate
E: Unable to locate package srm
E: Unable to locate package ddrescue
E: Unable to locate package photorec
E: Unable to locate package kdar
E: Package 'curlftpfs' has no installation candidate
E: Package 'aufs-tools' has no installation candidate
E: Unable to locate package overlayfs-tools
E: Unable to locate package gptfdisk
E: Unable to locate package blkid
E: Unable to locate package lsblk
root@cubic:~# 



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
  clonezilla fsarchiver partclone partimage \

  # Data Recovery and Backup
  extundelete foremost rclone rsync grsync syncthing duplicity \
  timeshift backintime-qt photorec \

  # Filesystem and Storage Utilities
  ncdu duf pv btrfs-progs xfsprogs e2fsprogs dosfstools mtools \
  ntfs-3g exfatprogs squashfs-tools f2fs-tools nbd-client \
  open-iscsi targetcli-fb bcache-tools zfsutils-linux zfs-fuse \
  reiserfsprogs jfsutils hfsplus hfsprogs nilfs-tools xfsdump \
  fatresize fatsort exfat-fuse  \
  smbclient cifs-utils samba nfs-common nfs-kernel-server sshfs \
  bindfs archivemount fuse \
  util-linux coreutils dmraid dmsetup quota quotatool acl attr \
  inotify-tools incron logrotate mc \
  p7zip-full zip unzip ark file-roller fdupes rdfind \
  bleachbit secure-delete wipe cryptsetup ecryptfs-utils encfs \
  dar dar-static sleuthkit autopsy \
  tmux screen iotop blktrace \
  stress stress-ng ethtool hwinfo lshw inxi fio
