
# Core Packages
sudo apt install --ignore-missing -y \
build-essential \
bash \                     # GNU Bourne Again SHell
coreutils \                # Basic file, shell, and text manipulation utilities
findutils \                # Utilities for finding files
grep \                     # Search utility
sed \                      # Stream editor
gawk \                     # Pattern scanning and processing language
tar \                      # Archive utility
gzip \                     # GNU compression utility
bzip2 \                    # Block-sorting file compressor
xz-utils \                 # XZ-format compression utilities
file \                     # Determine file types
diffutils \                # File comparison utilities
patch \                    # Apply patches to files
less \                     # File pager
nano \                     # Simple text editor
vim \                      # Highly configurable text editor
wget \                     # Non-interactive network downloader
curl \                     # Tool for transferring data with URLs
rsync \                    # Remote file and directory synchronization tool
openssh-client \           # OpenSSH client
tmux \                     # Terminal multiplexer
screen \                   # Terminal multiplexer
python3 \                  # Python 3 interpreter
make \                     # Build automation tool
autoconf \                 # Automatically configure source code
automake \                 # Tool for generating Makefile.in files
binutils \                 # Binary utilities
libtool \                  # Generic library support script
pkg-config \               # Manage compile and link flags
cmake \                    # Build system generator
gdb \                      # GNU Debugger
strace \                   # Trace system calls and signals
ltrace \                   # Trace library calls
tcpdump \                  # Network packet analyzer
netcat \                   # Network utility for reading/writing data
nmap \                     # Network exploration tool and security/port scanner
openssl \                  # Toolkit for SSL/TLS
sqlite3 \                  # SQLite 3 command-line interface
jq \                       # Command-line JSON processor
xmlstarlet \               # XML toolkit
dos2unix \                 # Convert text files between DOS and Unix formats
unix2dos \                 # Convert text files between Unix and DOS formats
zip \                      # Archiver for .zip files
unzip \                    # De-archiver for .zip files
p7zip-full \               # Command-line version of 7-Zip for file compression
bc \                       # Arbitrary precision calculator
ncurses \                  # Terminal handling library
readline \                 # GNU Readline library
zlib \                     # Compression library
libxml2 \                  # XML parsing library
libxslt \                  # XSLT processing library
imagemagick \              # Suite of tools for image manipulation
ffmpeg \                   # Multimedia framework for handling video, audio, and other multimedia files
ghostscript \              # Interpreter for the PostScript language and for PDF
gnupg \                    # GNU Privacy Guard for encryption and signing
htop \                     # Interactive process viewer
procps-ng \                # System monitoring utilities
psmisc \                   # Miscellaneous system utilities
pv \                       # Monitor the progress of data through a pipe
tree \                     # Display directory structure in a tree-like format
ncdu \                     # Disk usage analyzer with an ncurses interface
mc \                       # Midnight Commander file manager
lynx \                     # Text-based web browser
w3m \                      # Text-based web browser
links \                    # Text-based web browser
irssi \                    # Terminal-based IRC client
weechat \                  # Terminal-based chat client
fzf \                      # General-purpose command-line fuzzy finder
ripgrep \                  # Fast search tool that recursively searches your current directory
fd \                       # Simple, fast and user-friendly alternative to 'find'
bat \                      # Cat clone with syntax highlighting and Git integration
exa \                      # Modern replacement for `ls`
tldr \                     # Simplified man pages with practical examples
shellcheck \               # Shell script analysis tool
pandoc \                   # Universal document converter
asciidoc \                 # Text-based document format
texinfo \                  # Documentation system
groff \                    # GNU troff document formatting system
man-db \                   # Manual pager utilities
manpages \                 # Man pages
cpio \                     # Archive utility
lhasa \                    # Lhasa archive utility
unace \                    # Extract files from .ace archives
rar \                      # RAR archive utility
unrar \                    # Extract files from .rar archives
lzip \                     # Lzip compression utility
lzop \                     # LZOP compression utility
lz4 \                      # LZ4 compression utility
zstd \                     # Zstandard compression
mtools \                   # Tools for manipulating FAT filesystems
dosfstools \               # Tools for making and checking MS-DOS FAT filesystems
ntfs-3g \                  # NTFS filesystem driver with read-write support
# Storage
sudo apt install --ignore-missing -y \
parted \                   # Partition manipulation program
udisks2 \                  # Disk management service
dmraid \                   # Device-Mapper Software RAID support tool
lvm2 \                     # Logical Volume Manager (LVM) utilities
cryptsetup \               # Disk encryption setup utility
sshfs \                    # File system client based on SSH File Transfer Protocol
nfs-common \               # Common NFS utilities
cifs-utils \               # Utilities for mounting and managing CIFS shares
smbclient \                # SMB/CIFS file and printer client for Unix
libsmbclient-dev \         # SMB/CIFS client library development files
samba \                    # SMB/CIFS file, print, and login server for Unix
smartmontools \            # Control and monitor SMART disks
mmc-utils \                # Command-line utilities for MMC/SD/SDIO devices
hfsprogs \                 # Tools for reading and writing HFS+ filesystems
ntfs-3g \                  # NTFS filesystem driver with read-write support
mtools \                   # Tools for manipulating FAT filesystems
dosfstools \               # Tools for making and checking MS-DOS FAT filesystems
gparted \                  # GNOME partition editor
hdparm \                   # Utility to get/set hard disk parameters
iotop \                    # Simple top-like I/O monitor
sysstat \                  # System performance monitoring tools
lsscsi \                   # List SCSI devices (or hosts) and their attributes
blktrace \                 # Utilities for block layer IO tracing
btrfs-progs \              # Btrfs filesystem utilities
xfsprogs \                 # Utilities for managing XFS filesystems
e2fsprogs \                # Utilities for managing ext2, ext3, and ext4 filesystems
jfsutils \                 # Utilities for managing JFS filesystems
testdisk \                 # Partition scanner and disk recovery tool
exfat-fuse \               # Free exFAT file system implementation
dcfldd \                   # Enhanced version of dd for forensics and security
exfatprogs \               # exFAT filesystem utilities
fuse3 \                    # Filesystem in Userspace (FUSE) utilities
fuse \                     # Filesystem in Userspace
rclone \                   # Command-line program to manage files on cloud storage
rclone-browser \           # GUI for rclone
zip \                      # Archiver for .zip files
unzip \                    # De-archiver for .zip files
gzip \                     # GNU compression utility
bzip2 \                    # High-quality block-sorting file compressor
xz-utils \                 # XZ-format compression utilities
7zip \                     # File archiver with high compression ratio
ncdu \                     # NCurses Disk Usage
duf \                      # Disk Usage/Free Utility
mlocate \                  # Quickly find files on the filesystem
rsync \                    # Fast, versatile file copying tool
clonezilla \               # Bare metal backup and recovery of disk partitions
aide \                     # Advanced Intrusion Detection Environment
meld \                     # Visual diff and merge tool
rename \                   # Perl-based filename renaming utility
acl \                      # Access control list utilities
inotify-tools \            # Command-line programs providing a simple interface to inotify
fzf \                      # General-purpose command-line fuzzy finder
zfsutils-linux \           # Command-line tools to manage ZFS filesystems
squashfs-tools \           # Tools for manipulating SquashFS filesystems
reiserfsprogs \            # User-level tools for ReiserFS filesystems
nilfs-tools \              # Continuous Snapshotting Filesystem utilities
f2fs-tools \               # Tools for Flash-Friendly File System
udftools \                 # Tools for UDF filesystems and DVD/CD-R(W) drives
fatresize \                # Utility to resize FAT filesystems
extundelete \              # Utility to recover deleted files from ext3/ext4 partition
ddrescue \                 # Data recovery tool
foremost \                 # Forensic program to recover lost files
scalpel \                  # Fast filesystem-independent file recovery
photorec \                 # File data recovery software
safecopy \                 # Data recovery tool for problematic or damaged sources
sleuthkit \                # Tools for forensics analysis on volume and filesystem data
autopsy \                  # Graphical interface to SleuthKit
dd_rescue \                # Data recovery tool trying hard to rescue data in case of read errors
ddrutility \               # Tools for copying and verifying disk images
gddrescue \                # GNU data recovery tool

sudo apt install --ignore-missing -y \
genisoimage \              # Tool for creating ISO images
p7zip-full \               # Command-line version of 7-Zip for file compression
fdupes \                   # Duplicate file finder
ranger \                   # Console file manager with vi-like keybindings
htop \                     # Interactive process viewer
tldr \                     # Simplified man pages with practical examples
jq \                       # Command-line JSON processor
vim \                      # Highly configurable text editor
neofetch \                 # Display system information in terminal
bat \                      # Cat clone with syntax highlighting and Git integration
fd \                       # Simple, fast and user-friendly alternative to 'find'
ripgrep \                  # Fast search tool that recursively searches your current directory
tree \                     # Displays directory structure in a tree-like format
entr \                     # Run arbitrary commands when files change
exiftool \                 # Read, write, and edit meta information in files
imagemagick \              # Suite of tools for image manipulation
ssh \                      # Secure shell for remote login
docker \                   # Containerization platform
docker-compose \           # Tool for defining and running multi-container Docker applications
ansible \                  # Automation tool for configuration management
nmap \                     # Network exploration tool and security/port scanner
vlc \                      # Multimedia player and streaming server
ffmpeg \                   # Multimedia framework for handling video, audio, and other multimedia files
gnome-tweaks \             # Tool for advanced GNOME settings management
gnome-shell-extensions \   # Extensions for customizing GNOME Shell
kdenlive \                 # Video editing software
gimp \                     # GNU Image Manipulation Program
audacity \                 # Audio editing software
pinta \                    # Simple drawing and image editing program
synaptic \                 # Graphical package manager for apt
bleachbit \                # Disk cleanup utility
duplicity \                # Encrypted bandwidth-efficient backup using the rsync algorithm
lsof \                     # List open files
glances \                  # Cross-platform monitoring tool for system resources
btop \                     # Aesthetic system monitor
gdebi \                    # Simple tool to install .deb files
pikaur \                   # AUR helper for Arch Linux
neovim \                   # Modern text editor based on Vim
thefuck \                  # Corrects errors in previous console commands
detox \                    # Renames files to make them more usable
qemu-system \  # Quick Emulater 
qemu-tools \
# Additional Tools
sudo apt install --ignore-missing -y \
bash \                     # GNU Bourne Again SHell
coreutils \                # Basic file, shell, and text manipulation utilities
findutils \                # Utilities for finding files
grep \                     # Search utility
sed \                      # Stream editor
gawk \                     # Pattern scanning and processing language
tar \                      # Archive utility
gzip \                     # GNU compression utility
bzip2 \                    # Block-sorting file compressor
xz-utils \                 # XZ-format compression utilities
file \                     # Determine file types
diffutils \                # File comparison utilities
patch \                    # Apply patches to files
less \                     # File pager
nano \                     # Simple text editor
vim \                      # Highly configurable text editor
wget \                     # Non-interactive network downloader
curl \                     # Tool for transferring data with URLs
rsync \                    # Remote file and directory synchronization tool
openssh-client \           # OpenSSH client
tmux \                     # Terminal multiplexer
screen \                   # Terminal multiplexer
python3 \                  # Python 3 interpreter
make \                     # Build automation tool
autoconf \                 # Automatically configure source code
automake \                 # Tool for generating Makefile.in files
binutils \                 # Binary utilities
libtool \                  # Generic library support script
pkg-config \               # Manage compile and link flags
cmake \                    # Build system generator
gdb \                      # GNU Debugger
strace \                   # Trace system calls and signals
ltrace \                   # Trace library calls
tcpdump \                  # Network packet analyzer
netcat \                   # Network utility for reading/writing data
nmap \                     # Network exploration tool and security/port scanner
openssl \                  # Toolkit for SSL/TLS
sqlite3 \                  # SQLite 3 command-line interface
jq \                       # Command-line JSON processor
xmlstarlet \               # XML toolkit
dos2unix \                 # Convert text files between DOS and Unix formats
unix2dos \                 # Convert text files between Unix and DOS formats
zip \                      # Archiver for .zip files
unzip \                    # De-archiver for .zip files
p7zip-full \               # Command-line version of 7-Zip for file compression
bc \                       # Arbitrary precision calculator
ncurses \                  # Terminal handling library
readline \                 # GNU Readline library
zlib \                     # Compression library
libxml2 \                  # XML parsing library
libxslt \                  # XSLT processing library
imagemagick \              # Suite of tools for image manipulation
ffmpeg \                   # Multimedia framework for handling video, audio, and other multimedia files
ghostscript \              # Interpreter for the PostScript language and for PDF
gnupg \                    # GNU Privacy Guard for encryption and signing
htop \                     # Interactive process viewer
procps-ng \                # System monitoring utilities
psmisc \                   # Miscellaneous system utilities
pv \                       # Monitor the progress of data through a pipe
tree \                     # Displays directory structure in a tree-like format
ncdu \                     # Disk usage analyzer with an ncurses interface
mc \                       # Midnight Commander file manager
lynx \                     # Text-based web browser
w3m \                      # Text-based web browser
links \                    # Text-based web browser
irssi \                    # Terminal-based IRC client
weechat \                  # Terminal-based chat client
fzf \                      # General-purpose command-line fuzzy finder
ripgrep \                  # Fast search tool that recursively searches your current directory
fd \                       # Simple, fast and user-friendly alternative to 'find'
bat \                      # Cat clone with syntax highlighting and Git integration
exa \                      # Modern replacement for `ls`
tldr \                     # Simplified man pages with practical examples
shellcheck \               # Shell script analysis tool
pandoc \                   # Universal document converter
asciidoc \                 # Text-based document format
texinfo \                  # Documentation system
groff \                    # GNU troff document formatting system
man-db \                   # Manual pager utilities
manpages \                 # Man pages
cpio \                     # Archive utility
lhasa \                    # Lhasa archive utility
unace \                    # Extract files from .ace archives
rar \                      # RAR archive utility
unrar \                    # Extract files from .rar archives
lzip \                     # Lzip compression utility
lzop \                     # LZOP compression utility
lz4 \                      # LZ4 compression utility
zstd \                     # Zstandard compression
mtools \                   # Tools for manipulating FAT filesystems
dosfstools \               # Tools for making and checking MS-DOS FAT filesystems
ntfs-3g \                  # NTFS filesystem driver with read-write support
genisoimage \              # Tool for creating ISO images
p7zip-full \               # Command-line version of 7-Zip for file compression
fdupes \                   # Duplicate file finder
ranger \                   # Console file manager with vi-like keybindings
htop \                     # Interactive process viewer
tldr \                     # Simplified man pages with practical examples
jq \                       # Command-line JSON processor
vim \                      # Highly configurable text editor
neofetch \                 # Display system information in terminal
bat \                      # Cat clone with syntax highlighting and Git integration
fd \                       # Simple, fast and user-friendly alternative to 'find'
ripgrep \                  # Fast search tool that recursively searches your current directory
tree \                     # Displays directory structure in a tree-like format
entr \                     # Run arbitrary commands when files change
exiftool \                 # Read, write, and edit meta information in files
imagemagick \              # Suite of tools for image manipulation
ssh \                      # Secure shell for remote login
docker \                   # Containerization platform
docker-compose \           # Tool for defining and running multi-container Docker applications
ansible \                  # Automation tool for configuration management
nmap \                     # Network exploration tool and security/port scanner
vlc \                      # Multimedia player and streaming server
ffmpeg \                   # Multimedia framework for handling video, audio, and other multimedia files
gnome-tweaks \             # Tool for advanced GNOME settings management
gnome-shell-extensions \   # Extensions for customizing GNOME Shell
kdenlive \                 # Video editing software
gimp \                     # GNU Image Manipulation Program
audacity \                 # Audio editing software
pinta \                    # Simple drawing and image editing program
synaptic \                 # Graphical package manager for apt
bleachbit \                # Disk cleanup utility
duplicity \                # Encrypted bandwidth-efficient backup using the rsync algorithm
lsof \                     # List open files
glances \                  # Cross-platform monitoring tool for system resources
btop \                     # Aesthetic system monitor
gdebi \                    # Simple tool to install .deb files
pikaur \                   # AUR helper for Arch Linux
neovim \                   # Modern text editor based on Vim
thefuck \                  # Corrects errors in previous console commands
detox \                    # Renames files to make them more usable


sudo apt install --ignore-missing -y \
build-essential \          # Essential packages for building software
util-linux \               # Miscellaneous utilities from the Linux kernel
busybox \                  # Small Swiss Army knife of Linux
git \                      # Version control system
curl \                     # Tool for transferring data with URLs
wget \                     # Non-interactive network downloader
vim \                      # Highly configurable text editor
nano \                     # Simple text editor
htop \                     # Interactive process viewer
tree \                     # Displays directory structure in a tree-like format
gnupg \                    # GNU Privacy Guard for encryption and signing
software-properties-common \# Software source management tools
apt-transport-https \      # APT transport for HTTPS
ca-certificates \           # Common CA certificates
openssl \                  # Toolkit for SSL/TLS
jq \                       # Command-line JSON processor
dnsutils \                 # DNS utilities
net-tools \                # Networking tools
iputils-ping \              # Ping utility
tcpdump \                  # Network packet analyzer
iptables \                 # IP packet filter
traceroute \               # Network diagnostic tool
uuid-runtime \             # UUID utilities
zip \                      # Archiver for .zip files
ffmpeg \                   # Multimedia framework for handling video, audio, and other multimedia files
unzip \                    # De-archiver for .zip files
tar \                      # Archive utility
gzip \                     # GNU compression utility
bzip2 \                    # Block-sorting file compressor
xz-utils \                 # XZ-format compression utilities
file \                     # Determine file types
gnupg2 \                   # GNU Privacy Guard (version 2)
gawk \                     # Pattern scanning and processing language
gettext \                  # GNU internationalization library
7zip-full \                # Command-line version of 7-Zip for file compression
ncdu \                     # NCurses Disk Usage
locales \                  # Locale data
strace \                   # Trace system calls and signals
lsof \                     # List open files
sysstat \                  # System performance monitoring tools
time \                     # Measure program resource usage
watch \                    # Execute a program periodically
whois \                    # Whois query program
zstd \                     # Zstandard compression
parallel \                 # Shell tool for executing jobs in parallel
dislocker \                # Utility for accessing BitLocker encrypted drives
bleachbit \                # Disk cleanup utility
multitail \                # Tail multiple files
vnstat \                   # Network traffic monitor
