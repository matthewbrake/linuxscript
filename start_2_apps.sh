# Open Media Vault
sudo apt-get update
sudo apt-get upgrade -y
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/preinstall | sudo bash

wget https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install
chmod +x install
sudo ./install -n

# Casa OS Install 
wget -qO- https://get.casaos.io | sudo bash

# WebAdmin
sudo curl -fsSL -o ~/setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh && sudo sh ~/setup-repos.sh && apt-get install webmin --install-recommends


# Oled
sudo raspi-config nonint do_i2c 0

sudo apt update
sudo apt-get install -y python3-dev python3-pip i2c-tools git build-essential libi2c-dev lm-sensors

# Clone Luma and install
mkdir /home/user/drivers 
cd /home/user/drivers
git clone https://github.com/rm-hull/luma.oled.git
cd luma.oled
sudo python3 -m pip install -e .
cd ..

# Install psutil (for system info)
sudo python3 -m pip install psutil

# Clone luma.examples Repository (optional, for testing)
cd ~
git clone https://github.com/rm-hull/luma.examples.git /home/user/drivers
cd /home/user/drivers/luma.examples/examples
sudo python3 setup.py install
