#!/bin/bash

# RasberryPi Preinstall 
sudo apt-get update
sudo apt-get upgrade -y
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/preinstall | sudo bash
# reboot

# Install OMV Latest with OMV Extras
wget https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install
chmod +x install
sudo ./install -n
# reboot
# sudo omv-firstaid
# configure workbench - set port to 81


# Install Plugins 
sudo apt update && sudo apt install -y \
openmediavault-wetty \
openmediavault-apt \
openmediavault-apttool \
openmediavault-mergerfs \
openmediavault-snapraid \
openmediavault-zfs \
openmediavault-flashmemory \
openmediavault-sftp \
openmediavault-ftp \
openmediavault-rsnapshot \
openmediavault-docker-gui \
openmediavault-filebrowser \
openmediavault-fail2ban \
openmediavault-diskstats \
openmediavault-remotemount \
openmediavault-usbbackup \
openmediavault-clamav \
openmediavault-route \
openmediavault-mount \
openmediavault-kernel \
openmediavault-wol \
openmediavault-autoshutdown \
openmediavault-backup \
openmediavault-diskclone \
openmediavault-luksencryption \
openmediavault-omvextrasorg \
openmediavault-resetperms \
openmediavault-symlinks \
openmediavault-sharerootfs \
openmediavault-scripts
