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
sudo apt install openmediavault-wetty
sudo apt install openmediavault-apt
sudo apt install openmediavault-apttool
sudo apt install openmediavault-mergerfs
sudo apt install openmediavault-snapraid
sudo apt install openmediavault-zfs
sudo apt install openmediavault-flashmemory
sudo apt install openmediavault-sftp
sudo apt install openmediavault-ftp
sudo apt install openmediavault-rsnapshot
sudo apt install openmediavault-docker-gui
sudo apt install openmediavault-filebrowser
sudo apt install openmediavault-fail2ban
sudo apt install openmediavault-diskstats
sudo apt install openmediavault-remotemount
sudo apt install openmediavault-usbbackup
sudo apt install openmediavault-clamav
sudo apt install openmediavault-route
sudo apt install openmediavault-mount
sudo apt install openmediavault-kernel
sudo apt install openmediavault-apttool
sudo apt install openmediavault-wol
sudo apt install openmediavault-autoshutdown
sudo apt install openmediavault-backup
sudo apt install openmediavault-diskclone
sudo apt install openmediavault-luksencryption
sudo apt install openmediavault-omvextrasorg
sudo apt install openmediavault-resetperms
sudo apt install openmediavault-symlinks
sudo apt install openmediavault-sharerootfs
sudo apt install openmediavault-scripts
sudo apt install openmediavault-usbbackup
sudo apt install openmediavault-wol
