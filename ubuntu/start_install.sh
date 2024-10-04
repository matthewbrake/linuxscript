sudo apt purge \
  cinnamon* \
  gnome-* \
  mate-* \
  xfce4* \
  light-locker* \
  lightdm* \
  papirus-icon-theme \
  yaru-theme-icon \
  breeze* \
  greybird-gtk-theme \
  *-icon-theme \
  fonts-*
# DOCKER DESKTOP
sudo apt update && sudo apt install -y software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && sudo apt install -y docker-desktop
# APT FAST
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast

# VLC / KVM PLAYER
apt install vlc
# TOR
sudo apt update
sudo apt install torbrowser-launcher
# post man
sudo snap install postman
# VSCODE
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null && echo "deb [signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && sudo apt update && sudo apt install -y code
