# Install necessary packages
sudo apt update
sudo apt install -y live-build xorriso squashfs-tools isolinux

# Verify installation
dpkg -l | grep -E 'live-build|xorriso|squashfs-tools|isolinux'

# Create working directory
mkdir ~/live-build
cd ~/live-build

# Mount the original ISO
sudo mkdir -p /mnt/iso
sudo mount -o loop /path/to/your/LNX-DEB12-LIVE.iso /mnt/iso

# Copy ISO contents
mkdir iso
cp -av /mnt/iso/. iso/

# Unmount the original ISO
sudo umount /mnt/iso

# Extract the live system
mkdir -p edit/chroot
sudo unsquashfs -d edit/chroot iso/live/filesystem.squashfs

# Create necessary directories if they don't exist
sudo mkdir -p edit/chroot/{dev,proc,sys}

# Bind mount essential filesystems
sudo mount --bind /dev edit/chroot/dev
sudo mount --bind /proc edit/chroot/proc
sudo mount --bind /sys edit/chroot/sys

# Chroot into the extracted system
sudo chroot edit/chroot

# Inside chroot: Update and upgrade packages
apt update
apt upgrade -y

# Remove machine-specific identifiers
rm -f /etc/machine-id
rm -f /var/lib/dbus/machine-id

# Reset network configuration
rm -f /etc/udev/rules.d/70-persistent-net.rules
echo "debian" > /etc/hostname

# Remove SSH host keys
rm -f /etc/ssh/ssh_host_*

# Clear apt cache and lists
apt clean
rm -rf /var/lib/apt/lists/*

# Remove user-specific files
rm -rf /home/*/.bash_history
rm -rf /root/.bash_history

# Update GRUB configuration to be more generic
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet net.ifnames=0 biosdevname=0"/' /etc/default/grub

# Exit chroot
exit

# Unmount bound filesystems
sudo umount edit/chroot/dev
sudo umount edit/chroot/proc
sudo umount edit/chroot/sys

# Rebuild the squashfs filesystem
sudo mksquashfs edit/chroot iso/live/filesystem.squashfs -comp xz -e boot

# Update ISO metadata
sudo bash -c "cd iso && md5sum `find -type f` > md5sum.txt"

# Rebuild the ISO
sudo xorriso -as mkisofs -r -J -joliet-long -l \
-isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
-partition_offset 16 -A "Debian Live" \
-b isolinux/isolinux.bin -c isolinux/boot.cat \
-no-emul-boot -boot-load-size 4 -boot-info-table \
-o ../LNX-DEB12-LIVE-GENERALIZED.iso iso

# Validate the new ISO
md5sum ../LNX-DEB12-LIVE-GENERALIZED.iso

# Clean up (optional)
sudo rm -rf edit iso

# Troubleshooting steps:

# If 'iso' directory is missing or empty:
ls -l ~/live-build/iso
# If missing, recreate from original ISO

# If ISOLINUX files are missing:
ls -l ~/live-build/iso/isolinux
# If missing, copy from original ISO:
# sudo cp -r /mnt/iso/isolinux ~/live-build/iso/

# If /usr/lib/ISOLINUX/isohdpfx.bin is missing:
ls /usr/lib/ISOLINUX/isohdpfx.bin
# If missing, reinstall isolinux:
# sudo apt install --reinstall isolinux

# If xorriso fails due to missing files, verify ISO structure:
ls -R ~/live-build/iso

# If chroot fails, ensure all necessary directories exist:
ls -l ~/live-build/edit/chroot

# If unable to update/upgrade in chroot, ensure internet connectivity:
ping -c 3 google.com

# If GRUB update fails in chroot, it may be ignorable for live systems

# Always test the resulting ISO in a virtual machine before using it on real hardware
