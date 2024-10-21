#################################################### - Tailscale Setup - #################################################### 
# For Debian/Ubuntu-based systems:
curl -fsSL https://tailscale.com/install.sh | sh
# For other distributions, check the official Tailscale documentation
# Step 2: Start Tailscale and authenticate
sudo tailscale up
# Follow the URL provided to authenticate your device
# Step 3: Basic usage - connect to your tailnet
tailscale up
# Step 4: To use an exit node (if configured in your tailnet)
tailscale up --exit-node=<exit-node-ip-or-hostname>
# Step 5: To stop using Tailscale
tailscale down
# Advanced Setup: Subnet Routing
# Step 6: Enable IP forwarding (required for subnet routing)
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
# Step 7: Configure as a subnet router
# Replace <SUBNET_CIDR> with your actual subnet (e.g., 192.168.1.0/24)
sudo tailscale up --advertise-routes=<SUBNET_CIDR> --accept-routes
# Step 8: Disable SNAT (optional, if you want to preserve source IPs)
sudo tailscale up --advertise-routes=<SUBNET_CIDR> --accept-routes --snat-subnet-routes=false
# Step 9: Allow non-root users to control Tailscale (optional)
sudo tailscale set --operator=$USER
# Step 10: Configure clients to accept routes (if needed)
# On other Linux clients that should use the subnet routes:
sudo tailscale up --accept-routes
# Additional useful commands:
# Check Tailscale status
tailscale status
# Get your Tailscale IP
tailscale ip -4
# View available exit nodes
tailscale exit-node list
# Enable Tailscale SSH (if configured in your tailnet)
tailscale up --ssh
# Restart Tailscale service
sudo systemctl restart tailscaled

#################################################### - OPNsense with Tailscale - #################################################### 
OPNsense is an open source router and firewall platform built using FreeBSD. Tailscale can be installed on an OPNsense platform, joining it to your WireGuard-based mesh network.

OPNsense is a community supported platform for Tailscale.

Installation
Connect to the console of OPNsense via SSH or other means as you see fit. Select option 8) Shell and ensure you are the root user.

First we must download the ports tree. More information about this can be found in the OPNsense documentation, and the FreeBSD ports documentation.


# opnsense-code ports
Updating OPNsense repository catalogue...
...
Cloning into '/usr/ports'...
...
Your branch is up to date with 'origin/master'.
Make sure to run opnsense-code ports again even if you have done so previously, to update the ports tree to current versions. The version of Tailscale in the FreeBSD ports is periodically updated for new releases. More information on updates can be found below.

Once the ports tree is downloaded, execute the following steps as root to install Tailscale.


# cd /usr/ports/security/tailscale
# make install
Once installed, start and enable the tailscaled daemon and verify that Tailscale is working properly with tailscale version.


# service tailscaled enable
# service tailscaled start
# tailscale version
root@opnsense:~ # tailscale version
1.56.1
  go version: go1.21.5
Connect
To add the OPNsense machine as a node on your tailnet run the following command as root:


# tailscale up
To authenticate, visit:
    https://tailscale.com/a/abc123abc123
You'll be asked to authenticate to Tailscale in your browser. This is an appropriate time to specify other useful options such as subnet-routes, exit nodes, and so on.

Once started, Tailscale should appear in the list of interfaces in the OPNsense UI. It can be used in firewall rules and other OPNsense functions.

A screenshot of the OPNSense UI
Updating Tailscale
To update Tailscale perform the following steps as the root user:


# opnsense-code ports
# cd /usr/ports/security/tailscale
# make deinstall
# make clean
# make install
# service tailscaled restart
This might take a few minutes depending on the strength of the CPU in use. Verify Tailscale updated using tailscale version. Sometimes it is necessary to restart the tailscaled service with service tailscaled restart.

Direct Connections for LAN Clients
As a router/firewall, OPNsense may also be providing Internet connectivity for LAN devices which themselves have a Tailscale client installed. The NAT implementation in OPNsense is an Endpoint-Dependent Mapping, or "hard" NAT, which means that LAN devices have difficulty making direct connections and often resort to DERP Relays.

There are a few options in which OPNsense can enable devices on the LAN to make direct connections to remote Tailscale nodes. Static NAT port mapping and NAT-PMP.

Static NAT port mapping
By default, OPNsense software rewrites the source port on all outgoing connections to enhance security and prevent direct exposure of internal port numbers.

Static port mapping in OPNsense involves creating a fixed association between a specific external port number and an internal IP address and port, allowing incoming traffic to be directed to the correct destination within the local network.

Navigate to Firewall > NAT, Outbound tab. Select Hybrid Outbound NAT rule generation. Select Save. Select ↑ Add to create a new NAT rule to the top of the list.

Configure the rule to match UDP traffic as shown below. Note, for each rule, select the appropriate Address Family (IP version), IPv4 for one and IPv6 for the other.

Example Static NAT port mapping configuration in Firewall : NAT : Outbound
Check Static Port in the Translation section of the page. Select Save. Select Apply Changes.

In your ACLS, set randomizeClientPort.


{
  // ACLs and other configurations
  "randomizeClientPort": true
}
From the command line, use tailscale ping node to verify the connection path between two nodes. Also useful in this scenario is tailscale netcheck.

NAT-PMP
NAT-PMP is a protocol by which LAN clients can ask the firewall to temporarily create port mappings.

Enable the UPnP service and Allow NAT-PMP Port Mapping in Services > Universal Plug and Play. Only NAT-PMP is needed for Tailscale's use, but enabling UPnP can be helpful for other applications like gaming consoles.

Enabling Allow NAT-PMP Port Mapping in Services : Universal Plug and Play : Settings
Further reading
Setting up subnet routing or acting as an exit node may be of interest for a router using OPNsense.

Special thanks
Special thanks to GitHub user @newmy-de who helped us provide these installation instructions.
