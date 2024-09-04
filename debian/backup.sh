### password ###
# Define variables
REMOTE_IP="192.168.1.100"  # IP address of the remote server
REMOTE_USER="user"         # Username for the remote server
REMOTE_PASS="password"     # Password for the remote server
HOSTNAME="your_hostname"   # Hostname for the image file
DRIVE="/dev/sda1"          # Drive to be used for the dd command (adjust as needed)

# SSH connection to the local server and run dd clone command
sshpass -p "$REMOTE_PASS" ssh $REMOTE_USER@$REMOTE_IP "dd if=$DRIVE of=/mnt/fs-omv/backups/images/$HOSTNAME.gz.img"


### ssh ##

# Define variables
REMOTE_IP="192.168.1.100"        # IP address of the remote server
REMOTE_USER="user"               # Username for the remote server
SSH_KEY="/path/to/private_key"   # Path to the SSH private key
HOSTNAME="your_hostname"         # Hostname for the image file
DRIVE="/dev/sda1"                # Drive to be used for the dd command (adjust as needed)

# SSH connection to the local server and run dd clone command
ssh -i "$SSH_KEY" "$REMOTE_USER"@"$REMOTE_IP" "dd if=$DRIVE of=/mnt/fs-omv/backups/images/$HOSTNAME.gz.img bs=4M status=progress conv=nocreat,notrunc,noerror"

```
