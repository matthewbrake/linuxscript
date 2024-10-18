# Opimizations
sudo apt update && sudo apt install preload zram-config irqbalance mesa-utils vulkan-tools ffmpeg libavcodec-extra gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg tlp powertop lm-sensors

# SNAP STORE 
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd
sudo snap install snapd

# TAILSCALE 
curl -fsSL https://tailscale.com/install.sh | sh

# FLATPACK
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install flatpak
# DOCKER DESKTOP
sudo apt update && sudo apt install -y software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && sudo apt install -y docker-desktop
# APT FAST
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast

# VLC / KVM PLAYER
apt install vlc

# CUBIC 
sudo apt-add-repository universe
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install --no-install-recommends cubic

# TOR
sudo apt update
sudo apt install torbrowser-launcher

# POSTMAN
sudo snap install postman

# VSCODE
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null && echo "deb [signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && sudo apt update && sudo apt install -y code

# CLOUDFLARE GUI - LINUX MINT
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ jammy main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update && sudo apt-get install cloudflare-warp

# NEXTCLOUD
wget https://github.com/nextcloud-releases/desktop/releases/download/v3.14.1/Nextcloud-3.14.1-x86_64.AppImage && chmod +x Nextcloud-3.14.1-x86_64.AppImage && ./Nextcloud-3.14.1-x86_64.AppImage

# ONLY OFICE
sudo apt-get update && sudo apt-get install -y curl && curl -fsSL https://download.onlyoffice.com/install/desktop/linux/onlyoffice-desktopeditors.gpg | sudo gpg --dearmor -o /usr/share/keyrings/onlyoffice-desktopeditors.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/onlyoffice-desktopeditors.gpg] https://download.onlyoffice.com/repo/debian squeeze main" | sudo tee /etc/apt/sources.list.d/onlyoffice-desktopeditors.list && sudo apt-get update && sudo apt-get install -y onlyoffice-desktopeditors

# WAZUH
WAZUH_MANAGER="<MANAGER_IP>" curl -s https://packages.wazuh.com/4.x/apt/key/GPG-KEY-WAZUH | apt-key add - && echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list && apt-get update && apt-get install wazuh-agent -y
