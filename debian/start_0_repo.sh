#!/bin/bash

DEBIAN_VERSION=$(lsb_release -cs)

echo "--- REPO - ADD Debian Main, Updates, and Security ---"
echo "deb http://deb.debian.org/debian ${DEBIAN_VERSION} main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list.d/debian-main.list
echo "deb http://deb.debian.org/debian ${DEBIAN_VERSION}-updates main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list.d/debian-main.list
echo "deb http://security.debian.org/debian-security ${DEBIAN_VERSION}-security main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list.d/debian-main.list

echo "--- REPO - ADD Backports ---"
echo "deb http://deb.debian.org/debian ${DEBIAN_VERSION}-backports main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list.d/debian-backports.list

echo "--- REPO - ADD Multimedia ---"
echo "deb https://www.deb-multimedia.org ${DEBIAN_VERSION} main non-free" | sudo tee /etc/apt/sources.list.d/deb-multimedia.list
sudo apt-get update -oAcquire::AllowInsecureRepositories=true
sudo apt-get install deb-multimedia-keyring

echo "--- REPO - ADD Flatpak ---"
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "--- REPO - ADD Snap Store ---"
sudo apt install snapd

echo "--- REPO - ADD AppImage Support ---"
sudo apt install libfuse2

echo "--- REPO - ADD Docker ---"
echo "deb [arch=amd64] https://download.docker.com/linux/debian ${DEBIAN_VERSION} stable" | sudo tee /etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "--- REPO - ADD VSCode ---"
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/keyrings/packages.microsoft.gpg

echo "--- REPO - ADD Node.js ---"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

echo "Updating package lists..."
sudo apt update

echo "All repositories added successfully!"
