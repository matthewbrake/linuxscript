#!/bin/bash

# Step 1: Install VNC Server
echo "Installing VNC server..."
sudo apt update
sudo apt install -y tightvncserver   # Ubuntu/Debian-based systems
# sudo yum install -y tigervnc-server # CentOS/RHEL-based systems

# Step 2: Configure VNC Server
echo "Configuring VNC server..."
vncserver

# Step 3: Start VNC Server
echo "Starting VNC server..."
vncserver :1

# Step 4: Connect to VNC Server
echo "VNC server is ready to connect."

# Option 1: SSH Tunneling
echo "To connect via SSH tunneling, use the following command on your local machine:"
echo "ssh -L 5901:localhost:5901 -N -f -l user linux_machine_ip"
echo "Then open your VNC client and connect to localhost:5901"

# Option 2: Direct VNC Connection
echo "To connect directly, use a VNC client and connect to linux_machine_ip:5901"
