#!/bin/bash

wget linuxiso.iso 
# Set variables
ISO_PATH="/path/to/debian-12-live.iso"
CUSTOM_PATH="$HOME/custom-debian"
OUTPUT_ISO="/mnt/zima/HDD/backups/images/lnx-deb-live-9-24.iso"

# 1. Mount ISO and copy contents
sudo mkdir /mnt/iso
sudo mount -o loop "$ISO_PATH" /mnt/iso
mkdir "$CUSTOM_PATH"
cp -av /mnt/iso/* "$CUSTOM_PATH/"

# 2. Extract squashfs filesystem
sudo unsquashfs "$CUSTOM_PATH/live/filesystem.squashfs"
sudo mv squashfs-root "$CUSTOM_PATH/chroot"

# 3. Prepare for chroot
sudo mount --bind /dev "$CUSTOM_PATH/chroot/dev"
sudo mount --bind /proc "$CUSTOM_PATH/chroot/proc"
sudo mount --bind /sys "$CUSTOM_PATH/chroot/sys"
sudo cp /etc/resolv.conf "$CUSTOM_PATH/chroot/etc/"

# 4. Chroot and customize
sudo chroot "$CUSTOM_PATH/chroot" /bin/bash << EOF
# Update and install packages
apt update
apt install -y package1 package2 package3

# Create folders and users
mkdir -p /home/newuser
useradd -m -s /bin/bash newuser
echo "newuser:password" | chpasswd

# Clean up
apt clean
rm -rf /tmp/* /var/tmp/*
exit
EOF

# 5. Unmount and clean up
sudo umount "$CUSTOM_PATH/chroot/dev"
sudo umount "$CUSTOM_PATH/chroot/proc"
sudo umount "$CUSTOM_PATH/chroot/sys"

# 6. Repack squashfs filesystem
sudo mksquashfs "$CUSTOM_PATH/chroot" "$CUSTOM_PATH/live/filesystem.squashfs" -comp xz -e boot

# 7. Update md5sum
cd "$CUSTOM_PATH"
sudo bash -c "find -type f -print0 | xargs -0 md5sum > md5sum.txt"

# 8. Create new ISO
sudo xorriso -as mkisofs -r -J -joliet-long -l -cache-inodes -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
    -partition_offset 16 -A "Debian Live" -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot \
    -boot-load-size 4 -boot-info-table -o "$OUTPUT_ISO" "$CUSTOM_PATH"

# 9. Verify the ISO
isoinfo -d -i "$OUTPUT_ISO"

# Clean up
sudo umount /mnt/iso
sudo rmdir /mnt/iso
