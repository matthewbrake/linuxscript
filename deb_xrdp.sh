#!/bin/bash

echo "Starting xrdp installation and configuration..."

# Install xrdp
echo "Installing xrdp..."
sudo apt-get update
sudo apt-get install -y xrdp

# Install XFCE if not present (check first to avoid unnecessary installation)
if ! dpkg -l | grep -q xfce4; then
  echo "XFCE not found. Installing..."
  sudo apt-get install -y xfce4
else
  echo "XFCE already installed."
fi

# Create new user 'rdp'
echo "Creating user 'rdp'..."
sudo useradd -m rdp
echo "rdp:password" | sudo chpasswd

# Give 'rdp' user necessary permissions
echo "Setting up permissions for user 'rdp'..."
sudo usermod -aG sudo rdp  
sudo usermod -s /bin/bash rdp  

# Determine xsession (more generic approach)
echo "Determining xsession for user 'rdp'..."
XSESSION_CMD=$(find /usr/share/xsessions ~/.local/share/applications /usr/share/applications -name '*.desktop' -exec grep -hE "Exec=([^ ]+)" {} \; | sed 's/Exec=//' | sort | uniq | head -n 1)
echo "Found xsession: $XSESSION_CMD"

# Create xsession file for 'rdp'
echo "Creating xsession file for user 'rdp'..."
sudo -u rdp echo "$XSESSION_CMD" > /home/rdp/.xsession

# Unblock port 3389 if needed
echo "Checking firewall status for port 3389..."
if sudo ufw status | grep -q 3389; then
  echo "Port 3389 is already open."
else
  echo "Unblocking port 3389..."
  sudo ufw allow 3389/tcp
fi

# Restart xrdp
echo "Restarting xrdp service..."
sudo systemctl restart xrdp
sudo systemctl enable xrdp  

# Show xrdp status
echo "xrdp service status:"
sudo systemctl status xrdp

echo "xrdp installation and configuration complete!"
