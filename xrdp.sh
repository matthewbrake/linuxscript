#!/bin/bash

# Script to set up xrdp with a new user and appropriate settings on any system

# Install xrdp and xorgxrdp packages
sudo apt update
sudo apt install -y xrdp xorgxrdp

# 1. Create a new user "rdp" with password "password"
sudo useradd -m -s /bin/bash rdp
echo "rdp:password" | sudo chpasswd

# 2. Add the "rdp" user to necessary groups
# Adjust groups based on your system and requirements
sudo usermod -a -G sudo,ssl-cert rdp

# 3. Automatically determine the desktop environment and create .xsession file

# Function to set the .xsession file based on the detected desktop environment
configure_xsession() {
    local desktop_env

    # Detect available desktop environments
    if command -v gnome-session >/dev/null; then
        desktop_env="gnome-session"
    elif command -v cinnamon-session-cinnamon >/dev/null; then
        desktop_env="cinnamon-session"
    elif command -v startxfce4 >/dev/null; then
        desktop_env="startxfce4"
    elif command -v startkde >/dev/null; then
        desktop_env="startkde"
    elif command -v lxsession >/dev/null; then
        desktop_env="lxsession"
    else
        echo "No compatible desktop environment found. Exiting."
        exit 1
    fi

    # Create .xsession file
    echo "$desktop_env" | sudo tee /home/rdp/.xsession > /dev/null
    sudo chown rdp:rdp /home/rdp/.xsession
}

configure_xsession

# 4. Ensure port 3389 is open in ufw (Uncomplicated Firewall)
if sudo ufw status | grep -q "3389"; then
    echo "Port 3389 is already open."
else
    sudo ufw allow 3389/tcp
fi

# 5. Configure and start xrdp service
sudo systemctl restart xrdp
sudo systemctl enable xrdp

# Set Lockscreen to never 
gsettings set org.cinnamon.desktop.session idle-delay 0

# 6. Verify xrdp service status
sudo systemctl status xrdp


echo "xrdp setup complete. You can now connect to this system using RDP."
