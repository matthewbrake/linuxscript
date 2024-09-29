#!/bin/bash
# Ubuntu Configuration Script

# Update package index and upgrade system
echo "Updating package index and upgrading system..."
sudo apt update
sudo apt upgrade -y

# Dependcies
sudo apt install autoconf automake autotools-dev binutils-mingw-w64-i686
  binutils-mingw-w64-x86-64 bzip2-doc catch2 cmake-data dh-elpa-helper
  g++-mingw-w64 g++-mingw-w64-i686 g++-mingw-w64-i686-posix
  g++-mingw-w64-i686-win32 g++-mingw-w64-x86-64 g++-mingw-w64-x86-64-posix
  g++-mingw-w64-x86-64-win32 gcc-mingw-w64 gcc-mingw-w64-base
  gcc-mingw-w64-i686 gcc-mingw-w64-i686-posix gcc-mingw-w64-i686-posix-runtime
  gcc-mingw-w64-i686-win32 gcc-mingw-w64-i686-win32-runtime
  gcc-mingw-w64-x86-64 gcc-mingw-w64-x86-64-posix
  gcc-mingw-w64-x86-64-posix-runtime gcc-mingw-w64-x86-64-win32
  gcc-mingw-w64-x86-64-win32-runtime gfortran gfortran-11 golang-1.18-go
  golang-1.18-src golang-src googletest icu-devtools libapt-pkg6.0
  libboost-atomic-dev libboost-atomic1.74-dev libboost-atomic1.74.0
  libboost-chrono-dev libboost-chrono1.74-dev libboost-chrono1.74.0
  libboost-container-dev libboost-container1.74-dev libboost-container1.74.0
  libboost-context-dev libboost-context1.74-dev libboost-context1.74.0
  libboost-coroutine-dev libboost-coroutine1.74-dev libboost-coroutine1.74.0
  libboost-date-time-dev libboost-date-time1.74-dev libboost-date-time1.74.0
  libboost-exception-dev libboost-exception1.74-dev libboost-fiber-dev
  libboost-fiber1.74-dev libboost-fiber1.74.0 libboost-filesystem-dev
  libboost-filesystem1.74-dev libboost-graph-dev libboost-graph-parallel-dev
  libboost-graph-parallel1.74-dev libboost-graph-parallel1.74.0
  libboost-graph1.74-dev libboost-graph1.74.0 libboost-iostreams-dev
  libboost-iostreams1.74-dev libboost-locale-dev libboost-locale1.74-dev
  libboost-log-dev libboost-log1.74-dev libboost-log1.74.0 libboost-math-dev
  libboost-math1.74-dev libboost-math1.74.0 libboost-mpi-dev
  libboost-mpi-python-dev libboost-mpi-python1.74-dev
  libboost-mpi-python1.74.0 libboost-mpi1.74-dev libboost-mpi1.74.0
  libboost-nowide-dev libboost-nowide1.74-dev libboost-nowide1.74.0
  libboost-numpy-dev libboost-numpy1.74-dev libboost-numpy1.74.0
  libboost-program-options-dev libboost-program-options1.74-dev
  libboost-program-options1.74.0 libboost-python-dev libboost-python1.74-dev
  libboost-python1.74.0 libboost-random-dev libboost-random1.74-dev
  libboost-random1.74.0 libboost-regex-dev libboost-regex1.74-dev
  libboost-serialization-dev libboost-serialization1.74-dev
  libboost-serialization1.74.0 libboost-stacktrace-dev
  libboost-stacktrace1.74-dev libboost-stacktrace1.74.0 libboost-system-dev
  libboost-system1.74-dev libboost-system1.74.0 libboost-test-dev
  libboost-test1.74-dev libboost-test1.74.0 libboost-thread-dev
  libboost-thread1.74-dev libboost-timer-dev libboost-timer1.74-dev
  libboost-timer1.74.0 libboost-tools-dev libboost-type-erasure-dev
  libboost-type-erasure1.74-dev libboost-type-erasure1.74.0 libboost-wave-dev
  libboost-wave1.74-dev libboost-wave1.74.0 libboost1.74-tools-dev
  libcaf-openmpi-3 libcoarrays-dev libcoarrays-openmpi-dev libdrm-dev
  libegl-dev libevent-dev libevent-extra-2.1-7 libevent-openssl-2.1-7
  libevent-pthreads-2.1-7 libfabric1 libfmt-dev libfmt8 libgfortran-11-dev
  libgl-dev libglx-dev libhwloc-dev libhwloc-plugins libhwloc15 libibverbs-dev
  libicu-dev libjsoncpp25 libltdl-dev libncurses-dev libnl-3-dev
  libnl-route-3-dev libnuma-dev libopenmpi-dev libopenmpi3 libpciaccess-dev
  libpmix-dev libpmix2 libpsm-infinipath1 libpsm2-2 libpthread-stubs0-dev
  libqt5concurrent5 libqt5opengl5 libqt5opengl5-dev libqt5quickshapes5
  libqt5quicktest5 librhash0 libspdlog1 libtool libucx0 libvulkan-dev
  libx11-dev libxau-dev libxcb1-dev libxdmcp-dev libxext-dev libxnvctrl0
  mingw-w64-common mingw-w64-i686-dev mingw-w64-x86-64-dev mpi-default-bin
  mpi-default-dev openmpi-bin openmpi-common qt5-qmake-bin
  qt5-qmltooling-plugins qtdeclarative5-dev-tools x11proto-dev
  xorg-sgml-doctools xtrans-dev apt-doc autoconf-archive gnu-standards autoconf-doc cmake-doc ninja-build
  cmake-format gcc-10-locales gfortran-multilib gfortran-doc
  gfortran-11-multilib gfortran-11-doc bzr | brz mercurial subversion
  libboost1.74-doc gccxml xsltproc doxygen docbook-xsl default-jdk fop
  libfmt-doc libhwloc-contrib-plugins icu-doc libtool-doc ncurses-doc
  openmpi-doc readline-doc sqlite3-doc libssl-doc gcj-jdk libx11-doc
  libxcb-doc libxext-doc wine wine64 default-libmysqlclient-dev firebird-dev
  libpq-dev unixodbc-dev -y
# Depencies 
sudo apt install -y git build-essential apt-utils cmake libfontconfig1 libglu1-mesa-dev libgtest-dev libspdlog-dev libboost-all-dev libncurses5-dev libgdbm-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev mesa-common-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5websockets5 libqt5websockets5-dev qtdeclarative5-dev golang-go qtbase5-dev libqt5websockets5-dev libspdlog-dev python3-dev libboost-all-dev mingw-w64 nasm
echo "Installing dependicences..."

# Utilities (50 packages)
echo "Installing utilities..."
sudo apt install -y \
    curl wget unzip git htop vim nano \
    build-essential open-vm-tools make gcc g++ \
    software-properties-common \
    ncdu tree tmux screen \
    zip unzip rar unrar \
    neofetch figlet toilet \
    ranger nnn mc \
    apt-transport-https ca-certificates \
    gnupg-agent software-properties-common \
    dnsutils net-tools iputils-ping \
    man-db manpages-dev \
    ffmpeg vlc \
    ranger w3m elinks lynx \
    speedtest-cli nmap iperf \
    tcpdump wireshark \
    sysstat iotop htop atop \
    chrony ntp \
    dos2unix \
    neovim \
    jq \
    pandoc \
    xclip xsel \
    locate \
    rsync \
    dos2unix \
    bash-completion \
    fonts-powerline \
    libssl-dev libffi-dev python3-dev \
    python3-pip python3-venv \
    nodejs npm \
    ruby-full

# Storage (10 packages)
echo "Installing storage tools..."
sudo apt install -y \
    gparted ntfs-3g exfat-fuse exfat-utils \
    smartmontools testdisk \
    hdparm ddrescue \
    lvm2 \
    zfsutils-linux \
    btrfs-progs

# Tools (20 packages)
echo "Installing tools..."
sudo apt install -y \
    bmon nload iftop iotop iptraf-ng \
    tcpdump wireshark \
    lynis chkrootkit rkhunter \
    nmap nikto metasploit-framework \
    openssl openssh-client openssh-server \
    curl wget \
    git subversion \
    vim nano \
    tmux screen \
    tldr cheat \
    ffmpeg vlc \
    neofetch screenfetch

# Basics (20 packages)
echo "Installing basics..."
sudo apt install -y \
    net-tools iputils-ping dnsutils \
    apt-transport-https ca-certificates \
    gnupg-agent software-properties-common \
    zip unzip rar unrar \
    jq \
    xclip xsel \
    man-db manpages-dev \
    bash-completion \
    rsync \
    locate \
    sysstat iotop htop \
    cron anacron \
    chrony ntp \
    gnupg2 \
    dos2unix

# Dependencies (5 packages)
echo "Installing dependencies..."
sudo apt install -y \
    build-essential libssl-dev libffi-dev python3-dev \
    python3-pip python3-venv \
    nodejs npm \
    ruby-full \
    libpq-dev

# GUI Configuration (Uncomment as needed)
#echo "Configuring GUI..."
#sudo apt install -y ubuntu-desktop

# Web Admin Installation (Uncomment and customize)
#echo "Installing web admin..."
#curl -sSL https://example.com/install.sh | sudo bash

# Cockpit Installation (Uncomment and customize)
#echo "Installing Cockpit..."
#sudo apt install -y cockpit
#sudo systemctl enable --now cockpit.socket

# Optional Optimization Settings (Uncomment and customize)
#echo "Applying optimization settings..."
#sudo sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
#sudo locale-gen
#sudo update-locale LANG=en_US.UTF-8

# Reboot system
echo "Rebooting system..."
sudo reboot
