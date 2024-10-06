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


echo "deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

sudo apt install -y \
    gparted gnome-disk-utility baobab ncdu duf fdisk gdisk parted smartmontools hdparm fio iotop \
    iftop nmon htop atop sysstat ioping bonnie++ gddrescue testdisk extundelete foremost rclone rsync \
    grsync syncthing duplicity timeshift backintime-qt clonezilla fsarchiver partclone partimage p7zip-full \
    zip unzip ark file-roller fdupes rdfind bleachbit secure-delete wipe cryptsetup ecryptfs-utils \
    encfs smbclient cifs-utils samba nfs-common sg3-utils scsitools lsscsi sdparm nvme-cli mdadm lvm2 \
    thin-provisioning-tools xfsprogs btrfs-progs e2fsprogs dosfstools mtools ntfs-3g exfatprogs udftools \
    squashfs-tools f2fs-tools nbd-client open-iscsi targetcli-fb util-linux coreutils \
    dmraid dmsetup multipath-tools bcache-tools zfsutils-linux zfs-fuse \
    reiserfsprogs jfsutils hfsplus hfsprogs nilfs-tools xfsdump \
    fatresize fatsort exfat-fuse exfat-utils \
    nwipe secure-delete srm wipe \
    ddrescue photorec sleuthkit autopsy \
    dar dar-static kdar \
    fuse sshfs curlftpfs bindfs archivemount \
    aufs-tools overlayfs-tools \
    parted gpart gptfdisk \
    quota quotatool \
    acl attr eiciel \
    inotify-tools incron \
    logrotate \
    tmux screen \
    iotop blktrace blkid lsblk \
    hwinfo lshw inxi \
    stress stress-ng fio \
    ethtool
