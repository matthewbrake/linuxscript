#!/bin/ash

# Ensure the system is updated before proceeding
echo "Updating the system..."
apk update
apk upgrade

# Install necessary packages for GUI setup
echo "Installing Xorg and essential GUI packages..."
apk add xorg-server xfce4 xfce4-terminal lightdm lightdm-gtk-greeter dbus-x11 accountsservice

# Optional: Install additional XFCE applications and utilities
echo "Installing additional XFCE utilities..."
apk add thunar-volman tumbler xfce4-screenshooter xfce4-taskmanager

# Install window manager and utilities
echo "Installing i3 window manager and utilities..."
apk add i3wm i3status dmenu i3lock

# Setting up user environment
echo "Setting up user environment..."
mkdir -p /home/user/wallpaper
mkdir -p /home/user/.config/i3
mkdir -p /home/user/.scripts

# Copy user files and set permissions
echo "Copying user configurations and setting permissions..."
cp ./user/wallpaper/compass.jpg /home/user/wallpaper/compass.jpg
cp ./user/.config/i3/config /home/user/.config/i3/config
cp ./user/.profile /home/user/.profile
cp ./user/login-script.sh /home/user/.scripts/login-script.sh
chown -R user:user /home/user

# Configure account service for user background
echo "Configuring account service for user background..."
cp ./user/user /var/lib/AccountsService/users/user
chown root:root /var/lib/AccountsService/users/user

# Configure LightDM greeter background
echo "Configuring LightDM greeter..."
echo "background=/home/user/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# Starting and enabling LightDM service
echo "Enabling and starting LightDM..."
rc-update add lightdm
service lightdm start

# Optional configurations and notes
# To enable auto-login for a specific user in LightDM, you can modify /etc/lightdm/lightdm.conf
# Uncomment and edit the following lines in the script or manually:
# echo "Enabling auto-login for user..."
# echo "[Seat:*]" >> /etc/lightdm/lightdm.conf
# echo "autologin-user=user" >> /etc/lightdm/lightdm.conf

echo "GUI setup is complete. Reboot your system for all changes to take effect."





###### ORGINALS ####


# set background image in accountsservice
cp ./user/user /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/user

# greeter background
echo "background=/home/user/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# user setup user
mkdir -p /home/user/wallpaper
mkdir -p /home/user/.config/i3

cp ./user/wallpaper/compass.jpg /home/user/wallpaper/compass.jpg
cp ./user/.config/i3/config /home/user/.config/i3/config
cp ./user/.profile /home/user/.profile
mkdir -p /home/user/.scripts
cp ./user/login-script.sh /home/user/.scripts/login-script.sh
chown -R user:user /home/user
