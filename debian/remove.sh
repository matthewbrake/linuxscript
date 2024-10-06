apt-get remove --purge -y \
    gnome* \
    kde* \
    xfce* \
    lxde* \
    cinnamon* \
    mate* \
    *desktop-environment* \
    *gui* \
    *xserver* \
    xorg* \
    lightdm \
    gdm \
    sddm

sudo apt purge \
  cinnamon* \
  gnome-* \
  mate-* \
  xfce4* \
  light-locker* \
  lightdm* \
  papirus-icon-theme \
  yaru-theme-icon \
  breeze* \
  greybird-gtk-theme \
  *-icon-theme \
  fonts-*
# Clean up unused packages
apt-get autoremove -y
apt-get clean

###
#!/bin/bash

# Update package lists
apt update

# Remove unnecessary packages
apt purge -y \
    gnome-games libreoffice-* gimp transmission-* brasero \
    sound-juicer gnome-music totem rhythmbox gnome-maps \
    gnome-weather gnome-photos cheese

# Remove language packs except English
apt purge -y $(check-language-support -l en)

# Remove unused fonts
apt purge -y $(dpkg-query -W -f='${Package}\n' | grep font | grep -v cinnamon)

# Remove documentation
echo "path-exclude /usr/share/doc/*" >> /etc/dpkg/dpkg.cfg.d/01_nodoc
echo "path-exclude /usr/share/man/*" >> /etc/dpkg/dpkg.cfg.d/01_nodoc
echo "path-exclude /usr/share/groff/*" >> /etc/dpkg/dpkg.cfg.d/01_nodoc
echo "path-exclude /usr/share/info/*" >> /etc/dpkg/dpkg.cfg.d/01_nodoc
echo "path-exclude /usr/share/lintian/*" >> /etc/dpkg/dpkg.cfg.d/01_nodoc
echo "path-exclude /usr/share/linda/*" >> /etc/dpkg/dpkg.cfg.d/01_nodoc

# Remove locales except English
echo "path-exclude /usr/share/locale/*" >> /etc/dpkg/dpkg.cfg.d/01_nolocale
echo "path-include /usr/share/locale/en*" >> /etc/dpkg/dpkg.cfg.d/01_nolocale

# Configure APT to not install recommended packages
echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/01norecommend

# Install deborphan to find orphaned packages
apt install -y deborphan

# Remove orphaned packages
deborphan | xargs apt purge -y

# Remove unnecessary kernels (keep only the latest)
apt purge -y $(dpkg -l | awk '/^ii  linux-(image|headers)-[^ ]+/{print $2}' | grep -v $(uname -r))

# Clean up APT cache
apt clean

# Remove unnecessary files
rm -rf /usr/share/doc/*
rm -rf /usr/share/man/*
rm -rf /var/cache/apt/archives/*
rm -rf /var/lib/apt/lists/*

# Autoremove dependencies that are no longer needed
apt autoremove -y

# Final update and upgrade
apt update
apt upgrade -y


sudo apt purge $(aptitude search '~i!~M!~prequired!~pimportant!~R~prequired!~R~pimportant!~R~R~prequired!~R~R~pimportant' | awk '{print $2}')
sudo apt autoremove --purge
