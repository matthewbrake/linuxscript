# Update package lists
sudo apt update

# Upgrade all packages, including the kernel
sudo apt full-upgrade

# Reboot to apply changes
sudo reboot

# Check current kernel version
uname -r

# Update firmware (use with caution, can be unstable)
sudo rpi-update

# Update to a specific kernel branch (e.g., 6.6)
sudo rpi-update rpi-6.6.y

# Fix corrupt filesystems
sudo fsck -y /dev/mmcblk0p2

# Repair package manager
sudo apt --fix-broken install

# Reinstall Raspberry Pi-specific packages
sudo apt install --reinstall raspberrypi-bootloader raspberrypi-kernel

# Update GPU firmware
sudo rpi-eeprom-update -a

# Check for and install firmware updates
sudo rpi-eeprom-update

# Force reinstall of video drivers
sudo apt install --reinstall libgl1-mesa-dri

# Rebuild and update kernel modules
sudo depmod -a

# Clear package cache to free up space
sudo apt clean

# Remove old kernel versions (use with caution)
sudo apt autoremove --purge

# Update config.txt (if needed)
sudo nano /boot/config.txt

# Check for any held packages
sudo apt-mark showhold

# Update Raspberry Pi OS to latest version
sudo apt dist-upgrade

# Repair broken symlinks
sudo ln -s /opt/vc/lib/libbcm_host.so /usr/lib/libbcm_host.so.0

# Update VideoCore libraries
sudo apt install --reinstall libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin

# Check for and fix missing dependencies
sudo apt-get install -f
