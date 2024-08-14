# Step 1: Unmount the USB boot partition if it's mounted
sudo umount /media/devmon/boot

# Step 2: Mount the boot partition of the image
mkdir -p ~/img_mount/boot  # Create a mount point if it doesn't exist
sudo mount -o loop,offset=$((8192 * 512)) /HDD3/ROMS/Tomato\ Amiga\ Retropie\ 64GB\ 2024/TO.img ~/img_mount/boot

# Step 3: Mount the USB boot partition
sudo mount /dev/sda1 /media/devmon/boot  # Adjust if your USB device is different

# Step 4: Delete all files on the USB boot partition
sudo rm -rf /media/devmon/boot/*

# Step 5: Copy files from the mounted image boot partition to the USB boot partition
sudo cp -r ~/img_mount/boot/* /media/devmon/boot/

# Step 6: Unmount both partitions
sudo umount /media/devmon/boot  # Unmount USB boot partition
sudo umount ~/img_mount/boot     # Unmount image boot partition

# Step 7: Bind mount necessary filesystems for chroot
sudo mount --bind /dev /media/devmon/retropie/dev
sudo mount --bind /proc /media/devmon/retropie/proc
sudo mount --bind /sys /media/devmon/retropie/sys
sudo mount --bind /etc/resolv.conf /media/devmon/retropie/etc/resolv.conf

# Step 8: Chroot into the mounted root filesystem
sudo chroot /media/devmon/retropie

# Step 9: Update package lists
apt update

# Step 10: Upgrade installed packages
apt upgrade -y

# Step 11: Full upgrade (may install/remove packages)
apt full-upgrade -y

# Step 12: Reinstall the Raspberry Pi kernel and boot files
apt install --reinstall raspberrypi-bootloader raspberrypi-kernel

# Step 13: Update the bootloader and kernel to the latest version (optional)
rpi-update

# Step 14: Exit chroot
exit

# Step 15: Unmount the bound filesystems
sudo umount /media/devmon/retropie/dev
sudo umount /media/devmon/retropie/proc
sudo umount /media/devmon/retropie/sys
sudo umount /media/devmon/retropie/etc/resolv.conf
