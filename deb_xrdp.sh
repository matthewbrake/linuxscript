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

############## FIND XSESSION NAME #################################

# Method 1 
[[ -n $SESSION_MANAGER ]] && pid="${SESSION_MANAGER##*/}"
[[ -n $UPSTART_SESSION ]] && pid="${UPSTART_SESSION##*/}"
process_name=$(cat /proc/$pid/cmdline)
pretty_name=$DESKTOP_SESSION

echo "$process_name : $pid : $pretty_name"
# Method 1

# Method 2
List xsessions = ls /usr/share/xsessions/
Get command to start = grep "Exec" /usr/share/xsessions/$XSESSION OUTPUT ABOVE | cut -d "=" -f 2
# Method 2


# Determine xsession by checking for known desktop environments
echo "Determining xsession by checking for known desktop environments..."
for desktop in gnome kde xfce lxde mate cinnamon lxqt; do
  if [ -f "/usr/share/xsessions/${desktop}.desktop" ]; then
    XSESSION_CMD=$(grep "Exec" "/usr/share/xsessions/${desktop}.desktop" | cut -d "=" -f 2)
    break  # Exit loop once a match is found
  fi
done

# Fallback to update-alternatives if no desktop file found
if [ -z "$XSESSION_CMD" ]; then
  echo "No known desktop file found. Using update-alternatives..."
  XSESSION_MANAGER=$(sudo update-alternatives --query x-session-manager | grep "Value: " | cut -d" " -f2)
  XSESSION_CMD=$(basename "$XSESSION_MANAGER")
fi

echo "Found xsession: $XSESSION_CMD"

# Create xsession file for 'rdp'
echo "Creating xsession file for user 'rdp'..."
sudo -u rdp echo "$XSESSION_CMD" > /home/rdp/.xsession
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
