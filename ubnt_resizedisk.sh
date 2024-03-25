
# list disk
lsblk

# resize partition
sudo parted /dev/sda resizepart 2 xxGB #new size

# resize filesystem
sudo resize2fs /dev/sda2

#reboot
