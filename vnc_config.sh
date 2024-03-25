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

iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 5901 -j ACCEPT

# Step 4: Connect to VNC Server
echo "VNC server is ready to connect."

# Option 1: SSH Tunneling
echo "To connect via SSH tunneling, use the following command on your local machine:"
echo "ssh -L 5901:localhost:5901 -N -f -l user linux_machine_ip"
echo "Then open your VNC client and connect to localhost:5901"

# Option 2: Direct VNC Connection
echo "To connect directly, use a VNC client and connect to linux_machine_ip:5901"



###### ADD USER 

#!/bin/bash

# Step 1: Install VNC Server
echo "Installing VNC server..."
sudo apt update
sudo apt install -y tightvncserver   # Ubuntu/Debian-based systems
# sudo yum install -y tigervnc-server # CentOS/RHEL-based systems

# Step 2: Configure VNC Server
echo "Configuring VNC server..."
vncserver

# Step 3: Create a New VNC User with Password
echo "Creating a new VNC user..."
sudo adduser vncuser
sudo su - vncuser -c 'echo "vncuser_password" | vncpasswd -f > ~/.vnc/passwd'
sudo chmod 600 /home/vncuser/.vnc/passwd

# Step 4: Start VNC Server on Display :1
echo "Starting VNC server..."
vncserver :1 -geometry 1920x1080 -depth 24

# Step 5: Open Port 5901 on Firewall
echo "Opening port 5901 on firewall..."
sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 5901 -j ACCEPT
sudo iptables-save > /etc/iptables/rules.v4

# Step 6: Enable VNC Service at Boot
echo "Enabling VNC service at boot..."
sudo systemctl enable vncserver@:1.service

# Step 7: Display VNC Server Status
echo "VNC server status:"
sudo systemctl status vncserver@:1.service
