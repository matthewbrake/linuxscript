
# Update package lists to ensure we have the latest information
sudo apt update 

# Install the software-properties-common package to manage PPAs
sudo apt install -y software-properties-common 

# Add the Mosh PPA repository for the latest version
sudo add-apt-repository ppa:keithw/mosh 

# Update package lists again to include the new PPA
sudo apt update 

# Install Mosh
sudo apt install -y mosh 

# Verify that Mosh is installed correctly
mosh --version 

# Open the necessary UDP ports for Mosh (60000-61000) in the firewall
# This command assumes you are using UFW (Uncomplicated Firewall)
sudo ufw allow 60000:61000/udp 

# If you're using a different firewall (like iptables), you can use:
# sudo iptables -A INPUT -p udp --dport 60000:61000 -j ACCEPT

# To connect to a remote server using Mosh, use the following command:
# Replace 'username' with your actual username and 'host' with the server's address
mosh username@host 

# If your SSH server is running on a non-standard port (e.g., 2222), use:
mosh --ssh="ssh -p 2222" username@host 

```
