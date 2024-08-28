#bin /bask


# Storage and Drive
sudo apt install \
parted \                  # Partition manipulation program
udisks2 \                 # Disk management service
dmraid \                  # Device-Mapper Software RAID support tool
lvm2 \                    # Logical Volume Manager (LVM) utilities
cryptsetup \              # Disk encryption setup utility
sshfs \                   # File system client based on SSH File Transfer Protocol
nfs-common \              # Common NFS utilities
nfs-kernel-server \       # NFS server components
cifs-utils \              # Utilities for mounting and managing CIFS shares
smbclient \               # SMB/CIFS file and printer client for Unix
libsmbclient-dev \        # SMB/CIFS client library development files
samba \                   # SMB/CIFS file, print, and login server for Unix
smartmontools \           # Control and monitor SMART disks
mmc-utils \               # Command-line utilities for MMC/SD/SDIO devices
hfsprogs \                # Tools for reading and writing HFS+ filesystems
ntfs-3g \                 # NTFS filesystem driver with read-write support
mtools \                  # Tools for manipulating FAT filesystems
dosfstools \              # Tools for making and checking MS-DOS FAT filesystems
gparted \                 # GNOME partition editor
hdparm \                  # Utility to get/set hard disk parameters
iotop \                   # Simple top-like I/O monitor
sysstat \                 # System performance monitoring tools
lsscsi \                  # List SCSI devices (or hosts) and their attributes
blktrace \                # Utilities for block layer IO tracing
btrfs-progs \             # Btrfs filesystem utilities
xfsprogs \                # Utilities for managing XFS filesystems
e2fsprogs \               # Utilities for managing ext2, ext3, and ext4 filesystems
jfsutils \                # Utilities for managing JFS filesystems
testdisk \                # Partition scanner and disk recovery tool
exfat-fuse \              # Free exFAT file system implementation
dcfldd \                 # dd wipe ?
exfatprogs \              # exFAT filesystem utilities
fuse3 \                   # Filesystem in Userspace (FUSE) utilities
fuse \                    # Filesystem in Userspace
rclone \                  # rsync for cloud storage
rclone-browser \          # GUI for rclone
exfatprogs \              # exFAT filesystem utilities
zip \                     # Archiver for .zip files
unzip \                   # De-archiver for .zip files
gzip \                    # GNU compression utility
bzip2 \                   # High-quality block-sorting file compressor
xz-utils \                # XZ-format compression utilities
7zip \                    # File archiver with high compression ratio
ncdu \                    # NCurses Disk Usage
duf \                     # Disk Usage/Free Utility
mlocate \                 # Quickly find files on the filesystem
mc \                      # Midnight Commander file manager
rsync \                   # Fast, versatile file copying tool
clonezilla \              # Bare metal backup and recovery of disk partitions
aide \                    # Advanced Intrusion Detection Environment
meld \                    # Visual diff and merge tool
rename \                  # Perl-based filename renaming utility
acl \                     # Access control list utilities
inotify-tools \           # Command-line programs providing a simple interface to inotify
fzf \                     # General-purpose command-line fuzzy finder
zfsutils-linux \          # Command-line tools to manage ZFS filesystems
squashfs-tools \          # Tools for manipulating SquashFS filesystems
reiserfsprogs \           # User-level tools for ReiserFS filesystems
nilfs-tools \             # Continuous Snapshotting Filesystem utilities
f2fs-tools \              # Tools for Flash-Friendly File System
udftools \                # Tools for UDF filesystems and DVD/CD-R(W) drives
fatresize \               # Utility to resize FAT filesystems
extundelete \             # Utility to recover deleted files from ext3/ext4 partition
ddrescue \                # Data recovery tool
foremost \                # Forensic program to recover lost files
scalpel \                 # Fast filesystem-independent file recovery
photorec \                # File data recovery software
safecopy \                # Data recovery tool for problematic or damaged sources
sleuthkit \               # Tools for forensics analysis on volume and filesystem data
autopsy \                 # Graphical interface to SleuthKit
dcfldd \                  # Enhanced version of dd for forensics and security
dd_rescue \               # Data recovery tool trying hard to rescue data in case of read errors
ddrutility \              # Tools for copying and verifying disk images
gddrescue \               # GNU data recovery tool


# Optional Software
sudo apt install \
genisoimage \             # Tool for creating ISO images
p7zip-full \              # Command-line version of 7-Zip for file compression
fdupes \                  # Duplicate file finder
ranger \                  # Console file manager with vi-like keybindings
htop \                    # Interactive process viewer
ncdu \                    # Disk usage analyzer with an ncurses interface
tldr \                    # Simplified man pages with practical examples
jq \                      # Command-line JSON processor
wget \                    # Non-interactive network downloader
curl \                    # Tool for transferring data with URLs
git \                     # Version control system
vim \                     # Highly configurable text editor
neofetch \                # Display system information in terminal
bat \                     # Cat clone with syntax highlighting and Git integration
fd \                      # Simple, fast and user-friendly alternative to 'find'
ripgrep \                 # Fast search tool that recursively searches your current directory
tree \                    # Displays directory structure in a tree-like format
fzf \                     # General-purpose command-line fuzzy finder
entr \                    # Run arbitrary commands when files change
exiftool \                # Read, write, and edit meta information in files
imagemagick \             # Suite of tools for image manipulation
gparted \                 # Graphical partition editor
ssh \                     # Secure shell for remote login
screen \                  # Terminal multiplexer
tmux \                    # Terminal multiplexer for managing multiple terminal sessions
docker \                  # Containerization platform
docker-compose \          # Tool for defining and running multi-container Docker applications
ansible \                 # Automation tool for configuration management
nmap \                    # Network exploration tool and security/port scanner
vlc \                     # Multimedia player and streaming server
ffmpeg \                  # Multimedia framework for handling video, audio, and other multimedia files
gnome-tweaks \            # Tool for advanced GNOME settings management
gnome-shell-extensions \   # Extensions for customizing GNOME Shell
kdenlive \                # Video editing software
gimp \                    # GNU Image Manipulation Program
audacity \                # Audio editing software
pinta \                   # Simple drawing and image editing program
synaptic \                # Graphical package manager for apt
bleachbit \               # Disk cleanup utility
rclone \                  # Command-line program to manage files on cloud storage
duplicity \               # Encrypted bandwidth-efficient backup using the rsync algorithm
rsync \                   # Remote file and directory synchronization tool
sshfs \                   # Filesystem client based on SSH
lsof \                    # List open files
iotop \                   # Display I/O usage by processes
glances \                 # Cross-platform monitoring tool for system resources
btop \                    # Aesthetic system monitor
gdebi \                   # Simple tool to install .deb files
unzip \                   # Extract compressed files from a ZIP archive
zip \                     # Package and compress (archive) files
pikaur \                  # AUR helper for Arch Linux
neovim \                  # Modern text editor based on Vim
thefuck \                 # Corrects errors in previous console commands
detox \                   # Renames files to make them more usable

sudo apt install -y --ignore-missing \
build-essential \
util-linux \
busybox \
git \
curl \
wget \
vim \
nano \
htop \
tree \
gnupg \
software-properties-common \
apt-transport-https \
ca-certificates \
openssl \
jq \
dnsutils \
net-tools \
iputils-ping \
tcpdump \
iptables \
traceroute \
uuid-runtime \
zip \
ffmpeg \
unzip \
tar \
gzip \
bzip2 \
xz-utils \
file \
gnupg2 \
gawk \
gettext \
7zip-full \
ncdu \
locales \
strace \
lsof \
sysstat \
time \
watch \
whois \
zstd \
parallel \ 
dislocker \
bleachbit
multitail # log enrich
vnstat # bandwith

# Python Development
sudo apt install -y \
python3 \
python3-full \
python3-pip \
python3-venv \
python3-dev \
python3-setuptools \
python3-wheel \
pipx

apt-get install bash coreutils findutils grep sed gawk tar gzip bzip2 xz file diffutils patch less nano vim wget curl rsync git openssh-client tmux screen python3 make autoconf automake binutils libtool pkg-config cmake gdb strace ltrace tcpdump netcat nmap openssl sqlite3 jq xmlstarlet dos2unix unix2dos zip unzip p7zip bc ncurses readline zlib libxml2 libxslt imagemagick-tools ffmpeg ghostscript gnupg htop procps-ng psmisc pv tree ncdu mc lynx w3m links irssi weechat fzf ripgrep fd bat exa tldr shellcheck jq pandoc asciidoc texinfo groff man-db-man-pages cpio lhasa unace rar unrar lzip lzop lz4 zstd mtools dosfstools ntfs-3g sshfs bindfs cryptsetup parted gparted ddrescue testdisk whois bind-utils ipcalc fail2ban rkhunter clamav aide iptables openvpn-utils strongswan-utils xl2tpd pptp rpcbind samba-common vsftpd-utils proftpd-utils dhcp-utils bind-utils squid-utils nginx-utils apache-utils lighttpd-utils haproxy-utils varnish-utils memcached-utils redis-utils postgresql-client mysql-client mongodb-tools docker-utils kubectl terraform ansible-base salt puppet ruby-bundler python3-pip nodejs npm yarn php-cli composer go rust cargo rustc rustfmt clippy ghc cabal-install stack ocaml opam R-core gnuplot graphviz inkscape gimp imagemagick-tools ffmpeg sox audacity timidity fluidsynth alsa-utils pulseaudio-utils
