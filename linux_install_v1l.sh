#!/bin/bash

# Manually specify the OS here if you want to override automatic detection.
# Example: OS="alpine"
OS="${OS:-}"

# Define packages to install. Adjust package names as necessary per distribution.
PACKAGES="ncdu top ps net-tools findutils mlocate coreutils util-linux strace file stat watch procps lsof psmisc binutils gdb"

install_alpine() {
    echo "Using apk to install packages."
    apk update
    for pkg in $PACKAGES; do
        apk add --no-cache $pkg || echo "Skipping $pkg, not available for Alpine."
    done
}

install_ubuntu() {
    echo "Using apt-get to install packages."
    apt-get update
    for pkg in $PACKAGES; do
        apt-get install -y $pkg || echo "Skipping $pkg, not available for Ubuntu."
    done
}

install_photon() {
    echo "Using tdnf to install packages."
    tdnf makecache
    for pkg in $PACKAGES; do
        tdnf install -y $pkg || echo "Skipping $pkg, not available for Photon OS."
    done
}

# Auto-detect OS if not specified
if [ -z "$OS" ]; then
    if command -v apk > /dev/null; then
        OS="alpine"
    elif command -v apt-get > /dev/null; then
        OS="ubuntu"
    elif command -v tdnf > /dev/null; then
        OS="photon"
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi
fi

# Install packages based on OS
case $OS in
    alpine)
        install_alpine
        ;;
    ubuntu)
        install_ubuntu
        ;;
    photon)
        install_photon
        ;;
    *)
        echo "Unsupported or unknown OS specified."
        exit 1
        ;;
esac
