#!/bin/bash

# Manually set the OS here, or leave it blank for auto-detection.
# Use lowercase: "alpine", "ubuntu", or "photon"
OS=""

# Define packages to install (adjust names as necessary for each distro)
PACKAGES="ncdu top ps net-tools findutils mlocate coreutils util-linux strace file stat watch procps lsof psmisc binutils gdb"

# Auto-detect OS if not manually specified
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
        echo "Alpine Linux detected or specified. Using apk to install packages."
        apk update
        for pkg in $PACKAGES; do
            apk add --no-cache $pkg || echo "Skipping $pkg, not available."
        done
        ;;
    ubuntu)
        echo "Ubuntu detected or specified. Using apt-get to install packages."
        apt-get update
        for pkg in $PACKAGES; do
            apt-get install -y $pkg || echo "Skipping $pkg, not available."
        done
        ;;
    photon)
        echo "Photon OS detected or specified. Using tdnf to install packages."
        tdnf update
        for pkg in $PACKAGES; do
            tdnf install -y $pkg || echo "Skipping $pkg, not available."
        done
        ;;
    *)
        echo "Unsupported or unknown OS specified."
        exit 1
        ;;
esac
