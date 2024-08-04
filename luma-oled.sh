#!/bin/bash

# Script to set up the environment for ArduiPi_OLED and related libraries on a Raspberry Pi

# Define the base directory for drivers
BASE_DIR="/home/$USER/drivers"

# Step 1: Instructions for enabling I2C interface
echo "Please enable the I2C interface using dietpi-config:"
echo "1. Run 'dietpi-config'"
echo "2. Navigate to 'Advanced Options'"
echo "3. Select 'I2C State' and set it to 'On'"
echo "4. Exit dietpi-config and reboot the system"
read -p "Press Enter to continue after enabling I2C and rebooting..."

# Step 1: Rasberrypi OS - enable i2c oled 
sudo raspi-config nonint do_i2c 0

# Step 2: Update package list and install required packages
sudo apt update
sudo apt install -y python3-dev python3-full python3-pip python3-numpy libfreetype6-dev libjpeg-dev build-essential \
    i2c-tools git build-essential libi2c-dev lm-sensors libsdl2-dev libsdl2-image-dev \
    libsdl2-mixer-dev libsdl2-ttf-dev libportmidi-dev pipx

# Load I2C kernel modules
sudo modprobe i2c-dev
sudo modprobe i2c-bcm2708

# Ensure user is added to i2c group
sudo usermod -a -G i2c $USER

# Check for temperature sensor
if ! vcgencmd measure_temp >/dev/null 2>&1; then
    sudo mknod /dev/vcio c 100 0
    sudo chmod 666 /dev/vcio
fi

# Step 3: Create directory for drivers
mkdir -p $BASE_DIR

# Step 4: Clone and install luma.oled library
echo "Cloning luma.oled repository..."
git clone https://github.com/rm-hull/luma.oled.git $BASE_DIR/luma.oled
cd $BASE_DIR/luma.oled
sudo python3 setup.py install

# Step 5: Install psutil for system information
sudo pipx install psutil

# Step 6: Clone and install luma.examples
echo "Cloning luma.examples repository..."
git clone https://github.com/rm-hull/luma.examples.git $BASE_DIR/luma.examples
cd $BASE_DIR/luma.examples
sudo python3 setup.py install

# Step 7: Verify I2C Connection
echo "Checking for I2C devices on bus 1..."
sudo i2cdetect -y 1
if [ $? -ne 0 ]; then
    echo "Bus 1 not detected, checking bus 0..."
    sudo i2cdetect -y 0
fi

# Step 8: Verify I2C Kernel Modules
echo "Checking loaded I2C kernel modules..."
lsmod | grep i2c

# Step 9: Run demo scripts (optional)
echo "You can run demo scripts to test the OLED display. Examples:"
echo "1. Analog clock with date:"
echo "   python3 /home/$USER/drivers/luma.examples/examples/clock.py --display ssd1306"
echo "2. Text and logo (animated):"
echo "   python3 /home/$USER/drivers/luma.examples/examples/crawl.py --display ssd1306"

# Step 10: Create and enable a systemd service for OLED display
sudo bash -c 'cat > /etc/systemd/system/luma-oled.service << EOL
[Unit]
Description=Luma OLED Display Service
After=multi-user.target

[Service]
ExecStart=/usr/bin/python3 /home/$USER/drivers/luma.examples/examples/sys_info_extended.py --display ssd1306
WorkingDirectory=/home/$USER/drivers/luma.examples/examples
StandardOutput=journal
StandardError=journal
Restart=always
User=$USER

[Install]
WantedBy=multi-user.target
EOL'

# Enable and start the systemd service
sudo systemctl daemon-reload
sudo systemctl enable luma-oled.service
sudo systemctl start luma-oled.service

# Step 11: Check service status
sudo systemctl status luma-oled.service

# Step 12: Troubleshooting
echo "Checking for I2C errors in kernel logs:"
dmesg | grep i2c

echo "Setup complete. Please reboot your Raspberry Pi to finalize the changes."

# Optional: Run a test script manually
echo "You can run a test script manually with the following command:"
echo "python3 /home/$USER/drivers/luma.examples/examples/sys_info_extended.py --display ssd1306"
