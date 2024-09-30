
# Install Snap
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd
sudo snap install snap-store

# Install Flatpak and Flathub
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install dependencies
sudo apt update
sudo apt install -y ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Desktop
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Download and install Cloudflare WARP
wget https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2023_3_398_1_amd64_7ee2cb3b1c.deb
sudo dpkg -i cloudflare_warp_2023_3_398_1_amd64_7ee2cb3b1c.deb
sudo apt install -f
rm cloudflare_warp_2023_3_398_1_amd64_7ee2cb3b1c.deb
