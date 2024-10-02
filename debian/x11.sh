#!/bin/bash

# Update package lists
sudo apt update

# Install X11-related packages
sudo apt install -y \
    xorg \
    x11-apps \
    x11-utils \
    x11-xserver-utils \
    xauth \
    xterm \
    dbus-x11 \
    libx11-6 \
    libxext6 \
    libxi6 \
    libxtst6 \
    libxrender1 \
    libxmu6 \
    libxpm4 \
    libxt6 \
    xterm

# Configure SSH for X11 forwarding
sudo sed -i 's/#X11Forwarding no/X11Forwarding yes/' /etc/ssh/sshd_config
sudo sed -i 's/#X11DisplayOffset 10/X11DisplayOffset 10/' /etc/ssh/sshd_config
sudo sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart ssh

# Set DISPLAY environment variable
echo 'export DISPLAY=:0' >> ~/.bashrc
source ~/.bashrc

# Install a sample X11 application (xeyes)
sudo apt install -y x11-apps

# Validate X11 setup
echo "Validating X11 setup..."
if xdpyinfo >/dev/null 2>&1; then
    echo "X11 is working correctly."
else
    echo "X11 setup failed. Please check your configuration."
fi

# Test X11 forwarding
echo "Testing X11 forwarding..."
ssh -X localhost xeyes

# Troubleshooting tips
echo "
Troubleshooting tips:
1. Ensure MobaXterm X server is running (look for the colored X icon in the toolbar).
2. Check that X11 forwarding is enabled in MobaXterm SSH session settings.
3. Verify that the DISPLAY variable is set correctly on the remote system.
4. Check SSH logs for any X11 forwarding errors: sudo journalctl -u ssh
5. Try running 'xhost +' on your local machine to allow all connections to X server.
"

# Example of starting a sample X11 app
echo "
To start a sample X11 application, run:
xeyes &
"
