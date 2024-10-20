#!/bin/bash

# Templates
# 0 
# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    # Add your Docker installation commands here
    # For example:
    # curl -fsSL https://get.docker.com -o get-docker.sh
    # sh get-docker.sh
}

# Function to install XRDP
install_xrdp() {
    echo "Installing XRDP..."
    # Add your XRDP installation commands here
    # For example:
    # sudo apt-get update
    # sudo apt-get install xrdp
}

# Main menu
while true; do
    CHOICE=$(whiptail --title "Installation Wizard" --checklist \
    "Choose options to install:" 15 60 2 \
    "Docker" "Install Docker" OFF \
    "XRDP" "Install XRDP" OFF \
    3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        for OPTION in $CHOICE; do
            case $OPTION in
            '"Docker"')
                install_docker
                ;;
            '"XRDP"')
                install_xrdp
                ;;
            esac
        done
    else
        echo "You chose to cancel."
        exit
    fi
done
